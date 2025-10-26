<script lang="ts">
  import * as Avatar from "$lib/components/ui/avatar/index";
  import type { User } from "$lib/types";
  import { getInitial } from "$lib/utils";

  interface Props {
    user: User;
    showEmail?: boolean;
  }

  let { user, showEmail = false }: Props = $props();
</script>

<Avatar.Root class="size-8 rounded-lg">
  <Avatar.Image src={user.avatar} alt={user.name} />
  <Avatar.Fallback class="rounded-lg">{getInitial(user.name)}</Avatar.Fallback>
</Avatar.Root>
<div class="grid flex-1 text-left text-sm leading-tight">
  <span class="truncate font-medium">{user.name}</span>
  {#if showEmail}
    <span class="truncate text-xs">{user.email}</span>
  {/if}
</div>
