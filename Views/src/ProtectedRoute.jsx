import { Navigate } from "react-router-dom";
import { useAuth } from "./authContext";

export const ProtectedRoute = ({ children }) => {
  const { user } = useAuth();
  const isOptionalLogin = import.meta.env.VITE_OPTIONAL_LOGIN === 'true';

  if (isOptionalLogin) {
    return children;
  }

  return user ? children : <Navigate to="/sign-in" />;
};
