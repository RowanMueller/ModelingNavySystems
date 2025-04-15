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
    axios
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
        const newNodes = res.data.map((device, i) => {
          const { AdditionalAsJson, ...deviceData } = device;
          return {
            id: String(i + 1),
            position: { x: 0, y: 100 * (i + 1) },
            data: {
              label: device.device_name || `Device ${i + 1}`,
              ...deviceData, // Spread the device data without AdditionalAsJson
              ...(AdditionalAsJson || {}), // Spread the AdditionalAsJson contents so that we can display it in the node properties as normal
            },
          };
        });
        setNodes(newNodes);
      });

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
  }, []);

  const handleSave = async () => {
    if (!flowInstance) return;

    axios.post(
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
    );
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

  return (
    <div className="relative w-screen h-screen">
      <div className="absolute top-0 left-0 z-10 w-[300px] h-full bg-white border-r border-gray-200 p-4 flex flex-col gap-4 shadow-lg">
        <button
          onClick={() => navigate("/dashboard")}
          className="flex items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
        >
          <ArrowLeft />
          <span className="ml-2">Back</span>
        </button>
        <button
          onClick={() => {
            flowInstance.setCenter(0, 0, {
              zoom: 1,
              duration: 1000,
            });

            setNodes((nds) => [
              ...nds,
              {
                id: `new-${String(nds.length + 1)}`,
                position: {
                  x: 0,
                  y: 0,
                },
                data: {
                  label: "New Device",
                  SystemVersion: system.Version,
                  AssetId: "",
                },
              },
            ]);
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-green-600 border border-transparent rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
        >
          <Plus />
          <span className="ml-2">Add New Device</span>
        </button>
        <button
          onClick={handleSave}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-500 border border-transparent rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
        >
          <Save />
          <span className="ml-2">Save Graph</span>
        </button>
        <button
          onClick={() => {
            //TODO -> Download SysML file
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-500 border border-transparent rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
        >
          <Download />
          <span className="ml-2">Download SysML file</span>
        </button>
        <button
          onClick={() => {
            setOnDelete(true);
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-red-500 border border-transparent rounded-md hover:bg-red-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
        >
          <Trash />
          <span className="ml-2">Delete System</span>
        </button>
        {/* <button
          onClick={() => {
            console.log(nodes);
            console.log(edges);
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-500 border border-transparent rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
        >
          <span className="ml-2">Debug print</span>
        </button> */}
        <hr className="my-4" />
        <div className="flex flex-col gap-2">
          <h2 className="text-lg font-medium">System Versions</h2>
          <div className="flex flex-col gap-2">
            {(() => {
              const items = [];
              for (let i = 0; i < system.Version; i++) {
                items.push(
                  <button
                    key={i}
                    onClick={() => {
                      if (i + 1 != version) {
                        navigate(`/system/${system.id}/${i + 1}`, {
                          state: { system: system },
                        });
                      }
                    }}
                    className="inline-flex w-full items-center px-4 py-2 text-sm font-medium text-white bg-blue-500 border border-transparent rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                  >
                    <span className="ml-2 w-full">{`Version ${i + 1}`}</span>
                  </button>
                );
              }
              return items;
            })()}
          </div>
        </div>
      </div>
      <div className="w-full h-full">
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
          defaultViewport={{ x: 350, y: 350, zoom: 1 }}
          edgeTypes={edgeTypes}
        >
          <Controls />
          <MiniMap />
          <Background variant="dots" gap={12} size={1} />
        </ReactFlow>
      </div>

      {onDelete && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-10">
          <div className="bg-white rounded-lg p-6 w-96 relative">
            <h2 className="text-xl font-bold mb-4">Delete System</h2>
            <p className="mb-4">Are you sure you want to delete this system?</p>
            <div className="flex gap-4 items-center justify-between">
              <button
                onClick={() => {
                  setOnDelete(false);
                }}
                className="bg-blue-500 text-white px-4 py-2 rounded-md w-full"
              >
                Cancel
              </button>
              <button
                className="bg-red-500 text-white px-4 py-2 rounded-md w-full"
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
              >
                Delete
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Device Properties Modal */}
      {selectedNode && (
        <div
          ref={popupRef}
          className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-10"
        >
          <div className="bg-white rounded-lg p-6 w-96 relative">
            <button
              onClick={() => setSelectedNode(null)}
              className="absolute top-4 right-4 text-gray-500 hover:text-gray-700"
            >
              <X size={20} />
            </button>
            <h2 className="text-xl font-bold mb-4">Device Properties</h2>
            <div className="space-y-4 max-h-[500px] overflow-y-auto">
              {Object.keys(selectedNode.data).map((key) => {
                return (
                  <div key={key}>
                    <div className="flex items-center justify-between">
                      <label className="block text-sm font-medium text-gray-700">
                        {key}
                      </label>
                      <button
                        className="text-gray-500 hover:text-gray-700"
                        onClick={() => {
                          const newData = { ...selectedNode.data };
                          delete newData[key];
                          setSelectedNode((nds) => ({
                            ...nds,
                            data: newData,
                          }));
                        }}
                      >
                        <X size={20} />
                      </button>
                    </div>
                    <input
                      className="w-full border border-gray-300 rounded-md p-2"
                      type="text"
                      disabled={key === "id" || key === "SystemVersion"}
                      value={selectedNode.data[key] || ""}
                      onChange={(e) => {
                        setSelectedNode((nds) => ({
                          ...nds,
                          data: { ...nds.data, [key]: e.target.value },
                        }));
                      }}
                    />
                    {/* {typeof selectedNode.data[key] === 'object'
                      ? JSON.stringify(selectedNode.data[key])
                      : String(selectedNode.data[key])}
                    </p> */}
                  </div>
                );
              })}
            </div>
            <div className="flex gap-2">
              <input
                type="text"
                placeholder="Property name"
                className="w-full border border-gray-300 rounded-md px-2 mt-4"
                onChange={(e) => setNewProperty(e.target.value)}
              ></input>
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
                }}
                className="w-full bg-blue-500 text-white p-2 rounded-md mt-4"
              >
                Add
              </button>
            </div>

            <button
              onClick={() => {
                setNodes((nds) =>
                  nds
                    .filter((node) => node.id !== selectedNode.id)
                    .concat(selectedNode)
                );
                setSelectedNode(null);
              }}
              className="w-full bg-blue-500 text-white p-2 rounded-md mt-4"
            >
              Save
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
              className="w-full bg-red-500 text-white p-2 rounded-md mt-4"
            >
              Delete Device
            </button>
          </div>
        </div>
      )}

      {/* Edge Properties Modal */}
      {selectedEdge && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-10">
          <div className="bg-white rounded-lg p-6 w-96 relative">
            <button
              onClick={() => setSelectedEdge(null)}
              className="absolute top-4 right-4 text-gray-500 hover:text-gray-700"
            >
              <X size={20} />
            </button>
            <h2 className="text-xl font-bold mb-4">Connection Properties</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Label
                </label>
                <input
                  className="w-full border border-gray-300 rounded-md p-2"
                  type="text"
                  value={selectedEdge.data?.label || ""}
                  onChange={(e) => {
                    setSelectedEdge((eds) => ({
                      ...eds,
                      data: { ...eds.data, label: e.target.value },
                    }));
                  }}
                />
              </div>
            </div>

            <div className="mt-4 space-y-2">
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
                className="w-full bg-blue-500 text-white p-2 rounded-md"
              >
                Save
              </button>

              <button
                onClick={() => {
                  setEdges((eds) =>
                    eds.filter((edge) => edge.id !== selectedEdge.id)
                  );
                  setSelectedEdge(null);
                }}
                className="w-full bg-red-500 text-white p-2 rounded-md"
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
