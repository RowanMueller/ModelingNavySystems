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

  console.log(edges);

  return (
    <>
      <BaseEdge id={id} path={edgePath} />
      <EdgeLabelRenderer>
        <div
          className="absolute -translate-x-1/2 -translate-y-1/2 bg-white p-1 rounded text-xs pointer-events-auto cursor-pointer"
          style={{
            transform: `translate(${labelX}px,${labelY}px)`,
          }}
          onClick={(e) => {
            e.stopPropagation();
            const edge = edges.find((edge) => edge.id === id);
            setSelectedEdge(edge);
          }}
        >
          {data?.label || ""}
        </div>
      </EdgeLabelRenderer>
    </>
  );
};
