<template>
    <CardComponent>
        <div class="video-container">
            <div class="text-top">
                <div class="text-container">
                    <p> The colection</p>
                    <h3>Seiko Mods®</h3>
                </div>
            </div>
            <video autoplay loop muted playsinline class="backgournd-video">
                <source
                    src="https://media.rolex.com/video/upload/c_limit,w_2440/f_auto:video/q_auto:eco/v1/rolexcom/new-watches/2024/hub-watches/videos/cover/rolex-watches-collection-hub-cover-autoplay" />
                video not supported
            </video>
        </div>
    </CardComponent>
    <CardComponent>
        <div class="text-container-description">
            <div class="text-desc-left">
                <h2>Explore la colección Seiko Mods®</h2>
            </div>
            <div class="text-desc-right">
                <p>
                    La colección Seiko Mods® proporciona una amplia gama de prestigiosos relojes de alta precisión,
                    incluyendo relojes Profesionales y Clásicos, para adaptarse a cualquier muñeca.
                </p>
            </div>
        </div>
    </CardComponent>
    <CardComponent v-for="clock in clockTypes" :key="clock.id">
        <div class="img-container is-visible" :style="{ backgroundImage: `url('${clock.background_image}')` }">
            <div class="text-left">
                <h2>{{ clock.tittle }}</h2>
                <p>{{ clock.description }}</p>
            </div>
        </div>
    </CardComponent>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import CardComponent from '@/components/CardComponent.vue';
import clockTypeService from '@/services/clockTypes.service'

const clockTypes = ref([])

onMounted(() => {
    const getClockTypes = async () => {
        const response = await clockTypeService.getClockTypes()
        clockTypes.value = response
    }
    getClockTypes()
})

</script>

<style scoped>
.video-container {
    position: relative;
}

.video-container video {
    height: 75vh;
}

.text-top {
    position: absolute;
    top: 35%;
    width: 100%;
    z-index: 500;
    color: white;
}

.text-container {
    font-size: 3rem;
}

.img-container {
    width: 100%;
    height: 75vh;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    display: flex;
    align-items: flex-end;
    justify-content: flex-start;
}

.text-left {
    font-size: 2rem;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    padding-left: 3%;
    padding-bottom: 3%;
}

.is-visible {
    color: transparent;
    transition: color 1s ease-in-out;
}

.is-visible:hover {
    color: white;
}

.text-container-description {
    height: 20vh;
    display: flex;
    flex-direction: row;
    align-items: center;
    padding-bottom: 4%;
}

.text-desc-left {
    width: 60%;
    color: #157A4C;
    font-size: 1.8rem;
}

.text-desc-right {
    width: 30%;
    font-size: 1rem;
    text-align: left;
}

@media (max-width: 768px) {

    .text-container {
        font-size: 2rem;
    }

    .text-container-description {
        height: 30vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-bottom: 7%;
    }

    .text-desc-left {
        width: 100%;
        color: #157A4C;
        font-size: 0.7rem;
    }

    .text-desc-right {
        width: 80%;
        font-size: 1rem;
        text-align: left;
    }
}
</style>