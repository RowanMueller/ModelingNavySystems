import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { X } from "lucide-react";

export default function DragAndDrop() {
  const [files, setFiles] = useState([]);

  const onDrop = useCallback((acceptedFiles) => {
    setFiles((prevFiles) => [...prevFiles, ...acceptedFiles]);
  }, []);

  const removeFile = (fileName) => {
    setFiles((prevFiles) => prevFiles.filter((file) => file.name !== fileName));
  };

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      "text/csv": [".csv"],
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": [
        ".xlsx",
      ],
      "application/vnd.ms-excel": [".xls"],
    },
    multiple: true,
  });

  return (
    <div className="p-6 border-dashed rounded-xl w-full mb-10 border-surface-100">
      {/* Drag & Drop Area */}
      <div
        {...getRootProps()}
        className={`p-6 text-center cursor-pointer ${
          isDragActive ? "border-blue-500" : "border-gray-300"
        }`}
      >
        <input {...getInputProps()} />
        <p className="text-gray-600">
          {isDragActive
            ? "Drop the files here..."
            : "Drag & drop files here, or click to select files"}
        </p>
      </div>

      <div className="mt-4 max-h-[400px] overflow-y-scroll">
        {files.length > 0 && (
          <>
            <ul className="space-y-2 py-2">
              {files.map((file) => (
                <li
                  key={file.name}
                  className="flex items-center justify-between p-2 border rounded-lg shadow-sm border-surface-100"
                >
                  <span className="truncate">{file.name}</span>
                  <button
                    onClick={() => removeFile(file.name)}
                    className="p-1 text-red-500 hover:text-red-700"
                  >
                    <X size={18} />
                  </button>
                </li>
              ))}
            </ul>
          </>
        )}
      </div>
    </div>
  );
}
