import { defineStore } from "pinia";

const useFamilyStore = defineStore("familyStore",{
    state: () => ({
        family: ''
    }),
    actions: {
        setFamily(family){
            this.family = family
        },
        removeFamily(){
            this.family = ''
        }
    },
    persist: true
})

export default useFamilyStore;