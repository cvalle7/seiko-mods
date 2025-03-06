<template>
  <NavbarComponent/>
  <router-view></router-view>
</template>

<script>
import NavbarComponent from './components/NavbarComponent.vue';


export default {
  name: 'App',
  components:{
    NavbarComponent
  }
}
</script>

<style>

html, body{
  height: 100%;
  margin: 0;
  padding-top: 6vh;
  overflow: auto;
  scrollbar-width: none;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 0;
}
</style>
