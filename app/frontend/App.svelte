<script>
  import { Button, Accordion } from 'flowind-design-system';

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
</script>

<main class="min-h-screen bg-gray-50 p-8">
  <div class="max-w-4xl mx-auto">
    <h1 class="text-4xl font-bold text-gray-900 mb-8 text-center">
      Flowind Design System Demo
    </h1>

    <!-- Counter Section -->
    <div class="p-6 bg-white rounded-lg shadow-md mb-8">
      <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">
        Interactive Counter: {count}
      </h2>

      <div class="space-x-4 text-center">
        <Button variant="primary" size="md" onclick={increment}>
          Increment
        </Button>

        <Button variant="secondary" size="md" onclick={decrement}>
          Decrement
        </Button>

        <Button variant="outline" size="md" onclick={reset}>Reset</Button>
      </div>
    </div>

    <!-- Button Variants Section -->
    <div class="p-6 bg-white rounded-lg shadow-md mb-8">
      <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">
        Button Variants
      </h2>

      <div class="space-y-4">
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

    <!-- Accordion Section -->
    <div class="p-6 bg-white rounded-lg shadow-md">
      <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">
        Frequently Asked Questions
      </h2>

      <Accordion
        items={[
          {
            id: 'faq-1',
            title: 'What is Flowind Design System?',
            content: faqOneContent,
          },
          {
            id: 'faq-2',
            title: 'How do I customize the components?',
            content: faqTwoContent,
          },
          {
            id: 'faq-3',
            title: 'Is it accessible?',
            content: faqThreeContent,
          },
        ]}
      />
    </div>
  </div>
</main>

{#snippet faqOneContent()}
  <p class="text-gray-600 mb-4">
    Flowind Design System is a comprehensive UI component library built with
    Svelte and Tailwind CSS. It provides a set of accessible, customizable
    components that follow modern design principles.
  </p>
  <p class="text-gray-600">
    The system is designed to be easy to use, highly customizable, and
    production-ready.
  </p>
{/snippet}

{#snippet faqTwoContent()}
  <p class="text-gray-600 mb-4">
    You can customize Flowind components in several ways:
  </p>
  <ul class="list-disc list-inside text-gray-600 space-y-2">
    <li>Using the variant and size props</li>
    <li>Applying custom CSS classes</li>
    <li>Modifying the theme variables</li>
    <li>Extending components with additional props</li>
  </ul>
{/snippet}

{#snippet faqThreeContent()}
  <p class="text-gray-600 mb-4">
    Yes! Flowind Design System is built with accessibility in mind from the
    ground up.
  </p>
  <p class="text-gray-600">
    All components follow WCAG guidelines and include proper ARIA attributes,
    keyboard navigation, and screen reader support.
  </p>
{/snippet}
