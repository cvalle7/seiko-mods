<template>
    <div v-if="familyWatch.name != 'Todos'" class="main-container">
        <h2>{{ familyWatch.name }}</h2>
        <div class="watch-container">
            <div class="w-cont" v-for="w in familyWatch.watches" :key="w.id">
                <WatchCardComponent :watch="w"></WatchCardComponent>
            </div>
        </div>
    </div>
</template>

<script setup>

import { defineProps } from 'vue';
import WatchCardComponent from '@/components/WatchCardComponent.vue'

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

.main-container h2 {
    text-align: start;
    margin-bottom: 2%;
}

.watch-container {
    display: flex;
    width: 100%;
    justify-content: flex-start;
    align-items: center;
    flex-direction: row;
    flex-wrap: wrap;
    margin-bottom: 10%;
    gap: 2%
}

.w-cont {
    display: flex;
    width: 32%;
    background-color: #f6f5f3;
    transition: background-color 0.5s ease;
}

.w-cont:hover {
    background-color: #FCFCFB;
}
</style>