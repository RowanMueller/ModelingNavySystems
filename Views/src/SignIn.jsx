import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "./authContext";
import axios from "axios";

export default function SignIn() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();
  const { login } = useAuth();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");

    console.log(import.meta.env.VITE_BASE_URL);

    try {
      const { data } = await axios.post(
        `${import.meta.env.VITE_BASE_URL}/api/v1/login/`,
        { username, password },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      console.log("Login response:", {
        ...data,
        access: data.access ? "HIDDEN" : undefined,
      });

      if (!data.access || !data.refresh) {
        setError("Invalid response from server: missing tokens");
        return;
      }

      login(data);
      // Navigate to the attempted page or default to /upload
      navigate("/dashboard", { replace: true });
    } catch (err) {
      console.error("Login error:", err);
      setError(
        err.response?.data?.detail ||
          err.response?.data?.error ||
          "An error occurred during login"
      );
    }
  };

  return (
    <div>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <h1 className="text-4xl font-bold mb-4">Sign in</h1>
          {error && (
            <div className="w-full p-3 mb-4 text-red-500 border border-red-500 rounded-md">
              {error}
            </div>
          )}
          <form
            onSubmit={handleSubmit}
            className="flex flex-col items-center justify-center w-full space-y-4"
          >
            <input
              type="text"
              placeholder="Username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
              required
            />
            <input
              type="password"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
              required
            />
            <button
              type="submit"
              className="w-full p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 transition-colors"
            >
              Sign in
            </button>
            <div>
              <span>Don't have an account? </span>
              <a href="/sign-up" className="text-blue-500 hover:text-blue-600">
                Sign up
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
