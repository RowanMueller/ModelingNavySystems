import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function SignUp() {
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const navigate = useNavigate();

  const handleSignUp = async (credentials) => {
    const response = await fetch("http://localhost:8000/api/users/", {
      //TODO: Update the URL
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(credentials),
    });

    if (response.ok) {
      const data = await response.json();
      localStorage.setItem("access_token", data.access);
      localStorage.setItem("refresh_token", data.refresh);
      navigate("/dashboard");
    }
  };

  return (
    <div>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <h1 className="text-4xl font-bold mb-4">Sign up</h1>
          <form className="flex flex-col items-center justify-center w-full space-y-4">
            <input
              type="text"
              placeholder="Email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="text"
              placeholder="Username"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="password"
              placeholder="Password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="password"
              placeholder="Confirm password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <button
              className="w-full p-2 bg-blue-500 text-white rounded-md"
              onSubmit={(e) => {
                e.preventDefault();
                if (password !== confirmPassword) {
                  alert("Passwords do not match");
                  return;
                }
                handleSignUp({ email, username, password, confirmPassword });
              }}
            >
              Sign up
            </button>
            <div>
              <span>Already have an account? </span>
              <a href="/sign-in" className="text-blue-500">
                Sign in
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
