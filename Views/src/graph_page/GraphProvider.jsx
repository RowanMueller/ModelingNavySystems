import React, { useState } from "react";
import { useEdgesState } from "@xyflow/react";
import { GraphContext } from "./graphContext";

export default function GraphProvider({ children }) {
  const [edges, setEdges, onEdgesChange] = useEdgesState([]);
  const [selectedEdge, setSelectedEdge] = useState(null);

  return (
    <GraphContext.Provider
      value={{ edges, setEdges, onEdgesChange, selectedEdge, setSelectedEdge }}
    >
      {children}
    </GraphContext.Provider>
  );
}
