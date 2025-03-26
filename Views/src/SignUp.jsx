import React from "react";

export default function SignUp() {
  return (
    <div>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <h1 className="text-4xl font-bold mb-4">Sign up</h1>
          <form className="flex flex-col items-center justify-center w-full space-y-4">
            <input
              type="text"
              placeholder="Email"
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="text"
              placeholder="Username"
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="password"
              placeholder="Password"
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <input
              type="password"
              placeholder="Confirm password"
              className="w-full p-2 border border-gray-300 rounded-md"
            />
            <button className="w-full p-2 bg-blue-500 text-white rounded-md">
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
