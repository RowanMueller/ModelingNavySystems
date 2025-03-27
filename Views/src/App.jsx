import "./App.css";
import DragAndDrop from "./DragAndDrop";
import { Toaster } from "react-hot-toast";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import GraphPage from "./GraphPage";
import SignIn from "./signin";
import SignUp from "./signup";
import { AuthProvider } from "./authContext";

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
                <div className="flex flex-col items-center justify-center w-screen h-screen">
                  <div className="flex flex-col items-center justify-center w-full max-w-lg">
                    <DragAndDrop></DragAndDrop>
                  </div>
                </div>
              }
            />
            <Route path="/graph" element={<GraphPage></GraphPage>} />
            <Route path="/sign-in" element={<SignIn></SignIn>} />
            <Route path="/sign-up" element={<SignUp></SignUp>} />
          </Routes>
        </BrowserRouter>
      </AuthProvider>
    </>
  );
}

export default App;
