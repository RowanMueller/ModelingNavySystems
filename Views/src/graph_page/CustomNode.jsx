import React from "react";
import { Handle, Position } from "@xyflow/react";
import { FaNetworkWired, FaServer, FaShieldAlt, FaWifi } from "react-icons/fa";

const iconMap = {
  switch: FaNetworkWired,
  host: FaServer,
  firewall: FaShieldAlt,
  iot: FaWifi,
};

const getIcon = (type) => iconMap[type] || FaNetworkWired;

export default function CustomNode({ data }) {
  const Icon = getIcon(data.DeviceType);
  const isOnline = data.IsOnline !== false;
  return (
    <div className="px-3 py-2 rounded-lg shadow-sm bg-white/80 backdrop-blur-sm border border-gray-200/50 min-w-[180px]">
      <Handle type="target" position={Position.Left} />
      <div className="flex items-center gap-2">
        <Icon className={`text-lg ${isOnline ? "text-blue-600" : "text-gray-400"}`} />
        <div className="flex flex-col">
          <span className="text-sm font-semibold text-gray-900">{data.label}</span>
          {data.DeviceType && (
            <span className="text-xs text-gray-500 uppercase">{data.DeviceType}</span>
          )}
        </div>
      </div>
      <Handle type="source" position={Position.Right} />
    </div>
  );
}
