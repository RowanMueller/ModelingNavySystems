import React from "react";
import DragAndDrop from "./DragAndDrop";

export default function UploadPage() {
  return (
    <div className="flex flex-col items-center justify-center w-screen h-screen">
      <div className="flex flex-col items-center justify-center w-full max-w-lg">
        <DragAndDrop></DragAndDrop>
      </div>
    </div>
  );
}
