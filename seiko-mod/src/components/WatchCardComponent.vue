<template>
    <div class="main-container">
        <p class="title">{{ watch.name }}</p>
        <img :src="watch.background_image">
        <div class="actions-container">
            <p class="fav" :class="{ 'fav-selected': isSelected }" @click="toggleFav"><i class="fas fa-heart"></i></p>
            <p class="price">{{ watch.price }}€</p>
            <p class="buy" :class="{ 'buy-selected': isShop }" @click="toggleBuy"><i class="fas fa-shopping-cart"></i>
            </p>
        </div>
    </div>
</template>

<script setup>

import { defineProps, computed } from 'vue';
import useFavStore from "@/stores/fav.store.js"
import useShopStore from '@/stores/shop.store';

const favStore = useFavStore();
const shopStore = useShopStore();

const isSelected = computed(() => favStore.favs.includes(props.watch.id));
const isShop = computed(() => shopStore.shopList.some(s => s.id === props.watch.id))

const toggleFav = () => {

    const find = favStore.favs.find(f => f === props.watch.id);
    if (!find) {
        favStore.setFavs(props.watch.id)

    } else {
        favStore.removeFav(props.watch.id)
    }
}

const toggleBuy = () => {
    if(shopStore.shopList.some(s => s.id === props.watch.id)){
        shopStore.removeToShop(props.watch.id);
    }else{
        shopStore.addToShop(props.watch.id);
    }
    console.log(shopStore.shopList)
};

const props = defineProps({
    watch: {
        type: Object
    }
})

</script>

<style scoped>
.main-container {
    width: 100%;
    height: 50vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.main-container img {
    height: 75%;
    object-fit: contain;
}

.actions-container {
    width: 80%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    font-size: 1.2rem;
}

.price {
    font-weight: 600;
    font-size: 1.2rem;
}

.title {
    font-weight: 600;
    font-size: 1.2rem;
}

.fav {
    cursor: pointer;
    transition: color 0.2s ease;
}

.buy {
    cursor: pointer;
    transition: color 0.2s ease;
}

.fav-selected {
    color: red
}

.buy-selected {
    color: rgb(47, 95, 250);
}
</style>