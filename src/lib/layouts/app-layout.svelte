<script lang="ts">
  import AppSidebar from "$lib/components/app-sidebar.svelte";
  import * as Sidebar from "$lib/components/ui/sidebar/index";
  import { ModeWatcher } from "mode-watcher";
  import type { Snippet } from "svelte";

  let { children }: { children: Snippet } = $props();
</script>

<Sidebar.Provider>
  <AppSidebar />
  <Sidebar.Inset>
    <ModeWatcher />
    {@render children()}
  </Sidebar.Inset>
</Sidebar.Provider>
