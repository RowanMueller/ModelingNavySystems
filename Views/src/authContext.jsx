import { createContext, useContext, useState, useEffect } from "react";
import { motion } from "framer-motion";

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  // checks if there is an access token when the provider mounts
  useEffect(() => {
    const initializeAuth = async () => {
      const token = localStorage.getItem("access_token");
      if (token) {
        try {
          const response = await fetch(
            `${import.meta.env.VITE_BASE_URL}/api/v1/auth/verify/`,
            {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${token}`,
              },
              body: JSON.stringify({ token }),
            }
          );

          if (response.ok) {
            // If token is valid, set the user state
            setUser({ loggedIn: true });
          } else {
            // If token is invalid, try to refresh it
            await refreshAccessToken();
          }
        } catch (error) {
          console.error("Token verification failed:", error);
          await refreshAccessToken();
        }
      }
      setLoading(false);
    };

    initializeAuth();
  }, []);

  const refreshAccessToken = async () => {
    const refresh = localStorage.getItem("refresh_token");
    if (!refresh) {
      logout();
      return false;
    }

    try {
      const response = await fetch(
        `${import.meta.env.VITE_BASE_URL}/api/v1/auth/refresh/`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            // authorization header is not needed for refresh
          },
          body: JSON.stringify({ refresh }),
        }
      );

      if (response.ok) {
        const data = await response.json();
        localStorage.setItem("access_token", data.access);
        setUser({ loggedIn: true });
        return true;
      } else {
        logout();
        return false;
      }
    } catch (error) {
      console.error("Token refresh failed:", error);
      logout();
      return false;
    }
  };

  const login = (data) => {
    console.log("Login data received:", {
      ...data,
      access: "HIDDEN",
      refresh: "HIDDEN",
    });

    if (!data.access || !data.refresh) {
      console.error("Missing tokens in login data");
      return;
    }

    localStorage.setItem("access_token", data.access);
    localStorage.setItem("refresh_token", data.refresh);
    setUser({ loggedIn: true, ...data.user });
  };

  const logout = () => {
    localStorage.removeItem("access_token");
    localStorage.removeItem("refresh_token");
    setUser(null);
  };

  if (loading) {
    return (
      <div className="flex h-screen w-full items-center justify-center">
        <motion.div
          className="flex space-x-2"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ repeat: Infinity, duration: 1.5 }}
        >
          {[...Array(3)].map((_, i) => (
            <motion.div
              key={i}
              className="h-6 w-6 rounded-full bg-blue-500"
              animate={{
                scale: [1, 1.5, 1],
                opacity: [0.5, 1, 0.5],
              }}
              transition={{
                repeat: Infinity,
                duration: 1,
                delay: i * 0.2,
              }}
            />
          ))}
        </motion.div>
      </div>
    );
  }

  return (
    <AuthContext.Provider value={{ user, login, logout, refreshAccessToken }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
