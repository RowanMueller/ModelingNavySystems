import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "./authContext";
import { Plus, Search, LogOut } from "lucide-react";
export default function Dashboard() {
  const [systems, setSystems] = useState([
    {
      id: 1,
      name: "System 1",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 2,
      name: "System 2",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 3,
      name: "System 3",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 4,
      name: "System 4",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 5,
      name: "System 5",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 6,
      name: "System 6",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 7,
      name: "System 7",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
    {
      id: 8,
      name: "System 8",
      total_nodes: 10,
      total_edges: 10,
      preview_image: "https://via.placeholder.com/150",
    },
  ]);
  const [searchQuery, setSearchQuery] = useState("");
  const navigate = useNavigate();
  const { user } = useAuth();

  useEffect(() => {
    fetchSystems();
  }, []);

  const fetchSystems = async () => {
    // try {
    //   const response = await fetch(`${import.meta.env.VITE_BASE_URL}/api/v1/systems/`, {
    //     headers: {
    //       'Authorization': `Bearer ${localStorage.getItem('access_token')}`,
    //       'Content-Type': 'application/json',
    //     },
    //   });
    //   if (response.ok) {
    //     const data = await response.json();
    //     setSystems(data);
    //   }
    // } catch (error) {
    //   console.error('Error fetching systems:', error);
    // }
  };

  const SystemCard = ({ system }) => (
    <div className="bg-white rounded-lg p-6 shadow-sm hover:shadow-md transition-shadow"
      onClick={() => {
        navigate(`/system/${system.id}`);
      }}
    >
      <h3 className="text-xl font-semibold text-gray-800 mb-4">
        {system.name}
      </h3>
      <div className="space-y-2 text-gray-600">
        <p>Total Nodes: {system.total_nodes}</p>
        <p>Total Edges: {system.total_edges}</p>
      </div>
      <div className="mt-4">
        <img
          src={system.preview_image}
          alt={`${system.name} preview`}
          className="w-full h-48 object-cover rounded-md bg-gray-100"
        />
      </div>
    </div>
  );

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center justify-between">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <h1 className="text-2xl font-bold text-gray-900">Modeler</h1>
            </div>
          </div>
          <div className="flex-1 max-w-2xl mx-4">
            <div className="relative">
              <input
                type="text"
                placeholder="Search"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full px-4 py-2 rounded-md border border-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
              />
              <span className="absolute right-3 top-2.5 text-gray-400">
                <Search />
              </span>
            </div>
          </div>
          <div className="flex items-center space-x-4">
            <button
              onClick={() => navigate("/upload")}
              className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors flex items-center"
            >
              <Plus />
              <span className="ml-2">New System</span>
            </button>
          </div>
          <div className="flex items-center space-x-4">
            <button
              className="px-4 py-2 bg-red-500 text-white rounded-md hover:bg-red-600 transition-colors flex items-center"
              onClick={() => {
                localStorage.removeItem("access_token");
                localStorage.removeItem("refresh_token");
                navigate("/sign-in");
              }}
            >
              <LogOut />
              <span className="ml-2">Logout</span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-2xl font-semibold text-gray-900">Systems</h2>
        </div>

        {/* Systems Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {systems
            .filter((system) =>
              system.name.toLowerCase().includes(searchQuery.toLowerCase())
            )
            .map((system) => (
              <SystemCard key={system.id} system={system} />
            ))}
        </div>
      </main>
    </div>
  );
}
