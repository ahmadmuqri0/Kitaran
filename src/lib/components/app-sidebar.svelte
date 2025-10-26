<script lang="ts">
  import NavMain from "./nav-main.svelte";
  import NavFooter from "./nav-footer.svelte";
  import NavUser from "./nav-user.svelte";
  import * as Sidebar from "$lib/components/ui/sidebar/index";
  import type { ComponentProps } from "svelte";
  import AppLogo from "./app-logo.svelte";

  import { p } from "@/router";
  import { navMain, navFooter } from "$lib/nav-items";
  import type { User } from "$lib/types";

  let {
    ref = $bindable(null),
    ...restProps
  }: ComponentProps<typeof Sidebar.Root> = $props();

  let user: User = {
    name: "Test User",
    email: "user@test.com",
    avatar: "",
  };
</script>

<Sidebar.Root bind:ref variant="inset" {...restProps}>
  <Sidebar.Header>
    <Sidebar.Menu>
      <Sidebar.MenuItem>
        <Sidebar.MenuButton size="lg">
          {#snippet child({ props })}
            <a href={p("/")} {...props}>
              <AppLogo />
            </a>
          {/snippet}
        </Sidebar.MenuButton>
      </Sidebar.MenuItem>
    </Sidebar.Menu>
  </Sidebar.Header>
  <Sidebar.Content>
    <NavMain items={navMain} />
    <NavFooter items={navFooter} class="mt-auto" />
  </Sidebar.Content>
  <Sidebar.Footer>
    <NavUser {user} />
  </Sidebar.Footer>
</Sidebar.Root>
