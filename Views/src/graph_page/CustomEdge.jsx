import { BaseEdge, EdgeLabelRenderer, getBezierPath } from "@xyflow/react";
import "@xyflow/react/dist/style.css";
import useGraph from "./useGraph";

export default function CustomEdge({
  id,
  sourceX,
  sourceY,
  targetX,
  targetY,
  sourcePosition,
  targetPosition,
  data,
}) {
  const { edges, setSelectedEdge } = useGraph();
  const [edgePath, labelX, labelY] = getBezierPath({
    sourceX,
    sourceY,
    sourcePosition,
    targetX,
    targetY,
    targetPosition,
  });

  console.log(data);
  return (
    <>
      <BaseEdge id={id} path={edgePath} />
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
};
