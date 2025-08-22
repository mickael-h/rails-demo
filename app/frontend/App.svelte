<script>
  import { Button } from 'flowind-design-system'
  import { buildButtonClasses } from 'flowind-design-system/styles'
  
  let count = $state(0)
  
  function increment() {
    count++
  }
  
  // Debug: Let's see what classes are generated
  const debugClasses = buildButtonClasses({ variant: 'primary', size: 'md' })
  console.log('Debug classes:', debugClasses)
</script>

<main class="min-h-screen bg-gray-50 flex items-center justify-center">
  <div class="text-center">
    <h1 class="text-4xl font-bold text-gray-900 mb-8">
      Hello Svelte 5!
    </h1>
    
    <div class="mb-4">
      <p class="text-lg text-gray-600">Count: {count}</p>
    </div>
    
    <Button 
      variant="primary" 
      size="md"
      onclick={increment}
    >
      Increment
    </Button>
  </div>
</main>
