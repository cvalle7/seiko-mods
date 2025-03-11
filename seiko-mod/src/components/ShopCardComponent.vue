<template>
    <div class="shop-card-main-container">
        <div class="shop-container">
            <img :src="watchItem.background_image" />
            <div class="text-box">
                <p>{{ watchItem.name }}</p>
                <p>{{ watchItem.price }} €</p>
            </div>
            <div class="moreless">
                <button class="more" @click="moreA">+</button>
                <button class="less" @click="lessA">-</button>
            </div>
            <p class="amount">{{ getAmount }}</p>
            <p class="erase" @click="eraseFrom"><i class="fas fa-trash"></i></p>
        </div>
    </div>
</template>

<script setup>
import useShopStore from '@/stores/shop.store';
import { defineProps, computed } from 'vue';

const shopStore = useShopStore()

const props = defineProps({
    watchItem: {
        type: Object,
        required: true,
    }
})

const moreA = () => {
    shopStore.addAmount(props.watchItem.id);
}

const lessA = () => {
    shopStore.removeAmount(props.watchItem.id);
}

const eraseFrom = () => {
    shopStore.removeToShop(props.watchItem.id);
}

const getAmount = computed(() => { return shopStore.shopList.find(s => s.id === props.watchItem.id)?.amount || 0; })

</script>

<style scoped>
.shop-card-main-container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    width: 100%;
}

.shop-container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    width: 100%;
}

.shop-container img {
    width: 8vh;
    object-fit: contain;
}

.text-box {
    display: flex;
    width: 20vh;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    margin-left: 10%;
}

.moreless {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}

.amount {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 10vh;
}

.moreless {
    gap: 4%
}

.moreless button {
    border: none;
    background-color: rgb(170, 169, 169);
    font-size: 1.2rem;
    text-align: center;
    width: 3vh;
    transition: background-color 0.5s ease;
}

.moreless button:hover {
    cursor: pointer;
    background-color: grey;
}

.more {
    border-top-left-radius: 15px;
    border-bottom-left-radius: 15px;
}

.less {
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
}

.erase{
    color: rgb(252, 52, 52);
    font-size: 1.2rem;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: color 0.3s ease;
}

.erase:hover{
    cursor: pointer;
    color: rgb(180, 0, 0);
}
</style>