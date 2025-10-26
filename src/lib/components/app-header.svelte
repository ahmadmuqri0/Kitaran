<script lang="ts">
  import SidebarTrigger from "./ui/sidebar/sidebar-trigger.svelte";
  import Separator from "./ui/separator/separator.svelte";
  import Breadcrumbs from "./breadcrumbs.svelte";
  import ThemeSwitcher from "./theme-switcher.svelte";
  import type { BreadcrumbItem } from "$lib/types";

  let { breadcrumbs }: { breadcrumbs: BreadcrumbItem[] } = $props();
</script>

<header class="flex h-16 shrink-0 items-center gap-2 justify-between px-4">
  <div class="flex items-center gap-2 px-4">
    <SidebarTrigger class="-ml-1" />
    <Separator
      orientation="vertical"
      class="mr-2 data-[orientation=vertical]:h-4"
    />
    <Breadcrumbs {breadcrumbs} />
  </div>
  <ThemeSwitcher />
</header>
