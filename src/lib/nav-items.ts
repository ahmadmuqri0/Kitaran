import type { NavItem } from "$lib/types";
import { House } from "@lucide/svelte";
import LifeBuoyIcon from "@lucide/svelte/icons/life-buoy";
import SendIcon from "@lucide/svelte/icons/send";

export const navMain: NavItem[] = [
  {
    title: "Dashboard",
    url: "/",
    icon: House,
  },
];

export const navFooter: NavItem[] = [
  {
    title: "Support",
    url: "#",
    icon: LifeBuoyIcon,
  },
  {
    title: "Feedback",
    url: "#",
    icon: SendIcon,
  },
];
