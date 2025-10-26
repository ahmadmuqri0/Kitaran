import { createRouter } from "sv-router";
import Dashboard from "@/pages/dashboard.svelte";
import AppLayout from "$lib/layouts/app-layout.svelte";

export const { p, navigate, isActive, route } = createRouter({
  "/": Dashboard,
  layout: AppLayout,
});
