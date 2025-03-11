import FavView from "@/views/FavView.vue";
import HomeView from "@/views/HomeView.vue";
import ShopView from "@/views/ShopView.vue";
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
    }, 
    {
        path: '/fav',
        name: 'Fav',
        component: FavView
    },
    {
        path: '/shop',
        name: 'Shop',
        component: ShopView
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;