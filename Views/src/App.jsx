import "./App.css";
import { Toaster } from "react-hot-toast";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Download from "./Download";
import GraphPage from "./GraphPage";
import SignIn from "./signin";
import SignUp from "./signup";
import { AuthProvider } from "./authContext";
import { ProtectedRoute } from "./ProtectedRoute";
import UploadPage from "./uploadPage/UploadPage";

function App() {
  return (
    <>
      <Toaster position="top-center" reverseOrder={false} />
      <AuthProvider>
        <BrowserRouter>
          <Routes>
            <Route
              path="/upload"
              element={
                <ProtectedRoute>
                  <UploadPage></UploadPage>
                </ProtectedRoute>
              }
            />
            <Route
              path="/graph"
              element={
                <ProtectedRoute>
                  <GraphPage></GraphPage>
                </ProtectedRoute>
              }
            />
            <Route
              path="/download"
              element={
                <ProtectedRoute>
                  <Download></Download>
                </ProtectedRoute>
              }
            />
            <Route path="/sign-in" element={<SignIn></SignIn>} />
            <Route path="/sign-up" element={<SignUp></SignUp>} />
          </Routes>
        </BrowserRouter>
      </AuthProvider>
    </>
  );
}

export default App;
