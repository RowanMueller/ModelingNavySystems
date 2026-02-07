from collections import deque, defaultdict


DEFAULT_LINK_BW = 1000.0
DEFAULT_LINK_LATENCY = 1.0


def _device_label(device):
    return device.AssetId or device.AssetName or str(device.id)


def _device_type(device):
    if getattr(device, "DeviceType", None):
        return str(device.DeviceType).lower()
    extra = getattr(device, "AdditionalAsJson", None) or {}
    return str(extra.get("deviceType") or extra.get("DeviceType") or "generic").lower()


def _is_online(device):
    return bool(getattr(device, "IsOnline", True))


def _traffic_rate(device, default=10):
    extra = getattr(device, "AdditionalAsJson", None) or {}
    return float(extra.get("TrafficRateMbps", default))

def build_graph(connections):
    graph = defaultdict(list)
    for conn in connections:
        graph[conn.Source_id].append((conn.Target_id, conn))
        graph[conn.Target_id].append((conn.Source_id, conn))
    return graph


def find_path(graph, src_id, dst_id):
    if src_id == dst_id:
        return []
    queue = deque([src_id])
    prev = {src_id: None}
    prev_conn = {}
    while queue:
        current = queue.popleft()
        for neighbor_id, conn in graph.get(current, []):
            if neighbor_id in prev:
                continue
            prev[neighbor_id] = current
            prev_conn[neighbor_id] = conn
            if neighbor_id == dst_id:
                queue.clear()
                break
            queue.append(neighbor_id)
    if dst_id not in prev:
        return None
    path = []
    step = dst_id
    while prev[step] is not None:
        path.append(prev_conn[step])
        step = prev[step]
    path.reverse()
    return path


def compute_simulation(devices, connections, traffic_profiles, firewall_rules):
    device_by_id = {device.id: device for device in devices}
    device_by_label = {_device_label(device): device for device in devices}
    graph = build_graph(connections)
    link_utilization = defaultdict(float)
    flows_out = []
    profiles = list(traffic_profiles)

    firewall_by_device = defaultdict(list)
    for rule in firewall_rules:
        firewall_by_device[rule.Device_id].append(rule)

    def rule_matches(rule, flow):
        if rule.Protocol and rule.Protocol.lower() != flow["protocol"].lower():
            return False
        if rule.Src and rule.Src not in {flow["src_label"], flow["src_id"]}:
            return False
        if rule.Dst and rule.Dst not in {flow["dst_label"], flow["dst_id"]}:
            return False
        if rule.SrcPort and rule.SrcPort != flow.get("src_port"):
            return False
        if rule.DstPort and rule.DstPort != flow.get("dst_port"):
            return False
        if rule.Vlan and rule.Vlan != flow.get("vlan"):
            return False
        return True

    if not profiles:
        host_devices = [d for d in devices if _device_type(d) == "host"]
        for src in host_devices:
            if not _is_online(src):
                continue
            for dst in host_devices:
                if src.id == dst.id or not _is_online(dst):
                    continue
                profiles.append(
                    type("Profile", (), {
                        "Device": src,
                        "Profile": {
                            "flows": [
                                {
                                    "to": _device_label(dst),
                                    "protocol": "tcp",
                                    "dst_port": 443,
                                    "rate_mbps": _traffic_rate(src, 10),
                                }
                            ]
                        },
                    })
                )

    for profile in profiles:
        profile_data = profile.Profile or {}
        flows = profile_data.get("flows", [])
        for flow in flows:
            src_device = profile.Device
            if not _is_online(src_device):
                flows_out.append(
                    {
                        "status": "down",
                        "reason": "source_offline",
                        "source": _device_label(src_device),
                        "destination": flow.get("to") or flow.get("to_device"),
                    }
                )
                continue
            dst_label = flow.get("to") or flow.get("to_device")
            dst_device = device_by_label.get(dst_label)
            if not dst_device and flow.get("to_id"):
                dst_device = device_by_id.get(flow.get("to_id"))

            if not dst_device:
                flows_out.append(
                    {
                        "status": "error",
                        "reason": "destination_not_found",
                        "source": _device_label(src_device),
                        "destination": dst_label,
                    }
                )
                continue

            if not _is_online(dst_device):
                flows_out.append(
                    {
                        "status": "down",
                        "reason": "destination_offline",
                        "source": _device_label(src_device),
                        "destination": _device_label(dst_device),
                    }
                )
                continue

            path = find_path(graph, src_device.id, dst_device.id)
            if path is None:
                flows_out.append(
                    {
                        "status": "error",
                        "reason": "no_path",
                        "source": _device_label(src_device),
                        "destination": _device_label(dst_device),
                    }
                )
                continue

            flow_record = {
                "status": "ok",
                "source": _device_label(src_device),
                "destination": _device_label(dst_device),
                "protocol": flow.get("protocol", "tcp"),
                "src_port": flow.get("src_port"),
                "dst_port": flow.get("dst_port") or 443,
                "vlan": flow.get("vlan"),
                "requested_mbps": float(flow.get("rate_mbps", _traffic_rate(src_device, 10))),
                "path": [],
            }

            flow_for_rules = {
                "protocol": flow_record["protocol"],
                "src_port": flow_record["src_port"],
                "dst_port": flow_record["dst_port"],
                "vlan": flow_record["vlan"],
                "src_label": flow_record["source"],
                "dst_label": flow_record["destination"],
                "src_id": src_device.id,
                "dst_id": dst_device.id,
            }

            blocked = False
            for conn in path:
                for device_id in (conn.Source_id, conn.Target_id):
                    for rule in firewall_by_device.get(device_id, []):
                        if rule_matches(rule, flow_for_rules):
                            if rule.Action.lower() == "deny":
                                blocked = True
                                flow_record["status"] = "blocked"
                                flow_record["blocked_by"] = _device_label(
                                    device_by_id.get(device_id)
                                )
                                break
                    if blocked:
                        break
                if blocked:
                    break

            total_latency = 0.0
            for conn in path:
                flow_record["path"].append(
                    {
                        "from": _device_label(device_by_id[conn.Source_id]),
                        "to": _device_label(device_by_id[conn.Target_id]),
                    }
                )
                total_latency += conn.LatencyMs or DEFAULT_LINK_LATENCY

            if blocked:
                flow_record["achieved_mbps"] = 0
                flow_record["latency_ms"] = total_latency
                flows_out.append(flow_record)
                continue

            requested = flow_record["requested_mbps"]
            for conn in path:
                capacity = conn.BandwidthMbps or DEFAULT_LINK_BW
                link_utilization[conn.id] += requested / max(capacity, 1)

            bottleneck = requested
            for conn in path:
                capacity = conn.BandwidthMbps or DEFAULT_LINK_BW
                utilization = link_utilization[conn.id]
                if utilization > 1:
                    bottleneck = min(bottleneck, capacity / utilization)

            flow_record["achieved_mbps"] = round(bottleneck, 3)
            flow_record["latency_ms"] = round(total_latency, 3)
            flows_out.append(flow_record)

    link_stats = []
    for conn in connections:
        capacity = conn.BandwidthMbps or DEFAULT_LINK_BW
        utilization = link_utilization.get(conn.id, 0)
        link_stats.append(
            {
                "from": _device_label(device_by_id[conn.Source_id]),
                "to": _device_label(device_by_id[conn.Target_id]),
                "capacity_mbps": capacity,
                "utilization": round(utilization, 3),
            }
        )

    return {"flows": flows_out, "links": link_stats}
