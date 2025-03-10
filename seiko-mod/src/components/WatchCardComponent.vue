<template>
    <div class="main-container">
        <p class="title">{{ watch.name }}</p>
        <img :src="watch.background_image">
        <div class="actions-container">
            <p class="fav" :class="{ 'fav-selected': favSelected }" @click="toggleFav"><i class="fas fa-heart"></i></p>
            <p class="price">{{ watch.price }}€</p>
            <p class="buy" :class="{ 'buy-selected': buySelected }" @click="toggleBuy"><i class="fas fa-shopping-cart"></i></p>
        </div>
    </div>
</template>

<script setup>

import { defineProps, ref } from 'vue';

const favSelected = ref(false);
const buySelected = ref(false);

const toggleFav = () => {
    favSelected.value = !favSelected.value;
};

const toggleBuy = () => {
    buySelected.value = !buySelected.value;
};

defineProps({
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