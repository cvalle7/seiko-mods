<template>
    <div class="fav-main-container">
        <div class="info-container">
            <div class="title">
                <p>Tus</p>
                <h1>Favoritos</h1>
            </div>
            <div class="info-text">
                Explora el catálogo de nuestros Seiko Mods y añade tus favoritos a su lista de deseos.
            </div>
            <p class="link" @click="navWatch">
                Encuentra tu Seiko Mod >
            </p>
        </div>
        <div class="wc-tittle">
            <h2>Relojes Favoritos</h2>
            <p>Tu selección de relojes</p>
        </div>
        <div class="fav-watches-container">
            <div class="w-container" v-for="watch in favWatches" :key="watch.id">
                <WatchCardComponent :watch="watch"></WatchCardComponent>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useRouter } from 'vue-router'
import watchService from '@/services/watch.service'
import useFavStore from "@/stores/fav.store.js"
import WatchCardComponent from '@/components/WatchCardComponent.vue'

const favWatches = ref([])
const favStore = useFavStore()
const route = useRouter()

const navWatch = () => {
    route.push('/watches')
}

const loadFavs = async () => {
    favWatches.value = []

    if (favStore.favs.length > 0) {
        for (let f of favStore.favs) {
            try {
                const w = await watchService.getWatch(f)
                favWatches.value.push(w)
            } catch (error) {
                console.error('Error al cargar el reloj favorito:', error)
            }
        }
    }
}

watch(() => favStore.favs, () => {
    loadFavs()
}, { immediate: true })

</script>

<style scoped>
.fav-main-container {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.info-container {
    height: 40vh;
    width: 35%;
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
    justify-content: flex-start;
    flex-wrap: wrap;
    gap: 5%;
    width: 80%;
}

.wc-tittle {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: flex-start;
    width: 82%;
    margin-bottom: 2%;
}

.wc-title h2 {
    margin: 0;
    padding: 0;
}

.wc-title p {
    margin: 0;
    padding: 0;
}

.w-container {
    width: 30%;
    background-color: #f6f5f3;
    transition: background-color 0.5s ease;
    margin-bottom: 5%;
}

@media(max-width: 768px) {

    .info-container {
        height: 40vh;
        width: 90%;
    }

    .info-text {
        font-size: 1.2rem;
    }

    .title {
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
        font-size: 3rem;
    }

    .fav-watches-container {
        margin-top: 5%;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
    }

    .w-container {
        width: 95%;
        margin-bottom: 10%;
    }

    .link {
        width: 100%;
    }

}
</style>