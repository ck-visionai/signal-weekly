import { createRoot } from "react-dom/client";
import App from "./App";
import "./index.css";

const requestedRoute = new URLSearchParams(window.location.search).get("_route");
if (requestedRoute?.startsWith("/")) {
  window.history.replaceState(null, "", requestedRoute);
}

createRoot(document.getElementById("root")!).render(<App />);
