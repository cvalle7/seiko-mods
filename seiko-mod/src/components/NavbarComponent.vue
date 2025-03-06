<template>
    <nav class="nav-container">
        <h2>Seiko Mods</h2>
        <ul class="list">
            <li>Relojes</li>
            <li>Configuración</li>
            <li> <i class="fas fa-shopping-cart"></i> </li>
        </ul>
    </nav>
</template>

<script setup>
import '@fortawesome/fontawesome-free/css/all.css';

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
    background-color: #135A3A;
    color: white;
    gap: 40%;
    z-index: 1000;
}

.list {
    list-style: none;
    display: flex;
    gap: 2rem;
    padding: 0;
    margin: 0;
}
</style>