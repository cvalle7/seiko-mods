import HomeView from "@/views/HomeView.vue";
import WatchView from "@/views/WatchView.vue";
import { createRouter, createWebHistory } from "vue-router"

const routes = [
    {
        path: '/',
        name: 'Home',
        component: HomeView
    },
    {
        path: '/watches',
        name: 'Watches',
        component: WatchView
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;