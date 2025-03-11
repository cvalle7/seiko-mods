<template>
    <div class="watch-container">
        <div class="watch-bar">
            <ul class="list">
                <li class="list-element" v-for="family in watchFamily" :key="family.id"
                    :class="{ 'selected': (family.name == familySelected.name) }" @click="selectFamily(family)">
                    {{ family.name }}
                </li>
            </ul>
        </div>

        <div class="div-aux" v-if="familySelected.name === 'Todos'">
            <WatchContainerComponent v-for="family in watchFamily" :key="family.id" :family-watch="family">
            </WatchContainerComponent>

        </div>

        <div class="div-aux" v-else>
            <WatchContainerComponent :family-watch="familySelected">
            </WatchContainerComponent>
        </div>

    </div>
</template>

<script setup>

import { onMounted, ref } from "vue"
import clockTypeService from '@/services/clockTypes.service'
import WatchContainerComponent from "@/components/WatchContainerComponent.vue"
import useFamilyStore from "@/stores/family.store"

const watchFamily = ref([])
const familySelected = ref('')
const familyStore = useFamilyStore()

const selectFamily = (family) => {
    familySelected.value = family
}

onMounted(async () => {
    const getWatchFamily = async () => {
        watchFamily.value = await clockTypeService.getClockTypes();
        watchFamily.value.unshift({ name: 'Todos' });
        familySelected.value = watchFamily.value[0];
    }

    const checkFamilySelecte = () => {
        if (familyStore.family) {
            const array = watchFamily.value
            const find = array.find(w => w.name === familyStore.family);
            familySelected.value = find;
        }
    }

    await getWatchFamily()
    checkFamilySelecte()
})
</script>

<style scoped>
.watch-container {
    position: fixed;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.watch-bar {
    margin: 1% 0;
    width: 80%;
    display: flex;
    align-items: center;
    justify-content: center;
    white-space: nowrap;
    border-bottom: 0.1rem solid grey;
}

.list {
    display: flex;
    flex-direction: row;
    gap: 3rem;
    color: black;
    font-size: 1.2rem;
    border: 0;
    list-style: none;
}

.list-element {
    cursor: pointer;
    transition: color 0.5s ease;
}

.list-element:hover {
    color: #135A3A;
}

.selected {
    list-style: disc;
    color: #135A3A;
}

.div-aux {
    width: 100%;
    height: 80%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    overflow-y: auto;
    scrollbar-width: none;
    padding-bottom: 4%;
}

@media (max-width: 768px) {
    .watch-bar {
        margin-top: 2%;
        width: 100%;
    }


    .list {
        font-size: 1rem;
        font-weight: 600;
        display: inline-flex;
        gap: 1.5rem;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
    }
}
</style>