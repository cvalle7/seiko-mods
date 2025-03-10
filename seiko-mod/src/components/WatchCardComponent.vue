<template>
    <div class="main-container">
    </div>
</template>

<script setup>

import { defineProps } from 'vue';

defineProps({
    watch: {
        type: Object
    }
})
</script>

<style scoped>
.main-container{
    display: flex;
    width: 100%;
    height: 50vh;
}
</style>