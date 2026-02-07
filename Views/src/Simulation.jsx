import React, { useEffect, useState } from "react";
import axios from "axios";
import Loading from "./loading";

export default function Simulation() {
  const [systems, setSystems] = useState([]);
  const [selectedSystem, setSelectedSystem] = useState("");
  const [version, setVersion] = useState(1);
  const [result, setResult] = useState(null);
  const [warnings, setWarnings] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [importFile, setImportFile] = useState(null);
  const [error, setError] = useState("");

  const authHeader = {
    Authorization: `Bearer ${localStorage.getItem("access_token")}`,
  };

  const loadSystems = async () => {
    try {
      const response = await axios.get(
        `${import.meta.env.VITE_BASE_URL}/api/v1/get-systems/`,
        { headers: authHeader }
      );
      setSystems(response.data);
    } catch (err) {
      console.error("Failed to load systems", err);
    }
  };

  useEffect(() => {
    loadSystems();
  }, []);

  const runValidation = async () => {
    if (!selectedSystem) return;
    const { data } = await axios.post(
      `${import.meta.env.VITE_BASE_URL}/api/v1/validate/`,
      { system_id: selectedSystem, version },
      { headers: authHeader }
    );
    setWarnings(data.warnings || []);
  };

  const runSimulation = async () => {
    setIsLoading(true);
    setError("");
    try {
      await runValidation();
      const { data } = await axios.post(
        `${import.meta.env.VITE_BASE_URL}/api/v1/simulate/`,
        { system_id: selectedSystem, version },
        { headers: authHeader }
      );
      setResult(data);
    } catch (err) {
      setError(err.response?.data?.error || "Simulation failed");
    } finally {
      setIsLoading(false);
    }
  };

  const importConfig = async () => {
    if (!importFile) return;
    setIsLoading(true);
    setError("");
    try {
      const form = new FormData();
      form.append("file", importFile);
      const { data } = await axios.post(
        `${import.meta.env.VITE_BASE_URL}/api/v1/config/import/`,
        form,
        {
          headers: {
            ...authHeader,
            "Content-Type": "multipart/form-data",
          },
        }
      );
      setSelectedSystem(data.system_id);
      await loadSystems();
    } catch (err) {
      setError(err.response?.data?.error || "Import failed");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-400/10 via-indigo-500/10 to-cyan-500/10 p-6">
      <div className="max-w-5xl mx-auto space-y-6">
        <h1 className="text-3xl font-bold text-gray-900">Ethernet Simulation</h1>

        {error && (
          <div className="p-3 bg-red-50 border border-red-200 text-red-700 rounded">
            {error}
          </div>
        )}

        <div className="bg-white rounded-xl p-4 shadow space-y-4">
          <h2 className="text-xl font-semibold">Import Config (YAML/JSON)</h2>
          <div className="flex items-center gap-4">
            <input
              type="file"
              accept=".yaml,.yml,.json"
              onChange={(e) => setImportFile(e.target.files?.[0])}
            />
            <button
              onClick={importConfig}
              className="px-4 py-2 bg-blue-600 text-white rounded"
              disabled={!importFile || isLoading}
            >
              Import
            </button>
          </div>
        </div>

        <div className="bg-white rounded-xl p-4 shadow space-y-4">
          <h2 className="text-xl font-semibold">Run Simulation</h2>
          <div className="flex flex-wrap gap-4 items-center">
            <select
              className="border rounded px-3 py-2"
              value={selectedSystem}
              onChange={(e) => setSelectedSystem(e.target.value)}
            >
              <option value="">Select system</option>
              {systems.map((system) => (
                <option key={system.id} value={system.id}>
                  {system.Name} (v{system.Version})
                </option>
              ))}
            </select>
            <input
              className="border rounded px-3 py-2 w-28"
              type="number"
              min="1"
              value={version}
              onChange={(e) => setVersion(Number(e.target.value))}
            />
            <button
              onClick={runSimulation}
              className="px-4 py-2 bg-emerald-600 text-white rounded"
              disabled={!selectedSystem || isLoading}
            >
              Run
            </button>
          </div>
        </div>

        {isLoading && <Loading />}

        {warnings.length > 0 && (
          <div className="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
            <h3 className="font-semibold text-yellow-900">Topology warnings</h3>
            <ul className="list-disc pl-6 text-yellow-800">
              {warnings.map((warn, idx) => (
                <li key={`${warn.device}-${idx}`}>
                  {warn.device}: {warn.warning} ({warn.connections} connections /
                  {warn.ports} ports)
                </li>
              ))}
            </ul>
          </div>
        )}

        {result && (
          <div className="bg-white rounded-xl p-4 shadow space-y-4">
            <h2 className="text-xl font-semibold">Simulation Results</h2>
            <div>
              <h3 className="font-semibold">Flows</h3>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm border">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="text-left p-2 border">Source</th>
                      <th className="text-left p-2 border">Destination</th>
                      <th className="text-left p-2 border">Requested</th>
                      <th className="text-left p-2 border">Achieved</th>
                      <th className="text-left p-2 border">Latency</th>
                      <th className="text-left p-2 border">Status</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(result.flows || []).map((flow, idx) => (
                      <tr key={idx}>
                        <td className="p-2 border">{flow.source}</td>
                        <td className="p-2 border">{flow.destination}</td>
                        <td className="p-2 border">{flow.requested_mbps}</td>
                        <td className="p-2 border">{flow.achieved_mbps}</td>
                        <td className="p-2 border">{flow.latency_ms}</td>
                        <td className="p-2 border">{flow.status}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
            <div>
              <h3 className="font-semibold">Links</h3>
              <div className="overflow-x-auto">
                <table className="min-w-full text-sm border">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="text-left p-2 border">Link</th>
                      <th className="text-left p-2 border">Capacity</th>
                      <th className="text-left p-2 border">Utilization</th>
                    </tr>
                  </thead>
                  <tbody>
                    {(result.links || []).map((link, idx) => (
                      <tr key={idx}>
                        <td className="p-2 border">
                          {link.from} → {link.to}
                        </td>
                        <td className="p-2 border">{link.capacity_mbps}</td>
                        <td className="p-2 border">{link.utilization}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
