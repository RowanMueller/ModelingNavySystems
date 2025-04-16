import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { X, ArrowLeft, Upload } from "lucide-react";
import axios from "axios";
import toast from "react-hot-toast";
import { useNavigate } from "react-router-dom";

export default function UploadPage() {
  const [files, setFiles] = useState([]);
  const [systemName, setSystemName] = useState("");
  const navigate = useNavigate();
  
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
    <div className="min-h-screen bg-gradient-to-br from-blue-400 via-indigo-500 to-cyan-500 animate-gradient bg-[length:400%_400%]">
      {/* Header */}
      <header className="bg-white/10 backdrop-blur-md border-b border-white/20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4 flex items-center justify-between">
          <div className="flex items-center space-x-4">
            <button
              onClick={() => navigate("/dashboard")}
              className="text-white hover:bg-white/10 p-2 rounded-lg transition-all duration-200 flex items-center"
            >
              <ArrowLeft className="w-5 h-5" />
              <span className="ml-2">Back</span>
            </button>
            <h1 className="text-2xl font-bold text-white">Create New System</h1>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <div className="max-w-2xl mx-auto px-4 py-8">
        <div className="bg-white/80 backdrop-blur-md rounded-2xl shadow-xl p-8 space-y-8">
          {/* System Name Input */}
          <div className="space-y-4">
            <label className="block text-lg font-semibold text-gray-900">
              System Name
            </label>
            <input
              type="text"
              placeholder="Enter system name"
              className="w-full px-4 py-3 bg-white/50 backdrop-blur-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent transition-all duration-200"
              value={systemName}
              onChange={(e) => setSystemName(e.target.value)}
            />
          </div>

          {/* File Upload Area */}
          <div className="space-y-4">
            <div
              {...getRootProps()}
              className={`p-8 border-2 border-dashed rounded-xl text-center cursor-pointer transition-all duration-200 ${
                isDragActive
                  ? "border-blue-500 bg-blue-50/50"
                  : "border-gray-300 hover:border-blue-400 bg-white/50"
              }`}
            >
              <input {...getInputProps()} />
              <Upload className="w-12 h-12 mx-auto text-gray-400 mb-4" />
              <p className="text-gray-600">
                {isDragActive
                  ? "Drop the files here..."
                  : "Drag & drop files here, or click to select files"}
              </p>
              <p className="text-sm text-gray-500 mt-2">
                Supported files: .csv, .xlsx, .xls, .sysml
              </p>
            </div>

            {/* File List */}
            {files.length > 0 && (
              <div className="mt-6 max-h-[300px] overflow-y-auto">
                <ul className="space-y-2">
                  {files.map((file) => (
                    <li
                      key={file.name}
                      className="flex items-center justify-between p-3 bg-white/50 backdrop-blur-sm rounded-lg border border-gray-200"
                    >
                      <span className="truncate text-gray-700">{file.name}</span>
                      <button
                        onClick={() => removeFile(file.name)}
                        className="p-1 hover:bg-red-100 rounded-full text-red-500 hover:text-red-600 transition-colors duration-200"
                      >
                        <X className="w-5 h-5" />
                      </button>
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>

          {/* Action Buttons */}
          <div className="flex flex-col space-y-4 pt-4">
            <button
              className="px-4 py-3 bg-blue-500/90 backdrop-blur-md text-white rounded-lg hover:bg-blue-600/90 transition-all duration-300 flex items-center justify-center border border-blue-400/20 shadow-lg"
              onClick={() => {
                if (systemName === "") {
                  toast.error("Please enter a system name");
                  return;
                }

                if (files.length === 0) {
                  axios
                    .post(
                      `${import.meta.env.VITE_BASE_URL}/api/v1/create-system/`,
                      {
                        version: files.length === 0,
                        name: systemName,
                      },
                      {
                        headers: {
                          Authorization: `Bearer ${localStorage.getItem(
                            "access_token"
                          )}`,
                        },
                      }
                    )
                    .then((response) => {
                      navigate(`/system/${response.data.id}/1`, {
                        state: {
                          system: response.data,
                        },
                      });
                    })
                    .catch((error) => {
                      console.log(error);
                      toast.error("Error creating system");
                    });
                  return;
                }

                const formData = new FormData();
                files.forEach((file) => formData.append("files", file));
                formData.append("name", systemName);
                
                axios
                  .post(
                    `${import.meta.env.VITE_BASE_URL}/api/v1/upload/`,
                    formData,
                    {
                      headers: {
                        "Content-Type": "multipart/form-data",
                        Authorization: `Bearer ${localStorage.getItem(
                          "access_token"
                        )}`,
                      },
                    }
                  )
                  .then((response) => {
                    toast.success("Successfully uploaded files");
                    navigate(`/system/${response.data.system.id}`, {
                      state: {
                        system: response.data.system,
                      },
                    });
                  })
                  .catch((error) => {
                    console.log(error);
                    toast.error("Error creating system");
                  });
              }}
            >
              {files.length > 0 ? "Upload and Create System" : "Create Blank System"}
            </button>

            {files.length > 0 && (
              <button
                className="px-4 py-3 bg-red-500/80 backdrop-blur-md text-white rounded-lg hover:bg-red-600/80 transition-all duration-300 flex items-center justify-center border border-red-400/20 shadow-lg"
                onClick={() => {
                  setFiles([]);
                  setSystemName("");
                }}
              >
                Clear All
              </button>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
