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
  const { edges, setEdges, onEdgesChange, selectedEdge, setSelectedEdge } =
    useGraph();
  const [flowInstance, setFlowInstance] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);
  const [onDelete, setOnDelete] = useState(false);
  const focusedNodeRef = useRef(null);
  const [newProperty, setNewProperty] = useState("");
  const location = useLocation();
  const { version } = useParams();

  const system = location.state.system;

  const popupRef = useRef(null);
  const updated = useRef(false);
  const [isEditingName, setIsEditingName] = useState(false);
  const [systemName, setSystemName] = useState(system.Name);

  const onConnect = useCallback(
    (params) => {
      const newEdge = {
        ...params,
        type: "custom",
        data: { label: "New Connection" },
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
              ...deviceData
            } = device;

            return {
              id: String(i + 1),
              position: {
                x: Xposition,
                y: Yposition,
              },
              data: {
                label: device.device_name || `Device ${i + 1}`,
                ...deviceData,
                ...(AdditionalAsJson || {}),
              },
            };
          });
          setNodes(newNodes);
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
            return {
              id: String(i + 1),
              source: newNodes.find(
                (node) => node.data.id === connection.Source
              ).id,
              target: newNodes.find(
                (node) => node.data.id === connection.Target
              ).id,
              data: { label: connection.ConnectionType },
              type: "custom",
            };
          });
          setEdges(newEdges);
        });
      setNodes(newNodes);
    };

    fetchData();

    const handleKeyDown = (event) => {
      if (event.key === "Escape") {
        setSelectedNode(false);
      }
      if (
        (event.metaKey || event.ctrlKey) &&
        event.key === "d" &&
        focusedNodeRef.current
      ) {
        event.preventDefault();
        setNodes((nds) => [
          ...nds,
          {
            id: `new-${String(nds.length + 1)}`,
            position: {
              x: focusedNodeRef.current.position.x + 300,
              y: focusedNodeRef.current.position.y,
            },
            data: {
              ...focusedNodeRef.current.data,
              label: `${focusedNodeRef.current.data.label} (copy)`,
            },
          },
        ]);
      }
    };

    document.addEventListener("keydown", handleKeyDown);
    return () => {
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, [version]);

  const handleSave = async () => {
    if (!flowInstance) return;

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
      .then((res) => {
        toast.success("Graph saved successfully");
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
      });
  };

  const onNodeClick = useCallback((event, node) => {
    setSelectedNode(node);
  }, []);

  const onNodeMouseEnter = useCallback((event, node) => {
    focusedNodeRef.current = node;
  }, []);

  const onNodeMouseLeave = useCallback((event, node) => {
    focusedNodeRef.current = null;
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
                    let filename = system.Name + "_v" + system.Version + ".sysml";
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
          edgeTypes={edgeTypes}
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
                  setNodes((nds) =>
                    nds
                      .filter((node) => node.id !== selectedNode.id)
                      .concat(selectedNode)
                  );
                  setSelectedNode(null);
                }}
                className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 border border-blue-400/20 shadow-lg"
              >
                Save Changes
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
            </div>

            <div className="flex flex-col space-y-3 pt-4 border-t border-gray-200/50">
              <button
                onClick={() => {
                  setEdges((eds) =>
                    eds.map((ed) =>
                      ed.id === selectedEdge.id
                        ? {
                            ...ed,
                            data: {
                              ...ed.data,
                              label: selectedEdge.data.label,
                            },
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
