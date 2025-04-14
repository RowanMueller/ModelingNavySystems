import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "./authContext";
import axios from "axios";

export default function SignUp() {
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();
  const { login } = useAuth();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");

    if (password !== confirmPassword) {
      setError("Passwords do not match");
      return;
    }

    try {
      const { data } = await axios.post(
        `${import.meta.env.VITE_BASE_URL}/api/v1/register/`,
        {
          email,
          username,
          password,
        },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      );

      console.log("Registration response:", {
        ...data,
        access: data.access ? "HIDDEN" : undefined,
        user: data.user ? { ...data.user, password: "HIDDEN" } : undefined,
      });

      if (!data.access || !data.refresh) {
        setError("Invalid response from server: missing tokens");
        return;
      }
      login(data);
      navigate("/dashboard");
    } catch (err) {
      console.error("Registration error:", err);
      const errorData = err.response?.data;
      const errorMessage =
        errorData?.username?.[0] ||
        errorData?.email?.[0] ||
        errorData?.password?.[0] ||
        errorData?.error ||
        errorData?.detail ||
        "An error occurred during registration";
      setError(errorMessage);
    }
  };

  return (
    <div>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <h1 className="text-4xl font-bold mb-4">Sign up</h1>
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
              type="email"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
              required
            />
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
            <input
              type="password"
              placeholder="Confirm password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
              required
            />
            <button
              type="submit"
              className="w-full p-2 bg-blue-500 text-white rounded-md hover:bg-blue-600 transition-colors"
            >
              Sign up
            </button>
            <div>
              <span>Already have an account? </span>
              <a href="/sign-in" className="text-blue-500 hover:text-blue-600">
                Sign in
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
