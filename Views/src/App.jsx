import "./App.css";
import DragAndDrop from "./dragAndDrop";
import { Toaster } from "react-hot-toast";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import GraphPage from "./graphPage";

function App() {
  return (
    <>
      <Toaster position="top-center" reverseOrder={false} />
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
          <Route path="/graph" element={
            <GraphPage></GraphPage>
          } />
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
