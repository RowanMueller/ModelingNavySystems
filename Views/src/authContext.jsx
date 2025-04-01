import { createContext, useContext, useState, useEffect } from "react";

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  // checks if there is an access token when the provider mounts
  useEffect(() => {
    const token = localStorage.getItem("access_token");
    if (token) {
      verifyToken(token);
    }
  }, []);

  const verifyToken = async (token) => {
    const response = await fetch("http://localhost:8000/api/protected/", {
      headers: { Authorization: `Bearer ${token}` },
    });

    if (response.ok) {
      // set your user info accordingly - here we use a simple flag
      setUser({ loggedIn: true });
    } else {
      refreshAccessToken();
    }
  };

  const refreshAccessToken = async () => {
    const refresh = localStorage.getItem("refresh_token");
    if (!refresh) return logout();

    const response = await fetch("http://localhost:8000/api/token/refresh/", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ refresh }),
    });

    if (response.ok) {
      const data = await response.json();
      localStorage.setItem("access_token", data.access);
      verifyToken(data.access);
    } else {
      logout();
    }
  };

  const login = (data) => {
    // assuming data contains both tokens, and possibly more user info
    localStorage.setItem("access_token", data.access);
    localStorage.setItem("refresh_token", data.refresh);
    setUser({ loggedIn: true, ...data.user });
  };

  const logout = () => {
    localStorage.removeItem("access_token");
    localStorage.removeItem("refresh_token");
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
