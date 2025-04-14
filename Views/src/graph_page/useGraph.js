import { useContext } from "react";
import { GraphContext } from "./graphContext";

export default function useGraph() {
  const context = useContext(GraphContext);
  if (!context) {
    throw new Error("useGraph must be used within a GraphProvider");
  }
  return context;
}
