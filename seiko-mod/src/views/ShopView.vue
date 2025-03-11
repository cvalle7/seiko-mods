<template>
    <div class="shop-main-container">
        <div class="shop-container" v-if="watchList.length !== 0">
            <ShopCardComponent v-for="w in watchList" :key="w.id" :watchItem="w"></ShopCardComponent>
            <div class="total-amount">
                <div class="price-box">
                    <p>Total: </p>
                    <p class="price">{{ getTotalAmount }}€</p>
                </div>

                <button class="continue">
                    Continue
                </button>
            </div>
        </div>

        <div class="shop-container-empty" v-else>
            <h1>No hay elementos en el carro</h1>
            <p @click="navigate">Date una vuelta por la tienda! ></p>
        </div>
    </div>
</template>

<script setup>
import ShopCardComponent from '@/components/ShopCardComponent.vue';
import watchService from '@/services/watch.service';
import useShopStore from '@/stores/shop.store';
import { watch, ref, computed } from 'vue';
import { useRouter } from 'vue-router';

const shopStore = useShopStore();
const watchList = ref([]);
const router = useRouter()


const getTotalAmount = computed(() => {
    let total = 0;
    watchList.value.forEach(w => {
        const find = shopStore.shopList.find(s => s.id === w.id);
        if (find) {
            total += (w.price * find.amount);
        }
    })
    return total;
})

const navigate = () => {
    router.push('/watches');
}

const loadWatchList = async () => {
    watchList.value = [];
    for (let w of shopStore.shopList) {
        const item = await watchService.getWatch(w.id);
        watchList.value.push(item);
    }
};

watch(() => shopStore.shopList, loadWatchList, { immediate: true });

</script>

<style scoped>
.shop-main-container {
    display: flex;
    align-items: center;
    justify-content: center;
    align-items: center;
    width: 100%;
}

.shop-container {
    margin-top: 5%;
    padding: 2%;
    border-radius: 25px;
    justify-content: center;
    width: 30%;
    background-color: #f6f5f3;
}

.shop-container-empty {
    margin-top: 5%;
    padding: 2%;
    border-radius: 25px;
    justify-content: center;
    width: 30%;
    background-color: #f6f5f3;
    text-align: left;
}

.shop-container-empty p {
    font-size: 1.1rem;
    font-weight: 600;
    color: #135A3A;
    cursor: pointer;
}

.total-amount {
    margin-top: 10%;
    border-top: 0.1rem solid grey;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    padding: 3% 5% 0 5%;
}

.price-box {
    display: flex;
    flex-direction: row;
    gap: 10%;
    font-size: 1.3rem;
}

.price {
    font-weight: 600;
}

.continue{
    border: none;
    background-color: #157a4d;
    border-radius: 15px;
    width: 12vh;
    height: 5vh;
    color: white;
    font-weight: 600;
    transition: background-color 0.4s ease;
}

.continue:hover{
    background-color: #135A3A;
    cursor: pointer;
}
</style>