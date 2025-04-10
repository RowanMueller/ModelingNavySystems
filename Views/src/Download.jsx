import { Axios } from "axios";
import React from "react";

export default function Download() {
  return (
    <div className="flex flex-col items-center justify-center w-screen h-screen">
      <div className="flex flex-col items-center justify-center w-full max-w-lg">
        <h1 className="text-4xl font-bold text-center">Download Page</h1>
        <button
          className="mt-4 p-2 bg-blue-500 text-white rounded-lg"
          onClick={() => {
            Axios.get(`${import.meta.env.VITE_BASE_URL}/api/v1/download`, {
              headers: {
                Authorization: `Bearer ${localStorage.getItem("access_token")}`,
              },
              responseType: "blob", // Ensure binary data is handled correctly
            }).then((res) => {
              const blob = new Blob([res.data], {
                type: res.headers["content-type"],
              });

              // Extract filename from headers if available
              let filename = "downloadedFile";
              const contentDisposition = res.headers["content-disposition"];
              if (contentDisposition) {
                const match = contentDisposition.match(/filename="?([^"]+)"?/);
                if (match) filename = match[1];
              }

              const url = window.URL.createObjectURL(blob);
              const link = document.createElement("a");
              link.href = url;
              link.setAttribute("download", filename);
              document.body.appendChild(link);
              link.click();
              document.body.removeChild(link);
              window.URL.revokeObjectURL(url);
            });
          }}
        >
          Download
        </button>
      </div>
    </div>
  );
}
