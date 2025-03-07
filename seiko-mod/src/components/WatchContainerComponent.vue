<template>
    <div v-if="familyWatch.name != 'Todos'" class="main-container">
        <h2>{{ familyWatch.name }}</h2>
        <div class="watch-container">
            r1
        </div>
    </div>
</template>

<script setup>

import { defineProps } from 'vue';

defineProps({
    familyWatch: {
        type: Object
    }
})
</script>

<style scoped>
.main-container {
    width: 80%;
    margin: 2% 0;
}

.main-container h2{
    text-align: start;
    margin-bottom: 2%;
}

.watch-container{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: row;
}
</style>