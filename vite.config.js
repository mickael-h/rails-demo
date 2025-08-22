import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import tailwindcss from "@tailwindcss/vite";
import { resolve } from "path";

export default defineConfig({
  plugins: [
    svelte({
      extensions: [".svelte", ".svelte.ts", ".svelte.js"],
      compilerOptions: {
        runes: true,
      },
    }),
    tailwindcss(),
  ],
  resolve: {
    alias: {
      $lib: resolve(__dirname, "../flowind/src/lib"),
    },
  },
  build: {
    outDir: "public/assets",
    rollupOptions: {
      input: "app/frontend/main.ts",
      output: {
        entryFileNames: "app.js",
        chunkFileNames: "[name].js",
        assetFileNames: "[name].[ext]",
      },
    },
  },
  server: {
    port: 5174,
  },
});
