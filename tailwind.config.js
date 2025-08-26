/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './app/frontend/**/*.{html,js,svelte,ts}',
    './app/views/**/*.erb',
    './node_modules/flowbite-svelte/dist/**/*.svelte',
    './node_modules/flowbite-svelte/dist/**/*.js',
    './node_modules/flowbite-svelte/dist/**/*.ts',
  ],
  theme: {
    extend: {},
  },
};
