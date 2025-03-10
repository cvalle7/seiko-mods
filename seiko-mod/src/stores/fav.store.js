import { defineStore } from "pinia";

const useFavStore = defineStore("favStore",{
    state: () => ({
        favs: []
    }),
    actions:{
        setFavs(fav){
            this.favs.push(fav)
        },
        removeFav(fav){
            this.favs = this.favs.filter(e => e !== fav);
        }
    },
    persist: true
})

export default useFavStore;