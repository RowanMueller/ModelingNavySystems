import { BaseEdge, EdgeLabelRenderer, getBezierPath } from "@xyflow/react";
import "@xyflow/react/dist/style.css";
import useGraph from "./useGraph";

// Add keyframes animation
const edgeAnimationStyle = `
  @keyframes dashedLine {
    to {
      stroke-dashoffset: -20;
    }
  }
`;

export default function CustomEdge({
  id,
  sourceX,
  sourceY,
  targetX,
  targetY,
  sourcePosition,
  targetPosition,
  source,
  target,
  data,
}) {
  const { edges, setSelectedEdge, focusedNode, heatMode } = useGraph();
  const [edgePath, labelX, labelY] = getBezierPath({
    sourceX,
    sourceY,
    sourcePosition,
    targetX,
    targetY,
    targetPosition,
  });

  // Calculate distance and animation duration
  const distance = Math.sqrt(
    Math.pow(targetX - sourceX, 2) + Math.pow(targetY - sourceY, 2)
  );
  const duration = Math.max(distance / 100, 1); // Scale factor of 100, minimum 1 second

  const getHeatColor = (utilization) => {
    if (utilization >= 0.9) return "#dc2626";
    if (utilization >= 0.7) return "#f97316";
    if (utilization >= 0.4) return "#facc15";
    return "#22c55e";
  };

  const getEdgeStyle = () => {
    if (data?.status === "down") {
      return {
        stroke: "#9e9e9e",
        strokeWidth: "2px",
        strokeDasharray: "6,6",
      };
    }
    if (heatMode) {
      const utilization = Number(data?.utilization ?? 0);
      return {
        stroke: getHeatColor(utilization),
        strokeWidth: Math.max(2, utilization * 6),
      };
    }
    let baseStyle;
    if (focusedNode?.id === source) {
      baseStyle = {
        strokeWidth: "2px",
        stroke: "#009cff"
      };
    } else if (focusedNode?.id === target) {
      baseStyle = {
        strokeWidth: "2px",
        stroke: "#9c00ff"
      };
    } else {
      baseStyle = {
        strokeWidth: "2px",
      };
    }


    if (data.label === "power") {
      return { stroke: "#ff0000", ...baseStyle,  };
    }
    if (data.label === "network") {
      return { stroke: "#00ff00", ...baseStyle };
    }
    if (data.label === "command") {
      return {
        ...baseStyle,
        strokeWidth: "4px", 
      };
    }
    if (data.label === "sync") {
      return {
        ...baseStyle,
        strokeDasharray: "5,5",
        animation: `dashedLine 1s linear infinite`,
      };
    }
    return { ...baseStyle };
  };

  return (
    <>
      {data.label === "sync" && <style>{edgeAnimationStyle}</style>}
      <BaseEdge
        id={id}
        path={edgePath}
        style={getEdgeStyle()}
      />
      {data?.animate && data?.status !== "down" && (
        <circle r="7" fill="#009cff">
          <animateMotion dur={`${duration}s`} repeatCount="indefinite" path={edgePath} />
        </circle>
      )}
      <EdgeLabelRenderer>
        <div
          className="absolute -translate-x-1/2 -translate-y-1/2 bg-white/80 backdrop-blur-sm p-2 rounded-lg shadow-lg text-sm pointer-events-auto cursor-pointer hover:bg-white/90 transition-all duration-200 border border-gray-200/50"
          style={{
            transform: `translate(${labelX}px,${labelY}px)`,
          }}
          onClick={(e) => {
            e.stopPropagation();
            const edge = edges.find((edge) => edge.id === id);
            setSelectedEdge(edge);
          }}
        >
          <div className="font-medium">{data?.label || "New Connection"}</div>
          {heatMode && (
            <div className="text-xs text-gray-600 mt-1">
              Utilization: {Math.round((data?.utilization ?? 0) * 100)}%
            </div>
          )}
          {/* {data?.connectionDetails && Object.keys(data.connectionDetails).length > 0 && (
            <div className="text-xs text-gray-600 mt-1">
              {Object.entries(data.connectionDetails).map(([key, value]) => (
                <div key={key}>
                  <span className="font-medium">{key}:</span> {value}
                </div>
              ))}
            </div>
          )} */}
        </div>
      </EdgeLabelRenderer>
    </>
  );
}
