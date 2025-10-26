<script lang="ts">
  import * as DropdownMenu from "$lib/components/ui/dropdown-menu/index";
  import type { User } from "$lib/types";
  import { LogOut, Settings } from "@lucide/svelte";
  import UserInfo from "./user-info.svelte";
  import { p } from "@/router";

  let { user }: { user: User } = $props();
</script>

<DropdownMenu.Label class="p-0 font-normal">
  <div class="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
    <UserInfo {user} showEmail={true} />
  </div>
</DropdownMenu.Label>
<DropdownMenu.Separator />
<DropdownMenu.Group>
  <DropdownMenu.Item>
    <Settings />
    <a href={p("/")}> Settings </a>
  </DropdownMenu.Item>
</DropdownMenu.Group>
<DropdownMenu.Separator />
<DropdownMenu.Item>
  <LogOut />
  <a href={p("/")}> Log out </a>
</DropdownMenu.Item>
