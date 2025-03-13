<template>
    <div class="shop-main-container">
        <div class="shop-container" v-if="watchList.length !== 0">
            <div v-if="step === 0">
                <ShopCardComponent v-for="w in watchList" :key="w.id" :watchItem="w"></ShopCardComponent>
                <div class="total-amount">
                    <div class="price-box">
                        <p>Total: </p>
                        <p class="price">{{ getTotalAmount }}€</p>
                    </div>

                    <button class="continue" @click="step = 1">
                        Continue
                    </button>
                </div>
            </div>

            <form @submit.prevent="saveDirection" class="direction-form" v-if="step === 1">
                <label>Datos personales</label>
                <input type="text" placeholder="Nombre" v-model="nombre" required />
                <input type="text" placeholder="Apellidos" v-model="apellidos" required />
                <input type="text" placeholder="Teléfono" v-model="telefono" required />
                <input type="email" placeholder="Email" v-model="email" required />
                <input type="number" placeholder="Código postal" v-model="cp" required />
                <input type="text" placeholder="Ciudad" v-model="ciudad" required />
                <input type="text" placeholder="Localidad" v-model="localidad" required />
                <input type="text" placeholder="Dirección" v-model="direcion" required />
                <div class="back-to-cart">
                    <input class="back-cart" type="button" value="Volver" @click="step = 0">
                    <input class="continue" type="submit" value="Continuar">
                </div>
            </form>

            <div class="resume" v-if="step === 2">
                <p class="resume-tittle">Confirmación del pedido</p>
                <div class="resume-container">
                    <ShopCardComponent v-for="w in watchList" :key="w.id" :watchItem="w" :resume="true">
                    </ShopCardComponent>
                </div>

                <p class="resume-tittle">Dirección de entrega</p>
                <div class="resume-container">
                    <p>{{ nombre }} {{ apellidos }}, {{ telefono }}</p>
                    <p>{{ direcion }}</p>
                    <p>{{ ciudad }}, {{ localidad }}, {{ cp }}</p>
                </div>
                <p class="resume-tittle">Resumen</p>
                <div class="resume-container">
                    <p>Total: <b>{{ getTotalAmount }}€</b></p>
                </div>
                <div class="back-to-cart">
                    <button class="back-cart" @click="step = 1">Volver</button>
                    <PaypalButtonComponent :amount="getTotalAmount" @payment-success="sendMail"/>
                </div>
            </div>
        </div>

        <div class="shop-container-empty" v-else>
            <h1 v-if="comprado">Compra realizada correctamente!</h1>
            <h1>No hay elementos en el carro</h1>
            <p @click="navigate">Date una vuelta por la tienda! ></p>
        </div>
    </div>
</template>

<script setup>
import PaypalButtonComponent from '@/components/PaypalButtonComponent.vue';
import ShopCardComponent from '@/components/ShopCardComponent.vue';
import shopService from '@/services/shop.service';
import watchService from '@/services/watch.service';
import useFamilyStore from '@/stores/family.store';
import useShopStore from '@/stores/shop.store';
import { watch, ref, computed } from 'vue';
import { useRouter } from 'vue-router';

const shopStore = useShopStore();
const watchList = ref([]);
const router = useRouter()
const familyStore = useFamilyStore();
const step = ref(0)
const nombre = ref('');
const apellidos = ref('');
const telefono = ref('');
const email = ref('');
const cp = ref();
const ciudad = ref('');
const localidad = ref('');
const direcion = ref('');
const payObject = ref();
const comprado = ref(false);

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
    familyStore.removeFamily();
    router.push('/watches');
}

const saveDirection = () => {

    const payment = {
        watchs: shopStore.shopList,
        pay: getTotalAmount.value
    }

    const direcionData = {
        nombre: nombre.value,
        apellidos: apellidos.value,
        telefono: telefono.value,
        email: email.value,
        cp: cp.value,
        ciudad: ciudad.value,
        localidad: localidad.value,
        direcion: direcion.value,
    }
    payObject.value = {
        payment: payment,
        direcion: direcionData
    }

    step.value = 2
}

const loadWatchList = async () => {
    watchList.value = [];
    for (let w of shopStore.shopList) {
        const item = await watchService.getWatch(w.id);
        watchList.value.push(item);
    }
};

const sendMail = async () => {
    let mailContent = shopService.generateMailContent(watchList.value, payObject.value);
    await shopService.sendData(payObject.value, mailContent);
    step.value = 0
    shopStore.shopList = [];
    comprado.value = true;
}

watch(() => shopStore.shopList, loadWatchList, { immediate: true });

</script>

<style scoped>
.resume {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.resume-container {
    width: 70%;
    padding: 2%;
    background-color: white;
}

.resume-tittle {
    width: 73%;
    font-size: 1.5rem;
}

.hidden {
    display: none;
}

.direction-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.direction-form input {
    margin: 1%;
    width: 50%;
    height: 2.5vh;
    border: none;
    border-radius: 1rem;
    padding: 1%;
    font-size: 1rem;
}

.direction-form label {
    width: 70%;
    margin-bottom: 8%;
    font-size: 2rem;
}

.back-to-cart {
    width: 100%;
    margin-top: 10%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    gap: 15%;
}

.back-to-cart input {
    width: 30%;
    height: 4vh;
}

.back-to-cart button {
    width: 30%;
    height: 4vh;
    border: none;
    border-radius: 15px;
}

.back-cart {
    background-color: #3FC1D7;
    color: white;
    font-weight: 600;
    transition: background-color 0.4s ease;
    cursor: pointer;
}

.back-cart:hover {
    background-color: #298494;
}

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
    text-align: left;
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

.continue {
    border: none;
    background-color: #157a4d;
    border-radius: 15px;
    width: 12vh;
    height: 5vh;
    color: white;
    font-weight: 600;
    transition: background-color 0.4s ease;
}

.continue:hover {
    background-color: #135A3A;
    cursor: pointer;
}

@media(max-width: 992px) {
    .shop-container {
        margin-top: 25%;
        width: 90%;
    }

    .shop-container-empty {
        margin-top: 20%;
        width: 90%;
    }

    .direction-form input {
        margin: 1%;
        width: 80%;
        height: 4vh;
    }

    .direction-form label {
        width: 70%;
        margin: 8% 0;
        font-size: 1.5rem;
    }

    .back-to-cart {
        margin-bottom: 8%;
    }

    .back-to-cart input {
        width: 30%;
        height: 4vh;
    }
}
</style>