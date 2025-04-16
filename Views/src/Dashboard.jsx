import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Plus, Search, LogOut } from "lucide-react";
import axios from "axios";

export default function Dashboard() {
  const [systems, setSystems] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    fetchSystems();
  }, []);

  const fetchSystems = async () => {
    try {
      const response = await axios.get(
        `${import.meta.env.VITE_BASE_URL}/api/v1/get-systems/`,
        {
          headers: {
            Authorization: `Bearer ${localStorage.getItem("access_token")}`,
          },
        }
      );
      setSystems(response.data);
    } catch (error) {
      console.error("Error fetching systems:", error);
    }
  };

  const SystemCard = ({ system }) => (
    <div
      className="bg-white/80 backdrop-blur-sm rounded-2xl p-6 shadow-xl hover:shadow-2xl transition-all duration-300 hover:scale-[1.02] cursor-pointer border border-white/20"
      onClick={() => {
        navigate(`/system/${system.id}/${system.Version}`, {
          state: { system: system },
        });
      }}
    >
      <h3 className="text-xl font-bold text-gray-800 mb-4">{system.Name}</h3>
      <div className="space-y-3">
        <div className="flex items-center space-x-2 text-gray-600">
          <div className="w-2 h-2 rounded-full bg-blue-400"></div>
          <p>Total Nodes: {system.NodeCount}</p>
        </div>
        <div className="flex items-center space-x-2 text-gray-600">
          <div className="w-2 h-2 rounded-full bg-indigo-400"></div>
          <p>Total Edges: {system.EdgeCount}</p>
        </div>
      </div>
    </div>
  );

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-400 via-indigo-500 to-cyan-500 animate-gradient bg-[length:400%_400%]">
      {/* Header */}
      <header className="bg-white/10 backdrop-blur-md border-b border-white/20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center justify-between">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <h1 className="text-2xl font-bold text-white">Modeler</h1>
            </div>
          </div>
          <div className="flex-1 max-w-2xl mx-4">
            <div className="relative">
              <input
                type="text"
                placeholder="Search systems..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full px-4 py-2 rounded-lg border border-white/20 bg-white/10 backdrop-blur-md focus:outline-none focus:ring-2 focus:ring-white/30 focus:border-transparent placeholder-white/50 text-white"
              />
              <span className="absolute right-3 top-2.5 text-white/50">
                <Search className="w-5 h-5" />
              </span>
            </div>
          </div>
          <div className="flex items-center space-x-4">
            <button
              onClick={() => navigate("/upload")}
              className="px-4 py-2 bg-white/10 backdrop-blur-md text-white rounded-lg hover:bg-white/20 transition-all duration-300 flex items-center border border-white/20 shadow-lg"
            >
              <Plus className="w-5 h-5" />
              <span className="ml-2">New System</span>
            </button>
            <button
              className="px-4 py-2 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 flex items-center border border-red-400/20 shadow-lg"
              onClick={() => {
                localStorage.removeItem("access_token");
                localStorage.removeItem("refresh_token");
                navigate("/sign-in");
              }}
            >
              <LogOut className="w-5 h-5" />
              <span className="ml-2">Logout</span>
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-2xl font-bold text-white">Your Systems</h2>
        </div>

        {/* Systems Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {systems
            .filter((system) =>
              system.Name.toLowerCase().includes(searchQuery.toLowerCase())
            )
            .map((system) => (
              <SystemCard key={system.id} system={system} />
            ))}
        </div>
      </main>
    </div>
  );
}
