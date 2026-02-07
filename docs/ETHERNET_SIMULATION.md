# Ethernet Simulation (Flow-Level)

This document describes the first-iteration Ethernet simulation model, how to run it, and the YAML/JSON config schema.

## What the simulation does

- Flow-level simulation: aggregate throughput and latency per flow.
- Uses device/connection topology + traffic profiles to compute link utilization.
- Applies basic firewall rules to allow/deny flows.
- Returns per-flow metrics and per-link utilization.

## How to run

1. Import a YAML/JSON config (see sample files in `Tests/`).
2. Open **Simulation** in the UI and choose the system/version.
3. Run the simulation to get flow/link results.

## Quick start (5 minutes)

1. Start Docker: `docker compose up --build`
2. Sign in (default user: `example` / `123456`)
3. Go to **Simulation**
4. Import `Tests/ethernet_office.yaml`
5. Select the new system and click **Run**

## YAML/JSON schema (v1)

```yaml
system:
  name: "Office-Network"
  version: 1

devices:
  - id: "core-sw1"
    name: "CoreSwitch-1"
    type: "switch" # switch | firewall | host
    vendor: "Cisco"
    model: "C9300-24T"
    role: "core"
    mgmt_ip: "10.0.0.10"
    ip: "192.168.1.1"
    online: true
    os: "IOS-XE"
    attributes:
      rack: "DC1-R1"
      poe_budget_w: 0
    ports:
      - name: "Gi1/0/1"
        speed_mbps: 1000
        trunk: true
        allowed_vlans: [10, 20]
        native_vlan: 10
        mtu: 1500
        admin_up: true
        poe: false
        lag: "Po1"
  - id: "fw1"
    name: "Firewall-1"
    type: "firewall"
    vendor: "PaloAlto"
    model: "PA-220"
  - id: "host-a"
    name: "Host-A"
    type: "host"
    attributes:
      ip: "10.10.10.20/24"
      gateway: "10.10.10.1"

links:
  - from: "core-sw1"
    to: "fw1"
    bandwidth_mbps: 1000
    latency_ms: 1
    trunk: true
    allowed_vlans: [10, 20]
    error_rate: 0.001
    details:
      medium: "fiber"
      jitter_ms: 0.2

traffic_profiles:
  - device: "host-a"
    name: "web-traffic"
    flows:
      - to: "host-b"
        protocol: "tcp"
        dst_port: 443
        rate_mbps: 50
        vlan: 10
        duration_s: 120
        start_s: 5
        burst_mbps: 100

firewall_rules:
  - device: "fw1"
    action: "deny"
    protocol: "tcp"
    dst_port: 22
    direction: "outbound"
    stateful: true
```

## Output schema (summary)

```json
{
  "flows": [
    {
      "status": "ok",
      "source": "host-a",
      "destination": "host-b",
      "requested_mbps": 50,
      "achieved_mbps": 50,
      "latency_ms": 2,
      "path": [{"from":"core-sw1","to":"fw1"}]
    }
  ],
  "links": [
    {
      "from": "core-sw1",
      "to": "fw1",
      "capacity_mbps": 1000,
      "utilization": 0.05
    }
  ]
}
```

## Notes and constraints

- This is not a packet simulator. It models flows and capacity constraints.
- VLAN handling is first-iteration: mainly validation and tagging in configs.
- Firewall rules are basic and match protocol/ports/labels.
- Extra fields in `attributes` or `details` are stored but may not affect v1 results.
- If no traffic profiles are provided, hosts generate default TCP traffic on port 443.
