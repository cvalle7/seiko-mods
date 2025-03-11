<template>
    <nav class="nav-container" :class="{ 'little': !isHidden }">
        <div class="logo">
            <h2 @click="navigate('/')">Seiko Mods</h2>
            <button class="hamburguer" @click="isHide">
                <i class="fas fa-bars"></i>
            </button>
        </div>
        <ul class="list" :class="{ 'hide': isHidden }">
            <li @click="navigate('/watches')">Relojes</li>
            <li @click="navigate('/fav')">Favoritos</li>
            <li @click="navigate('/shop')"> <i class="fas fa-shopping-cart"></i> </li>
        </ul>
    </nav>
</template>

<script setup>
import { ref } from 'vue'
import '@fortawesome/fontawesome-free/css/all.css';
import { useRouter } from 'vue-router'

const route = useRouter();
const isHidden = ref(true)

const isHide = () => {
    isHidden.value = !isHidden.value
}

const navigate = (toRoute) => {
    isHidden.value = true;
    switch (toRoute) {
        case '/':
            if (route.currentRoute.value.path == '/') {
                window.location.reload();
            } else {
                route.push(toRoute);
            }
            break;
        default:
            route.push(toRoute);
            break;
    }
}
</script>

<style scoped>
.nav-container {
    position: fixed;
    top: 0;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    font-size: larger;
    width: 100%;
    height: 12vh;
    transition: height 0.5s ease;
    background-color: #135A3A;
    color: white;
    gap: 40%;
    z-index: 1000;
}

.hamburguer {
    display: none;
}

.list {
    list-style: none;
    display: flex;
    opacity: 1;
    transition: opacity 0.5s ease;
    gap: 2rem;
    padding: 0;
    margin: 0;
}

.list li {
    cursor: pointer;
}

.hide {
    opacity: 1;
}

.logo h2 {
    cursor: pointer;
}

@media (max-width: 768px) {
    .nav-container {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        gap: 10%;
    }

    .logo {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        width: 70%;
    }

    .list {
        display: flex;
        flex-direction: row;
        padding: 0;
        margin: 0;
    }

    .list li {
        margin: 1rem 0;
    }

    .nav-container h2 {
        font-size: 1.5rem;
    }

    .hamburguer {
        display: block;
        border: none;
        background-color: transparent;
        color: white;
        font-size: 1.5rem;
        cursor: pointer;
    }

    .hide {
        opacity: 0;
    }

    .little {
        height: 20vh;
    }

    .list li {
        cursor: pointer;
    }

    .logo h2 {
        cursor: pointer;
    }
}
</style>