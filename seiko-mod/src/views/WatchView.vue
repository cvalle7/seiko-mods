<template>
    <div class="watch-container">
       <div class="watch-bar">
        <ul class="list">
            <li class="list-element" v-for="family in watchFamily" :key="family.id" :class="{'selected': (family.name == familySelected.name)}" @click="selectFamily(family)">
                {{ family.name }}
            </li>
        </ul>
       </div>
    </div>
</template>

<script setup>

import {onMounted, ref} from "vue"
import clockTypeService from '@/services/clockTypes.service'

const watchFamily = ref([])
const familySelected = ref('')

const selectFamily = (family) => {
    familySelected.value = family
}

onMounted(() => {
    const getWatchFamily = async () => {
        watchFamily.value = await clockTypeService.getClockTypes()
    }

    getWatchFamily()
})
</script>

<style scoped>
.watch-container {
    position: fixed;
    width: 100%;
    height: auto;
    display: flex;
    align-items: center;
    justify-content: center;
}

.watch-bar{
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.list{
    display: flex;
    flex-direction: row;
    gap: 3rem;
    color: black;
    font-size: 1.2rem;
    border: 0;
    list-style: none;
}

.list-element{
    cursor: pointer;
    transition: color 0.5s ease;
}

.list-element:hover{
    color: #135A3A;
}

.selected{
    list-style: disc;
    color: #135A3A;
}
</style>