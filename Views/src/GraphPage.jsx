import React, { useCallback, useEffect, useState } from "react";
import {
  ReactFlow,
  MiniMap,
  Controls,
  Background,
  useNodesState,
  useEdgesState,
  addEdge,
} from "@xyflow/react";
import { useNavigate } from "react-router-dom";
import { Plus, Save, Download, X } from "lucide-react";
import "@xyflow/react/dist/style.css";
import axios from "axios";

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
const initialEdges = [];

export default function GraphPage({ id, name, version }) {
  const navigate = useNavigate();
  const [nodes, setNodes, onNodesChange] = useNodesState(initialNodes);
  const [edges, setEdges, onEdgesChange] = useEdgesState(initialEdges);
  const [flowInstance, setFlowInstance] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);

  const onConnect = useCallback(
    (params) => setEdges((eds) => addEdge(params, eds)),
    [setEdges]
  );

  useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_BASE_URL}/api/v1/get-devices/`)
      .then((res) => {
        const newNodes = res.data.map((device, i) => ({
          id: String(i + 1),
          position: { x: 0, y: 100 * (i + 1) },
          data: {
            label: device.device_name || `Device ${i + 1}`,
            ...device, // Spread the device data into the node's data object
          },
        }));
        setNodes(newNodes);
      });
  }, []);

  const handleSave = async () => {
    if (!flowInstance) return;

    //TODO: Save the graph to the database
  };

  const onNodeClick = useCallback((event, node) => {
    setSelectedNode(node);
  }, []);

  return (
    <div className="relative w-screen h-screen">
      <div className="absolute top-0 left-0 z-10 w-[300px] h-full bg-white border-r border-gray-200 p-4 flex flex-col gap-4 shadow-lg">
        <button
          onClick={() => navigate("/dashboard")}
          className="flex items-center px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          <svg
            className="w-5 h-5 mr-2"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M10 19l-7-7m0 0l7-7m-7 7h18"
            />
          </svg>
          Back
        </button>
        <button
          onClick={() =>
            setNodes((nds) => [
              ...nds,
              {
                id: String(nds.length + 1),
                position: { x: 0, y: 100 * (nds.length + 1) },
                data: { label: `Device ${nds.length + 1}` },
              },
            ])
          }
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-green-600 border border-transparent rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500"
        >
          <Plus />
          <span className="ml-2">Add New Device</span>
        </button>
        <button
          onClick={handleSave}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          <Save />
          <span className="ml-2">Save Graph</span>
        </button>
        <button
          onClick={() => {
            //TODO -> Download SysML file
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          <Download />
          <span className="ml-2">Download SysML file</span>
        </button>
        <button
          onClick={() => {
            console.log(nodes);
            console.log(edges);
          }}
          className="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          <span className="ml-2">Debug print</span>
        </button>
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
          className="w-full h-full"
          defaultViewport={{ x: 350, y: 350, zoom: 5 }}
        >
          <Controls />
          <MiniMap />
          <Background variant="dots" gap={12} size={1} />
        </ReactFlow>
      </div>

      {/* Node Properties Modal */}
      {selectedNode && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
          <div className="bg-white rounded-lg p-6 w-96 relative">
            <button
              onClick={() => setSelectedNode(null)}
              className="absolute top-4 right-4 text-gray-500 hover:text-gray-700"
            >
              <X size={20} />
            </button>
            <h2 className="text-xl font-bold mb-4">Node Properties</h2>
            <div className="space-y-4 max-h-[500px] overflow-y-auto">
              {Object.keys(selectedNode.data).map((key) => {
                if (key === "AdditionalAsJson") {
                  console.log(selectedNode.data[key]);
                  return Object.keys(selectedNode.data[key]).map((item) => {
                    return (
                      <div key={item}>
                        <label className="block text-sm font-medium text-gray-700">
                          {item}
                        </label>
                        <input
                          className="w-full border border-gray-300 rounded-md p-2"
                          type="text"
                          disabled={key === "id"}
                          value={selectedNode.data[key][item] || ""}
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
                  });
                }
                return (
                  <div key={key}>
                    <label className="block text-sm font-medium text-gray-700">
                      {key}
                    </label>
                    <input
                      className="w-full border border-gray-300 rounded-md p-2"
                      type="text"
                      disabled={key === "id"}
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
          </div>
        </div>
      )}
    </div>
  );
}
