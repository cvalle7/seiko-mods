import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createPinia } from 'pinia'
import persistedstate from 'pinia-plugin-persistedstate'

const pinia = createPinia();
pinia.use(persistedstate);

const app = createApp(App)
app.use(router);
app.use(pinia);
app.mount('#app')