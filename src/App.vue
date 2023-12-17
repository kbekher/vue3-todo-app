<script setup>
import HelloWorld from './components/HelloWorld.vue'
import TheWelcome from './components/TheWelcome.vue'
</script>

<template>
<template>
  <div class="todoapp">
    <h1 class="todoapp__title">todos</h1>

    <div class="todoapp__content">
      <header class="todoapp__header">
        <button
          class="todoapp__toggle-all"
          :class="{ active: activeTodos.length === 0 }"
        ></button>

        <form @submit.prevent="handleSubmit">
          <input
            type="text"
            class="todoapp__new-todo"
            placeholder="What needs to be done?"
            v-model="title"
          />
        </form>
      </header>

      <TransitionGroup
        name="list"
        tag="section"
        class="todoapp__main"
      >
        <TodoItem
          v-for="todo, index of visibleTodos"
          :key="todo.id"
          :todo="todo"
          @update="updateTodo"
          @delete="deleteTodo(todo.id)"
        />
      </TransitionGroup>

      <footer class="todoapp__footer">
        <span class="todoapp__active-count">
          {{ activeTodos.length }} items left
        </span>

        <StatusFilter v-model="status" />

        <button
          v-if="activeTodos.length > 0"
          class="todoapp__clear-completed"
        >
          Clear completed
        </button>
      </footer>
    </div>

    <Message
      class="is-warning"
      ref="errorMessage"
    >
      <template #default="{ text }">
        <p>{{ text }}</p>
        <button @click="$refs.errorMessage.hide()">x</button>
      </template>

      <template #header>
        <p>Server Error</p>
      </template>
    </Message>
  </div>
</template>
</template>