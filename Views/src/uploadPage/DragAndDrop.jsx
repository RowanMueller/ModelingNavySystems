import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { X } from "lucide-react";
import axios from "axios";
import toast from "react-hot-toast";

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
      "text/plain": [".sysml"],
    },
    multiple: true,
  });

  return (
    <div className="flex flex-col items-center justify-center">
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
      <button className="w-full rounded-lg py-2 bg-red-500 hover:bg-red-600 text-white mt-4">
        <span className="text-white" onClick={() => setFiles([])}>
          Clear All
        </span>
      </button>
      <button
        className="w-full rounded-lg py-2 bg-blue-500 hover:bg-blue-600 text-white mt-4"
        onClick={async () => {
          const formData = new FormData();
          files.forEach((file) => formData.append("files", file)); // Append multiple files
          await axios
            .post(`${import.meta.env.VITE_BASE_URL}/api/v1/upload/`, formData, {
              headers: {
                "Content-Type": "multipart/form-data",
                Authorization: `Bearer ${localStorage.getItem("access_token")}`,
              },
            })
            .then((response) => {
              console.log(response.data);
              toast.success("Successfully uploaded files");
            })
            .catch((error) => {
              console.error(error);
            });
        }}
      >
        <span className="text-white">Upload</span>
      </button>
    </div>
  );
}
