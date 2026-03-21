# Template: Vue Component

Use este padrão para criar componentes reativos no Vue 3.

## Instruções de Uso
- Sempre use `<script setup>` com TypeScript.
- Utilize `<style scoped>` para evitar conflitos de estilo.
- Componentes devem ser pequenos e reutilizáveis.

## Esqueleto do Código
```vue
<template>
  <div class="component-container">
    <!-- Estrutura do componente -->
    <slot name="header"></slot>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';

// Definição de Props
defineProps<{
  title: string;
}>();

// Estado Reativo
const isLoading = ref(true);

onMounted(() => {
  isLoading.value = false;
});
</script>

<style scoped>
.component-container {
  padding: 1rem;
}
</style>
```

## Checklist de Qualidade
- [ ] O componente tem um propósito único?
- [ ] As props estão tipadas com TypeScript?
- [ ] Foi validado no Storybook (se aplicável)?
