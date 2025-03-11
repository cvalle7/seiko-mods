<template>
    <div class="shop-main-container">
        <div class="element" v-for="w in watchList" :key="w.id">
            {{ w.name }}
        </div>
    </div>
</template>

<script setup>
import watchService from '@/services/watch.service';
import useShopStore from '@/stores/shop.store';
import { onMounted, ref } from 'vue';

const shopStore = useShopStore();
const watchList = ref([]);

onMounted(async () => {
    const getWatch = async () => {
        for (let w of shopStore.shopList) {
            watchList.value.push(await watchService.getWatch(w.id));
        }
    }
    await getWatch();
})

</script>

<style scoped></style>