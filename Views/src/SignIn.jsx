import React, { useState } from "react";

export default function SignIn() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  const handleSignIn = async (credentials) => {
    const response = await fetch("http://localhost:8000/api/token/", { //TODO: Update the URL
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(credentials),
    });

    if (response.ok) {
      const data = await response.json();
      localStorage.setItem("access_token", data.access);
      localStorage.setItem("refresh_token", data.refresh);
    }
  };

  return (
    <div>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <h1 className="text-4xl font-bold mb-4">Sign in</h1>
          <form className="flex flex-col items-center justify-center w-full space-y-4">
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
            <button
              className="w-full p-2 bg-blue-500 text-white rounded-md"
              onSubmit={(e) => {
                e.preventDefault();
                handleSignIn({ username, password });
              }}
            >
              Sign in
            </button>
            <div>
              <span>Don't have an account? </span>
              <a href="/sign-up" className="text-blue-500">
                Sign up
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}
