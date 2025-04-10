import { Navigate, useLocation } from "react-router-dom";
import { useAuth } from "./authContext";

export const ProtectedRoute = ({ children }) => {
  const { user } = useAuth();
  const location = useLocation(); // location object is passed in so that we know which page the user tried to access
  const isOptionalLogin = import.meta.env.VITE_OPTIONAL_LOGIN === 'true';

  if (isOptionalLogin) {
    return children;
  }

  if (!user) {
    // Redirect to sign-in but save the attempted location
    // state passed in the location object is preserved through state from the location
    return <Navigate to="/sign-in" state={{ from: location }} replace />;
  }

  return children;
};
