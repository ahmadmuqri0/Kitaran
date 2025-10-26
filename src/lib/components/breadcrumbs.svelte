<script lang="ts">
  import * as Breadcrumb from "$lib/components/ui/breadcrumb/index";
  import type { BreadcrumbItem } from "$lib/types";

  let { breadcrumbs }: { breadcrumbs: BreadcrumbItem[] } = $props();
</script>

<Breadcrumb.Root>
  <Breadcrumb.List>
    {#each breadcrumbs as item, index (index)}
      <Breadcrumb.Item>
        {#if index === breadcrumbs.length - 1}
          <Breadcrumb.Page>{item.title}</Breadcrumb.Page>
        {:else}
          <Breadcrumb.Link href={item.href ?? "#"}>
            {item.title}
          </Breadcrumb.Link>
        {/if}
      </Breadcrumb.Item>
      {#if index !== breadcrumbs.length - 1}
        <Breadcrumb.Separator />
      {/if}
    {/each}
  </Breadcrumb.List>
</Breadcrumb.Root>
