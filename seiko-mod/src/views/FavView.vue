<template>
    <div class="fav-main-container">
        <div class="info-container">
            <div class="title">
                <p>Tus</p>
                <h1>Favoritos</h1>
            </div>
            <div class="info-text">
                Explora el catálogo de nuestros Seiko Mods y añada sus favoritos a su lista de deseos.
            </div>
            <p class="link" @click="navWatch">
                Encuentra tu Seiko Mod >
            </p>
        </div>
        <div class="fav-watches-container">
            <div class="wc-tittle">
                Favoritos:
            </div>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const route = useRouter();

const navWatch = () => {
    route.push('/watches')
}
</script>

<style scoped>
.fav-main-container {
    width: 100%;
    height: 40vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.info-container {
    height: 100%;
    width: 30%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: flex-start;
}

.info-text {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    text-align: left;
}

.link {
    color: #176944;
    font-weight: 700;
    cursor: pointer;
}

.title {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin-top: 10%;
    color: black;
}

.title p {
    font-size: 2rem;
    margin: 0;
}

.title h1 {
    margin: 0;
    font-size: 6rem;
}

.fav-watches-container {
    display: flex;
    width: 80%;
}

.wc-tittle{
}
</style>