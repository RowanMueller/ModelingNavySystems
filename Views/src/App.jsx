import "./App.css";
import DragAndDrop from "./dragAndDrop";

function App() {
  return (
    <>
      <div className="flex flex-col items-center justify-center w-screen h-screen">
        <div className="flex flex-col items-center justify-center w-full max-w-lg">
          <DragAndDrop></DragAndDrop>
        </div>
      </div>
    </>
  );
}

export default App;
