import React, { useEffect, useMemo, useRef, useState } from "react";
import axios from "axios";
import { MapContainer, TileLayer, Polyline, CircleMarker } from "react-leaflet";
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
} from "recharts";

const MAX_SAMPLES = 500;

export default function TelemetryDashboard() {
  const baseUrl = import.meta.env.VITE_BASE_URL;
  const token = localStorage.getItem("access_token");
  const [systems, setSystems] = useState([]);
  const [sessions, setSessions] = useState([]);
  const [selectedSystemId, setSelectedSystemId] = useState("");
  const [activeSession, setActiveSession] = useState(null);
  const [samples, setSamples] = useState([]);
  const [streamStatus, setStreamStatus] = useState("disconnected");
  const eventSourceRef = useRef(null);

  const authHeaders = useMemo(
    () => ({
      Authorization: `Bearer ${token}`,
    }),
    [token]
  );

  useEffect(() => {
    const loadSystems = async () => {
      const response = await axios.get(`${baseUrl}/api/v1/get-systems/`, {
        headers: authHeaders,
      });
      setSystems(response.data || []);
      if (response.data?.length) {
        setSelectedSystemId(String(response.data[0].id));
      }
    };

    const loadSessions = async () => {
      const response = await axios.get(`${baseUrl}/api/v1/telemetry/sessions/`, {
        headers: authHeaders,
      });
      setSessions(response.data || []);
      if (!activeSession && response.data?.length) {
        setActiveSession(response.data[0]);
      }
    };

    loadSystems().catch(() => {});
    loadSessions().catch(() => {});
  }, [baseUrl, authHeaders, activeSession]);

  useEffect(() => {
    if (!activeSession) {
      return;
    }

    const fetchRecent = async () => {
      const response = await axios.get(
        `${baseUrl}/api/v1/telemetry/sessions/${activeSession.id}/samples/?limit=200`,
        { headers: authHeaders }
      );
      setSamples(response.data || []);
    };

    fetchRecent().catch(() => {});

    if (eventSourceRef.current) {
      eventSourceRef.current.close();
    }
    if (!token) {
      setStreamStatus("unauthorized");
      return;
    }

    const streamUrl = `${baseUrl}/api/v1/telemetry/sessions/${activeSession.id}/stream/?token=${encodeURIComponent(
      token
    )}`;
    const es = new EventSource(streamUrl);
    eventSourceRef.current = es;
    setStreamStatus("connecting");

    es.onopen = () => setStreamStatus("connected");
    es.onmessage = (event) => {
      try {
        const data = JSON.parse(event.data);
        setSamples((prev) => {
          const next = [...prev, data];
          if (next.length > MAX_SAMPLES) {
            return next.slice(next.length - MAX_SAMPLES);
          }
          return next;
        });
      } catch (err) {
        // ignore malformed events
      }
    };
    es.onerror = () => {
      setStreamStatus("error");
      es.close();
    };

    return () => {
      es.close();
    };
  }, [activeSession, baseUrl, authHeaders, token]);

  const startSession = async () => {
    if (!selectedSystemId) {
      return;
    }
    const response = await axios.post(
      `${baseUrl}/api/v1/telemetry/sessions/start/`,
      { system_id: Number(selectedSystemId), name: "Live Session" },
      { headers: authHeaders }
    );
    setActiveSession(response.data);
    setSessions((prev) => [response.data, ...prev]);
  };

  const stopSession = async () => {
    if (!activeSession) {
      return;
    }
    const response = await axios.post(
      `${baseUrl}/api/v1/telemetry/sessions/${activeSession.id}/stop/`,
      {},
      { headers: authHeaders }
    );
    setActiveSession(response.data);
    setSessions((prev) =>
      prev.map((s) => (s.id === response.data.id ? response.data : s))
    );
  };

  const chartData = useMemo(
    () =>
      samples.map((s) => ({
        timestamp: new Date(s.Timestamp).toLocaleTimeString(),
        altitude: s.AltitudeM ?? null,
        battery: s.BatteryPct ?? null,
        speed:
          Math.sqrt(
            Math.pow(s.VelocityXMps || 0, 2) +
              Math.pow(s.VelocityYMps || 0, 2) +
              Math.pow(s.VelocityZMps || 0, 2)
          ) || 0,
      })),
    [samples]
  );

  const path = useMemo(() => {
    return samples
      .map((s) => [s.Latitude, s.Longitude])
      .filter(
        ([lat, lon]) =>
          Number.isFinite(lat) && Number.isFinite(lon)
      );
  }, [samples]);

  const currentPosition = path.length ? path[path.length - 1] : [0, 0];

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-400/20 via-indigo-500/20 to-cyan-500/20 animate-gradient bg-[length:400%_400%]">
      <header className="bg-white/10 backdrop-blur-md border-b bg-gradient-to-br from-blue-400 via-indigo-500 to-cyan-500 animate-gradient bg-[length:400%_400%]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center justify-between">
          <h1 className="text-2xl font-bold text-white">Live Telemetry</h1>
          <div className="text-white/80 text-sm">
            Stream: {streamStatus}
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">
        <section className="bg-white/80 rounded-2xl p-6 shadow-xl border border-white/20">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
            <div className="flex gap-3 items-center">
              <label className="text-sm font-semibold">System</label>
              <select
                className="px-3 py-2 rounded-lg border border-gray-200"
                value={selectedSystemId}
                onChange={(e) => setSelectedSystemId(e.target.value)}
              >
                {systems.map((system) => (
                  <option key={system.id} value={system.id}>
                    {system.Name}
                  </option>
                ))}
              </select>
              <button
                className="px-4 py-2 bg-blue-500 text-white rounded-lg"
                onClick={startSession}
              >
                Start Logging
              </button>
              <button
                className="px-4 py-2 bg-red-500 text-white rounded-lg"
                onClick={stopSession}
                disabled={!activeSession}
              >
                Stop
              </button>
            </div>
            <div className="flex gap-3 items-center">
              <label className="text-sm font-semibold">Session</label>
              <select
                className="px-3 py-2 rounded-lg border border-gray-200"
                value={activeSession?.id || ""}
                onChange={(e) => {
                  const selected = sessions.find(
                    (s) => String(s.id) === e.target.value
                  );
                  setActiveSession(selected || null);
                }}
              >
                {sessions.map((session) => (
                  <option key={session.id} value={session.id}>
                    {session.Name} {session.IsActive ? "(live)" : ""}
                  </option>
                ))}
              </select>
            </div>
          </div>
        </section>

        <section className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <div className="bg-white/80 rounded-2xl p-6 shadow-xl border border-white/20 h-[320px]">
            <h2 className="text-lg font-semibold text-gray-800 mb-4">
              Altitude & Battery
            </h2>
            <ResponsiveContainer width="100%" height="85%">
              <LineChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="timestamp" hide />
                <YAxis yAxisId="left" />
                <YAxis yAxisId="right" orientation="right" />
                <Tooltip />
                <Legend />
                <Line
                  yAxisId="left"
                  type="monotone"
                  dataKey="altitude"
                  stroke="#3b82f6"
                  dot={false}
                />
                <Line
                  yAxisId="right"
                  type="monotone"
                  dataKey="battery"
                  stroke="#10b981"
                  dot={false}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>

          <div className="bg-white/80 rounded-2xl p-6 shadow-xl border border-white/20 h-[320px]">
            <h2 className="text-lg font-semibold text-gray-800 mb-4">
              Speed
            </h2>
            <ResponsiveContainer width="100%" height="85%">
              <LineChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" />
                <XAxis dataKey="timestamp" hide />
                <YAxis />
                <Tooltip />
                <Legend />
                <Line
                  type="monotone"
                  dataKey="speed"
                  stroke="#f59e0b"
                  dot={false}
                />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </section>

        <section className="bg-white/80 rounded-2xl p-6 shadow-xl border border-white/20">
          <h2 className="text-lg font-semibold text-gray-800 mb-4">
            Map View
          </h2>
          <div className="h-[400px] w-full">
            <MapContainer
              center={currentPosition}
              zoom={13}
              className="h-full w-full rounded-xl"
            >
              <TileLayer
                attribution='&copy; OpenStreetMap contributors'
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              />
              {path.length > 1 && <Polyline positions={path} color="#2563eb" />}
              {path.length > 0 && (
                <CircleMarker center={currentPosition} radius={6} color="#ef4444" />
              )}
            </MapContainer>
          </div>
        </section>
      </main>
    </div>
  );
}
