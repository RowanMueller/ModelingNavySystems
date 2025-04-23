import React, { useState } from "react";
import { useEdgesState } from "@xyflow/react";
import { GraphContext } from "./graphContext";

export default function GraphProvider({ children }) {
  const [edges, setEdges, onEdgesChange] = useEdgesState([]);
  const [selectedEdge, setSelectedEdge] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);
  const [focusedNode, setFocusedNode] = useState(null);
  return (
    <GraphContext.Provider
      value={{ edges, setEdges, onEdgesChange, selectedEdge, setSelectedEdge, selectedNode, setSelectedNode, focusedNode, setFocusedNode }}
    >
      {children}
    </GraphContext.Provider>
  );
}
