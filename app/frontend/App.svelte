<script>
  // Flowind Design System
  import { Button } from 'flowind-design-system';

  // Flowbite Svelte
  import { Button as FlowbiteButton } from 'flowbite-svelte';

  // Flowind counter
  let count = $state(0);

  function increment() {
    count++;
  }

  function decrement() {
    count--;
  }

  function reset() {
    count = 0;
  }

  // Flowbite counter
  let flowbiteCount = $state(0);

  function flowbiteIncrement() {
    flowbiteCount++;
  }

  function flowbiteDecrement() {
    flowbiteCount--;
  }

  function flowbiteReset() {
    flowbiteCount = 0;
  }
</script>

<main class="min-h-screen bg-gray-50 p-8">
  <div class="max-w-6xl mx-auto">
    <h1 class="text-4xl font-bold text-gray-900 mb-8 text-center">
      Flowind vs Flowbite Svelte Comparison
    </h1>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
      <!-- Flowind Design System -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">
          Flowind Design System
        </h2>

        <div class="text-center mb-6">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">
            Counter: {count}
          </h3>

          <div class="space-x-4 mb-8">
            <Button variant="primary" size="md" onclick={increment}>
              Increment
            </Button>

            <Button variant="secondary" size="md" onclick={decrement}>
              Decrement
            </Button>

            <Button variant="outline" size="md" onclick={reset}>Reset</Button>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-gray-800 mb-4 text-center">
            Button Variants
          </h3>

          <div class="space-x-2 text-center">
            <Button variant="primary" size="sm">Primary Small</Button>
            <Button variant="primary" size="md">Primary Medium</Button>
            <Button variant="primary" size="lg">Primary Large</Button>
          </div>

          <div class="space-x-2 text-center">
            <Button variant="secondary" size="sm">Secondary Small</Button>
            <Button variant="secondary" size="md">Secondary Medium</Button>
            <Button variant="secondary" size="lg">Secondary Large</Button>
          </div>

          <div class="space-x-2 text-center">
            <Button variant="outline" size="sm">Outline Small</Button>
            <Button variant="outline" size="md">Outline Medium</Button>
            <Button variant="outline" size="lg">Outline Large</Button>
          </div>
        </div>
      </div>

      <!-- Flowbite Svelte -->
      <div class="p-6 bg-white rounded-lg shadow-md">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">
          Flowbite Svelte
        </h2>

        <div class="text-center mb-6">
          <h3 class="text-xl font-semibold text-gray-800 mb-4">
            Counter: {flowbiteCount}
          </h3>

          <div class="space-x-4 mb-8">
            <FlowbiteButton color="blue" size="md" onclick={flowbiteIncrement}>
              Increment
            </FlowbiteButton>

            <FlowbiteButton color="gray" size="md" onclick={flowbiteDecrement}>
              Decrement
            </FlowbiteButton>

            <FlowbiteButton color="light" size="md" onclick={flowbiteReset}>
              Reset
            </FlowbiteButton>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-gray-800 mb-4 text-center">
            Button Variants
          </h3>

          <div class="space-x-2 text-center">
            <FlowbiteButton color="blue" size="xs">Primary Small</FlowbiteButton
            >
            <FlowbiteButton color="blue" size="sm"
              >Primary Medium</FlowbiteButton
            >
            <FlowbiteButton color="blue" size="lg">Primary Large</FlowbiteButton
            >
          </div>

          <div class="space-x-2 text-center">
            <FlowbiteButton color="gray" size="xs"
              >Secondary Small</FlowbiteButton
            >
            <FlowbiteButton color="gray" size="sm"
              >Secondary Medium</FlowbiteButton
            >
            <FlowbiteButton color="gray" size="lg"
              >Secondary Large</FlowbiteButton
            >
          </div>

          <div class="space-x-2 text-center">
            <FlowbiteButton color="light" size="xs"
              >Outline Small</FlowbiteButton
            >
            <FlowbiteButton color="light" size="sm"
              >Outline Medium</FlowbiteButton
            >
            <FlowbiteButton color="light" size="lg"
              >Outline Large</FlowbiteButton
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
