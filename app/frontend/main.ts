import { mount } from "svelte";
import App from "./App.svelte";
import "./app.css";

function start() {
  const target = document.getElementById("svelte-app")!;
  mount(App, { target });
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", start);
} else {
  start();
}
