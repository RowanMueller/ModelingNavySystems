import { Navigate, useLocation } from "react-router-dom";
import { useAuth } from "./authContext";

export const ProtectedRoute = ({ children }) => {
  const { user } = useAuth();
  const location = useLocation();
  const isOptionalLogin = import.meta.env.VITE_OPTIONAL_LOGIN === 'true';

  if (isOptionalLogin) {
    return children;
  }

  if (!user) {
    // Redirect to sign-in but save the attempted location
    return <Navigate to="/sign-in" state={{ from: location }} replace />;
  }

  return children;
};
