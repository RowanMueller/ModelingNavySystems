import React, { useCallback, useEffect, useRef, useState } from "react";
import {
  ReactFlow,
  MiniMap,
  Controls,
  Background,
  useNodesState,
  addEdge,
  ReactFlowProvider,
} from "@xyflow/react";
import { useNavigate, useLocation, useParams } from "react-router-dom";
import { Plus, Save, Download, X, Trash, ArrowLeft } from "lucide-react";
import "@xyflow/react/dist/style.css";
import axios from "axios";
import { toast } from "react-hot-toast";
import CustomEdge from "./CustomEdge";
import useGraph from "./useGraph";
import GraphProvider from "./GraphProvider";
import dagre from "dagre";
import CustomNode from "./CustomNode";

// const initialNodes = [
//   {
//     id: "1",
//     position: { x: 0, y: 0 },
//     data: {
//       label: "1",
//     },
//   },
//   { id: "2", position: { x: 0, y: 100 }, data: { label: "2" } },
// ];
// const initialEdges = [{ id: "e1-2", source: "1", target: "2" }];

const initialNodes = [];

// Define edgeTypes outside the component
const edgeTypes = {
  custom: CustomEdge,
};
const nodeTypes = {
  custom: CustomNode,
};

const NODE_WIDTH = 220;
const NODE_HEIGHT = 70;

const LAN_BASE = "192.168.1.";

const buildLayout = (nodes, edges) => {
  const layoutGraph = new dagre.graphlib.Graph();
  layoutGraph.setDefaultEdgeLabel(() => ({}));
  layoutGraph.setGraph({ rankdir: "LR", nodesep: 80, ranksep: 120 });

  nodes.forEach((node) => {
    layoutGraph.setNode(node.id, { width: NODE_WIDTH, height: NODE_HEIGHT });
  });

  edges.forEach((edge) => {
    layoutGraph.setEdge(edge.source, edge.target);
  });

  dagre.layout(layoutGraph);

  return nodes.map((node) => {
    const { x, y } = layoutGraph.node(node.id);
    return {
      ...node,
      position: { x: x - NODE_WIDTH / 2, y: y - NODE_HEIGHT / 2 },
      positionAbsolute: { x: x - NODE_WIDTH / 2, y: y - NODE_HEIGHT / 2 },
    };
  });
};

const shouldAutoLayout = (nodes) =>
  nodes.every((node) => {
    const x = Number(node.position?.x ?? 0);
    const y = Number(node.position?.y ?? 0);
    return x === 0 && y === 0;
  });

const normalizeDeviceType = (device, additional) => {
  const raw =
    device.DeviceType ||
    additional?.DeviceType ||
    additional?.deviceType ||
    (additional?.role === "iot" ? "host" : null);
  if (!raw || raw === "generic") {
    return additional?.ip ? "host" : "switch";
  }
  return String(raw).toLowerCase();
};

const assignLanIp = (index) => `${LAN_BASE}${100 + index}`;

const applyNodeStyling = (node) => {
  const isOnline = node.data.IsOnline !== false;
  const type = node.data.DeviceType;
  let bg = "#e5f4ff";
  let border = "#60a5fa";
  if (type === "switch") {
    bg = "#eef2ff";
    border = "#6366f1";
  } else if (type === "host") {
    bg = "#ecfeff";
    border = "#06b6d4";
  }
  if (!isOnline) {
    bg = "#f3f4f6";
    border = "#9ca3af";
  }
  return {
    ...node,
    style: {
      background: bg,
      border: `2px solid ${border}`,
      borderRadius: "10px",
      opacity: isOnline ? 1 : 0.6,
    },
  };
};

const applyEdgeStatus = (nodes, edges) => {
  const nodeById = new Map(nodes.map((node) => [node.id, node]));
  const rateByNodeId = new Map(
    nodes.map((node) => [
      node.id,
      Number(node.data?.TrafficRateMbps ?? 10),
    ])
  );
  return edges.map((edge) => {
    const source = nodeById.get(edge.source);
    const target = nodeById.get(edge.target);
    const sourceOnline = source?.data?.IsOnline !== false;
    const targetOnline = target?.data?.IsOnline !== false;
    const sourceType = source?.data?.DeviceType;
    const targetType = target?.data?.DeviceType;
    const capacity = Number(edge.data?.BandwidthMbps ?? 1000);
    const sourceRate = rateByNodeId.get(edge.source) || 0;
    const targetRate = rateByNodeId.get(edge.target) || 0;
    const utilization = Math.min(
      1,
      (sourceRate + targetRate) / Math.max(capacity, 1)
    );
    const animate =
      sourceOnline &&
      targetOnline &&
      (sourceType === "host" || targetType === "host");
    return {
      ...edge,
      data: {
        ...edge.data,
        animate,
        utilization,
        status: sourceOnline && targetOnline ? "up" : "down",
      },
    };
  });
};

export default function GraphPage() {
  return (
    <ReactFlowProvider>
      <GraphProvider>
        <GraphContent />
      </GraphProvider>
    </ReactFlowProvider>
  );
}

function GraphContent() {
  const navigate = useNavigate();
  const [nodes, setNodes, onNodesChange] = useNodesState(initialNodes);
  const {
    edges,
    setEdges,
    onEdgesChange,
    selectedEdge,
    setSelectedEdge,
    selectedNode,
    setSelectedNode,
    focusedNode,
    setFocusedNode,
    heatMode,
    setHeatMode,
  } = useGraph();
  const [flowInstance, setFlowInstance] = useState(null);
  const [onDelete, setOnDelete] = useState(false);
  const [newProperty, setNewProperty] = useState("");
  const [onSavingProcessing, setOnSavingProcessing] = useState(false);
  const [newConnectionProperty, setNewConnectionProperty] = useState("");
  const location = useLocation();
  const { version } = useParams();

  const system = location.state.system;

  const popupRef = useRef(null);
  const [isEditingName, setIsEditingName] = useState(false);
  const [systemName, setSystemName] = useState(system.Name);

  const onConnect = useCallback(
    (params) => {
      const newEdge = {
        ...params,
        type: "custom",
        data: {
          label: "New Connection",
          connectionDetails: {},
        },
      };
      setEdges((eds) => addEdge(newEdge, eds));
    },
    [setEdges]
  );

  const onEdgeClick = useCallback(
    (event, edge) => {
      setSelectedEdge(edge);
    },
    [setSelectedEdge]
  );

  const handleKeyDown = useCallback((event) => {
    if (event.key === "Escape") {
      setSelectedNode(null);
    }
    if ((event.metaKey || event.ctrlKey) && event.key.toLowerCase() === "d") {
      event.preventDefault();
      if (focusedNode) {
        const newNodeId = `new-${String(nodes.length + 1)}`;
        setNodes((nds) => [
          ...nds,
          {
            id: newNodeId,
            position: {
              x: focusedNode.position.x + 300,
              y: focusedNode.position.y,
            },
            data: {
              ...focusedNode.data,
              label: `${focusedNode.data.label} (copy)`,
            },
          },
        ]);
      }
    }
  }, [focusedNode, nodes.length, setNodes, setSelectedNode]);

  useEffect(() => {
    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, [handleKeyDown]);

  useEffect(() => {
    const fetchData = async () => {
      let newNodes = [];

      await axios
        .get(
          `${import.meta.env.VITE_BASE_URL}/api/v1/${
            system.id
          }/${version}/get-devices`,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("access_token")}`,
            },
          }
        )
        .then((res) => {
          newNodes = res.data.map((device, i) => {
            const {
              AdditionalAsJson,
              Xposition,
              Yposition,
              System,
              DeviceType,
              IpAddress,
              IsOnline,
              ...deviceData
            } = device;
            const deviceType = normalizeDeviceType(device, AdditionalAsJson);
            const ipAddress =
              IpAddress ||
              AdditionalAsJson?.ip ||
              (deviceType === "host" ? assignLanIp(i + 1) : "");
            const isOnline = IsOnline !== false;

            const baseLabel =
              device.AssetName || device.AssetId || `Device ${i + 1}`;
            const label =
              deviceType === "host" && ipAddress
                ? `${baseLabel} (${ipAddress})`
                : baseLabel;

            return {
              id: String(i + 1),
              position: {
                x: Xposition,
                y: Yposition,
              },
              type: "custom",
              data: {
                label,
                ...deviceData,
                ...(AdditionalAsJson || {}),
                DeviceType: deviceType,
                IpAddress: ipAddress,
                IsOnline: isOnline,
                TrafficRateMbps:
                  AdditionalAsJson?.TrafficRateMbps ??
                  (deviceType === "host" ? 10 : 0),
              },
            };
          });
        });

      await axios
        .get(
          `${import.meta.env.VITE_BASE_URL}/api/v1/${
            system.id
          }/${version}/get-connections`,
          {
            headers: {
              "Content-Type": "application/json",
              Authorization: `Bearer ${localStorage.getItem("access_token")}`,
            },
          }
        )
        .then((res) => {
          const newEdges = res.data.map((connection, i) => {
            const bandwidth =
              connection.BandwidthMbps ??
              connection.ConnectionDetails?.bandwidth_mbps;
            const latency =
              connection.LatencyMs ??
              connection.ConnectionDetails?.latency_ms;
            const label =
              connection.ConnectionType &&
              connection.ConnectionType !== "ethernet"
                ? connection.ConnectionType
                : bandwidth
                ? `${bandwidth} Mbps`
                : "ethernet";
            return {
              id: String(i + 1),
              source: newNodes.find(
                (node) => node.data.id === connection.Source
              ).id,
              target: newNodes.find(
                (node) => node.data.id === connection.Target
              ).id,
              data: {
                label,
                ...connection.ConnectionDetails,
                BandwidthMbps: bandwidth,
                LatencyMs: latency,
              },
              type: "custom",
            };
          });
          const positionedNodes = shouldAutoLayout(newNodes)
            ? buildLayout(newNodes, newEdges)
            : newNodes;
          const styledNodes = positionedNodes.map(applyNodeStyling);
          setNodes(styledNodes);
          setEdges(applyEdgeStatus(styledNodes, newEdges));
        });
    };

    fetchData();
  }, [version]);

  useEffect(() => {
    setEdges((eds) => applyEdgeStatus(nodes, eds));
  }, [nodes, setEdges]);

  const handleSave = async () => {
    if (!flowInstance || onSavingProcessing) return;
    setOnSavingProcessing(true);
    axios
      .post(
        `${import.meta.env.VITE_BASE_URL}/api/v1/${system.id}/save-graph/`,
        {
          version: system.Version,
          devices: nodes,
          connections: edges,
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("access_token")}`,
          },
        }
      )
      .then(() => {
        toast.success("Graph saved successfully");
        setOnSavingProcessing(false);
        navigate(`/system/${system.id}/${system.Version + 1}`, {
          state: {
            system: {
              ...system,
              Version: system.Version + 1,
            },
          },
        });
      })
      .catch((err) => {
        toast.error("Error saving graph");
        console.log(err);
        setOnSavingProcessing(false);
      });
  };

  const onNodeClick = useCallback((event, node) => {
    setSelectedNode(node);
  }, []);

  const onNodeMouseEnter = useCallback((event, node) => {
    setFocusedNode(node);
  }, []);

  const onNodeMouseLeave = useCallback(() => {
    setFocusedNode(null);
  }, []);

  const handleNameSave = async () => {
    try {
      await axios.patch(
        `${import.meta.env.VITE_BASE_URL}/api/v1/${system.id}/rename-system/`,
        { name: systemName },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${localStorage.getItem("access_token")}`,
          },
        }
      );
      system.Name = systemName;
      setIsEditingName(false);
      toast.success("System name updated successfully");
    } catch (err) {
      toast.error("Error updating system name");
      setSystemName(system.Name);
      console.error(err);
    }
  };

  return (
    <div className="h-screen overflow-hidden">
      {/* Sidebar */}
      <div className="fixed top-0 left-0 z-10 w-[350px] h-full bg-gradient-to-br from-blue-400/20 via-indigo-500/20 to-cyan-500/20 animate-gradient bg-[length:400%_400%] bg-white/80 backdrop-blur-md border-r border-white/20 p-6 flex flex-col shadow-xl">
        <div className="flex flex-col h-full">
          <button
            onClick={() => navigate("/dashboard")}
            className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 flex items-center justify-center border border-blue-400/20 shadow-lg"
          >
            <ArrowLeft className="w-5 h-5" />
            <span className="ml-2">Back</span>
          </button>
          <h2 className="text-lg font-semibold text-gray-900 mt-6">System:</h2>
          <div className="flex items-center space-x-2">
            {isEditingName ? (
              <div className="flex-1 flex items-center space-x-2 w-full relative">
                <input
                  type="text"
                  value={systemName}
                  onChange={(e) => setSystemName(e.target.value)}
                  onKeyDown={(e) => {
                    if (e.key === "Enter") {
                      handleNameSave();
                    } else if (e.key === "Escape") {
                      setSystemName(system.Name);
                      setIsEditingName(false);
                    }
                  }}
                  className="w-full flex-1 px-3 pr-20 py-2 bg-white/50 border border-gray-200 rounded-lg text-2xl font-bold focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
                  autoFocus
                />
                <button
                  onClick={handleNameSave}
                  className="p-2 hover:bg-blue-100 rounded-lg text-blue-600 transition-colors duration-200 absolute right-2"
                >
                  <Save className="w-5 h-5" />
                </button>
                <button
                  onClick={() => {
                    setSystemName(system.Name);
                    setIsEditingName(false);
                  }}
                  className="p-2 hover:bg-red-100 rounded-lg text-red-600 transition-colors duration-200 absolute right-12"
                >
                  <X className="w-5 h-5" />
                </button>
              </div>
            ) : (
              <h1
                onClick={() => setIsEditingName(true)}
                className="text-2xl font-bold text-gray-900 cursor-pointer hover:bg-white/30 px-3 py-2 rounded-lg transition-all duration-200 flex-1"
              >
                {systemName}
              </h1>
            )}
            <div className="inline-flex items-center">
              <select
                value={version}
                onChange={(e) => {
                  const newVersion = e.target.value;
                  if (newVersion !== version) {
                    navigate(`/system/${system.id}/${newVersion}`, {
                      state: { system: system },
                    });
                  }
                }}
                className="text-sm bg-white/50 border border-gray-200 text-gray-700 rounded-lg px-2 py-1 focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200 cursor-pointer hover:bg-white/70"
              >
                {Array.from({ length: system.Version }, (_, i) => (
                  <option key={i + 1} value={i + 1}>
                    version-{i + 1}
                  </option>
                ))}
              </select>
            </div>
          </div>

          <div className="flex flex-col space-y-3 mt-6">
            <button
              onClick={() => {
                flowInstance.setCenter(0, 0, { zoom: 1, duration: 1000 });
                setNodes((nds) => [
                  ...nds,
                  {
                    id: `new-${String(nds.length + 1)}`,
                    position: { x: 0, y: 0 },
                    data: {
                      label: "New Device",
                      SystemVersion: system.Version,
                      AssetId: "",
                    },
                  },
                ]);
              }}
              className="px-4 py-3 bg-green-500/90 backdrop-blur-md text-white rounded-lg hover:bg-green-600/90 transition-all duration-300 flex items-center justify-center border border-green-400/20 shadow-lg"
            >
              <Plus className="w-5 h-5" />
              <span className="ml-2">Add New Device</span>
            </button>

            <button
              onClick={handleSave}
              className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 flex items-center justify-center border border-blue-400/20 shadow-lg"
            >
              <Save className="w-5 h-5" />
              <span className="ml-2">Save Graph</span>
            </button>

            <button
              onClick={() => {
                setNodes((nds) =>
                  buildLayout(nds, edges).map(applyNodeStyling)
                );
              }}
              className="px-4 py-3 bg-indigo-500/90 backdrop-blur-md text-white rounded-lg hover:bg-indigo-600/90 transition-all duration-300 flex items-center justify-center border border-indigo-400/20 shadow-lg"
            >
              <span className="ml-2">Auto Layout</span>
            </button>

            <button
              onClick={() => setHeatMode((prev) => !prev)}
              className="px-4 py-3 bg-orange-500/90 backdrop-blur-md text-white rounded-lg hover:bg-orange-600/90 transition-all duration-300 flex items-center justify-center border border-orange-400/20 shadow-lg"
            >
              <span className="ml-2">
                {heatMode ? "Hide Heat" : "Traffic Heat"}
              </span>
            </button>

            <button
              onClick={() => {
                axios
                  .get(
                    `${import.meta.env.VITE_BASE_URL}/api/v1/${
                      system.id
                    }/${version}/download-sysml`,
                    {
                      headers: {
                        Authorization: `Bearer ${localStorage.getItem(
                          "access_token"
                        )}`,
                      },
                      responseType: "blob",
                    }
                  )
                  .then((res) => {
                    const blob = new Blob([res.data], {
                      type: res.headers["content-type"],
                    });
                    let filename =
                      system.Name + "_v" + system.Version + ".sysml";
                    const contentDisposition =
                      res.headers["content-disposition"];
                    if (contentDisposition) {
                      const match =
                        contentDisposition.match(/filename="?([^"]+)"?/);
                      if (match) filename = match[1];
                    }
                    const url = window.URL.createObjectURL(blob);
                    const link = document.createElement("a");
                    link.href = url;
                    link.setAttribute("download", filename);
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                    window.URL.revokeObjectURL(url);
                  });
              }}
              className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 flex items-center justify-center border border-blue-400/20 shadow-lg"
            >
              <Download className="w-5 h-5" />
              <span className="ml-2">Download SysML</span>
            </button>

            <button
              onClick={() => setOnDelete(true)}
              className="px-4 py-3 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 flex items-center justify-center border border-red-400/20 shadow-lg"
            >
              <Trash className="w-5 h-5" />
              <span className="ml-2">Delete System</span>
            </button>
          </div>

          <div className="border-t border-gray-200/50 mt-6 flex-1 overflow-hidden flex flex-col">
            <h2 className="text-lg font-semibold text-gray-900 my-4">
              System Versions
            </h2>
            <div className="flex-1 overflow-y-auto space-y-2 pr-2">
              {Array.from({ length: system.Version }, (_, i) => (
                <button
                  key={i}
                  onClick={() => {
                    if (i + 1 !== version) {
                      navigate(`/system/${system.id}/${i + 1}`, {
                        state: { system: system },
                      });
                    }
                  }}
                  className={`w-full px-4 py-3 rounded-lg transition-all duration-200 flex items-center ${
                    i + 1 === parseInt(version)
                      ? "bg-blue-500/90 text-white"
                      : "bg-white/50 hover:bg-white/70 text-gray-700"
                  }`}
                >
                  Version {i + 1}
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="ml-[350px] h-screen">
        <div className="text-black absolute right-2 top-2 flex flex-col gap-2 items-end">
          <div className="bg-white/80 backdrop-blur-sm p-3 rounded-lg shadow-lg border border-gray-200/50 mt-2 z-10 flex flex-col gap-2">
            <span className="text-md font-bold">
              Total Devices: {nodes.length}
            </span>
            <span className="text-md font-bold">
              Total Connections: {edges.length}
            </span>
          </div>
          {/* Connection Types Legend */}
          <div className="bg-white/80 backdrop-blur-sm p-3 rounded-lg shadow-lg border border-gray-200/50 mt-2 z-10">
            <div className="text-md font-bold mb-2">Connection Types</div>
            <div className="flex flex-col gap-2">
              <div className="flex items-center gap-2">
                <div
                  className="w-8 h-0.5"
                  style={{ backgroundColor: "#ff0000" }}
                ></div>
                <span>Power</span>
              </div>
              <div className="flex items-center gap-2">
                <div
                  className="w-8 h-0.5"
                  style={{ backgroundColor: "#00ff00" }}
                ></div>
                <span>Network</span>
              </div>
              <div className="flex items-center gap-2">
                <div
                  className="w-8 h-1"
                  style={{ backgroundColor: "#9e9e9e" }}
                ></div>
                <span>Command</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-1 border-t-0 border-b-2 border-l-0 border-r-0 border-[#9e9e9e] border-dashed"></div>
                <span>Sync</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-0.5 bg-[#9e9e9e] relative">
                  <div className="absolute -top-1 left-3 w-2 h-2 rounded-full bg-[#009cff]"></div>
                </div>
                <span>Data</span>
              </div>
            </div>
          </div>
          {/* Connection Types Legend */}
          <div className="bg-white/80 backdrop-blur-sm p-3 rounded-lg shadow-lg border border-gray-200/50 mt-2 z-10">
            <div className="text-md font-bold mb-2">On Focused Node</div>
            <div className="flex flex-col gap-2">
              <div className="flex items-center gap-2">
                <div
                  className="w-8 h-0.5"
                  style={{ backgroundColor: "#009cff" }}
                ></div>
                <span>Source of Focused</span>
              </div>
              <div className="flex items-center gap-2">
                <div
                  className="w-8 h-0.5"
                  style={{ backgroundColor: "#9c00ff" }}
                ></div>
                <span>Target of Focused</span>
              </div>
            </div>
          </div>
        </div>
        <ReactFlow
          nodes={nodes}
          edges={edges}
          onNodesChange={onNodesChange}
          onEdgesChange={onEdgesChange}
          onConnect={onConnect}
          onInit={setFlowInstance}
          onNodeClick={onNodeClick}
          onEdgeClick={onEdgeClick}
          onNodeMouseEnter={onNodeMouseEnter}
          onNodeMouseLeave={onNodeMouseLeave}
          className="w-full h-full"
          defaultViewport={{ x: 0, y: 0, zoom: 1 }}
          minZoom={0.2}
          maxZoom={4}
          edgeTypes={edgeTypes}
          nodeTypes={nodeTypes}
        >
          <Controls className="bg-white/80 backdrop-blur-md border border-white/20 shadow-lg" />
          <MiniMap className="bg-white/80 backdrop-blur-md border border-white/20 shadow-lg" />
          <Background variant="dots" gap={12} size={1} className="bg-white/5" />
        </ReactFlow>
      </div>

      {/* Delete Confirmation Modal */}
      {onDelete && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <div className="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl p-6 max-w-md w-full space-y-6 transform transition-all duration-300">
            <h2 className="text-2xl font-bold text-gray-900">Delete System</h2>
            <p className="text-gray-600">
              Are you sure you want to delete this system? This action cannot be
              undone.
            </p>
            <div className="flex space-x-4">
              <button
                onClick={() => setOnDelete(false)}
                className="flex-1 px-4 py-3 bg-gray-500/80 backdrop-blur-md text-white rounded-lg hover:bg-gray-600/80 transition-all duration-300 border border-gray-400/20 shadow-lg"
              >
                Cancel
              </button>
              <button
                onClick={() => {
                  axios
                    .delete(
                      `${import.meta.env.VITE_BASE_URL}/api/v1/${
                        system.id
                      }/delete-system/`,
                      {
                        headers: {
                          Authorization: `Bearer ${localStorage.getItem(
                            "access_token"
                          )}`,
                        },
                      }
                    )
                    .then(() => {
                      toast.success("System deleted successfully");
                      navigate("/dashboard");
                    })
                    .catch((err) => {
                      toast.error("Error deleting system");
                      console.log(err);
                    });
                }}
                className="flex-1 px-4 py-3 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 border border-red-400/20 shadow-lg"
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Device Properties Modal */}
      {selectedNode && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <div
            ref={popupRef}
            className="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl p-6 max-w-md w-full space-y-6 transform transition-all duration-300"
          >
            <div className="flex justify-between items-center">
              <h2 className="text-2xl font-bold text-gray-900">
                Device Properties
              </h2>
              <button
                onClick={() => setSelectedNode(null)}
                className="p-2 hover:bg-gray-100 rounded-full transition-colors duration-200"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="space-y-4 max-h-[400px] overflow-y-auto pr-2">
              {Object.entries(selectedNode.data).map(([key, value]) => (
                <div key={key} className="space-y-1">
                  <div className="flex items-center justify-between">
                    <label className="text-sm font-medium text-gray-700">
                      {key}
                    </label>
                    {key !== "id" && key !== "SystemVersion" && (
                      <button
                        onClick={() => {
                          const newData = { ...selectedNode.data };
                          delete newData[key];
                          setSelectedNode((nds) => ({
                            ...nds,
                            data: newData,
                          }));
                        }}
                        className="p-1 hover:bg-red-100 rounded-full text-red-500 hover:text-red-600 transition-colors duration-200"
                      >
                        <X className="w-4 h-4" />
                      </button>
                    )}
                  </div>
                  <input
                    type="text"
                    value={value || ""}
                    disabled={key === "id" || key === "SystemVersion"}
                    onChange={(e) => {
                      setSelectedNode((nds) => ({
                        ...nds,
                        data: { ...nds.data, [key]: e.target.value },
                      }));
                    }}
                    className="w-full px-3 py-2 bg-white/50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
                  />
                </div>
              ))}
              {selectedNode.data.DeviceType === "host" && (
                <div className="space-y-2">
                  <label className="text-sm font-medium text-gray-700">
                    Traffic Rate (Mbps)
                  </label>
                  <input
                    type="range"
                    min="0"
                    max="200"
                    step="5"
                    value={selectedNode.data.TrafficRateMbps ?? 10}
                    onChange={(e) => {
                      const value = Number(e.target.value);
                      setSelectedNode((nds) => ({
                        ...nds,
                        data: { ...nds.data, TrafficRateMbps: value },
                      }));
                    }}
                    className="w-full"
                  />
                  <div className="text-sm text-gray-600">
                    {selectedNode.data.TrafficRateMbps ?? 10} Mbps
                  </div>
                </div>
              )}
            </div>

            <div className="flex space-x-2">
              <input
                type="text"
                placeholder="New property name"
                value={newProperty}
                onChange={(e) => setNewProperty(e.target.value)}
                className="flex-1 px-3 py-2 bg-white/50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
              />
              <button
                onClick={() => {
                  if (Object.keys(selectedNode.data).includes(newProperty)) {
                    toast.error("Property already exists");
                    return;
                  }
                  if (newProperty === "") {
                    toast.error("Property name cannot be empty");
                    return;
                  }
                  setSelectedNode((nds) => ({
                    ...nds,
                    data: { ...nds.data, [newProperty]: "" },
                  }));
                  setNewProperty("");
                }}
                className="px-4 py-2 bg-blue-500/90 text-white rounded-lg hover:bg-blue-600/90 transition-all duration-200"
              >
                Add
              </button>
            </div>

            <div className="flex flex-col space-y-3 pt-4 border-t border-gray-200/50">
              <button
                onClick={() => {
                  setNodes((nds) => {
                    const updated = nds
                      .filter((node) => node.id !== selectedNode.id)
                      .concat(applyNodeStyling(selectedNode));
                    return updated;
                  });
                  setSelectedNode(null);
                }}
                className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 border border-blue-400/20 shadow-lg"
              >
                Save Changes
              </button>
              <button
                onClick={() => {
                  const isOnline = selectedNode.data.IsOnline !== false;
                  const updatedNode = {
                    ...selectedNode,
                    data: {
                      ...selectedNode.data,
                      IsOnline: !isOnline,
                    },
                  };
                  setSelectedNode(updatedNode);
                  setNodes((nds) =>
                    nds.map((node) =>
                      node.id === updatedNode.id
                        ? applyNodeStyling(updatedNode)
                        : node
                    )
                  );
                }}
                className="px-4 py-3 bg-yellow-500/90 backdrop-blur-md text-white rounded-lg hover:bg-yellow-600/90 transition-all duration-300 border border-yellow-400/20 shadow-lg"
              >
                {selectedNode.data.IsOnline !== false
                  ? "Turn Off Node"
                  : "Turn On Node"}
              </button>

              <button
                onClick={() => {
                  setNodes((nds) =>
                    nds.filter((node) => node.id !== selectedNode.id)
                  );
                  setEdges((eds) =>
                    eds.filter(
                      (edge) =>
                        edge.source !== selectedNode.id &&
                        edge.target !== selectedNode.id
                    )
                  );
                  setSelectedNode(null);
                }}
                className="px-4 py-3 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 border border-red-400/20 shadow-lg"
              >
                Delete Device
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Edge Properties Modal */}
      {selectedEdge && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50">
          <div className="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl p-6 max-w-md w-full space-y-6 transform transition-all duration-300">
            <div className="flex justify-between items-center">
              <h2 className="text-2xl font-bold text-gray-900">
                Connection Properties
              </h2>
              <button
                onClick={() => setSelectedEdge(null)}
                className="p-2 hover:bg-gray-100 rounded-full transition-colors duration-200"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            <div className="space-y-4">
              <div className="space-y-2">
                <label className="text-sm font-medium text-gray-700">
                  Label
                </label>
                <input
                  type="text"
                  value={selectedEdge.data?.label || ""}
                  onChange={(e) => {
                    setSelectedEdge((eds) => ({
                      ...eds,
                      data: { ...eds.data, label: e.target.value },
                    }));
                  }}
                  className="w-full px-3 py-2 bg-white/50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
                />
              </div>

              <div className="space-y-2">
                <label className="text-sm font-medium text-gray-700">
                  Connection Details
                </label>
                <div className="space-y-4 max-h-[200px] overflow-y-auto pr-2">
                  {Object.entries(selectedEdge.data).map(([key, value]) => {
                    if (key === "label") {
                      return null;
                    }
                    return (
                      <div key={key}>
                        <div className="flex items-center space-x-2">
                          <label className="text-sm font-medium text-gray-700">
                            {key}
                          </label>
                        </div>
                        <div key={key} className="flex items-center space-x-2">
                          <input
                            type="text"
                            value={value}
                            onChange={(e) => {
                              setSelectedEdge((eds) => ({
                                ...eds,
                                data: {
                                  ...eds.data,
                                  [key]: e.target.value,
                                },
                              }));
                            }}
                            className="flex-1 px-3 py-2 bg-white/50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
                          />
                          <button
                            onClick={() => {
                              setSelectedEdge((eds) => {
                                const newData = { ...eds.data };
                                delete newData[key];
                                return {
                                  ...eds,
                                  data: newData,
                                };
                              });
                            }}
                            className="p-2 hover:bg-red-100 rounded-lg text-red-500 hover:text-red-600 transition-colors duration-200"
                          >
                            <X className="w-4 h-4" />
                          </button>
                        </div>
                      </div>
                    );
                  })}
                </div>

                <div className="flex space-x-2 mt-2">
                  <input
                    type="text"
                    placeholder="New detail name"
                    value={newConnectionProperty}
                    onChange={(e) => setNewConnectionProperty(e.target.value)}
                    className="flex-1 px-3 py-2 bg-white/50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
                  />
                  <button
                    onClick={() => {
                      if (
                        Object.keys(selectedEdge.data).includes(
                          newConnectionProperty
                        )
                      ) {
                        toast.error("Property already exists");
                        return;
                      }
                      if (newConnectionProperty === "") {
                        toast.error("Property name cannot be empty");
                        return;
                      }
                      setSelectedEdge((eds) => ({
                        ...eds,
                        data: {
                          ...eds.data,
                          [newConnectionProperty]: "",
                        },
                      }));
                      setNewConnectionProperty("");
                    }}
                    className="px-4 py-2 bg-blue-500/90 text-white rounded-lg hover:bg-blue-600/90 transition-all duration-200"
                  >
                    Add
                  </button>
                </div>
              </div>
            </div>

            <div className="flex flex-col space-y-3 pt-4 border-t border-gray-200/50">
              <button
                onClick={() => {
                  setEdges((eds) =>
                    eds.map((ed) =>
                      ed.id === selectedEdge.id
                        ? {
                            ...ed,
                            data: selectedEdge.data,
                          }
                        : ed
                    )
                  );
                  setSelectedEdge(null);
                }}
                className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 border border-blue-400/20 shadow-lg"
              >
                Save Changes
              </button>

              <button
                onClick={() => {
                  setEdges((eds) =>
                    eds.filter((edge) => edge.id !== selectedEdge.id)
                  );
                  setSelectedEdge(null);
                }}
                className="px-4 py-3 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 border border-red-400/20 shadow-lg"
              >
                Delete Connection
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
