import { defineStore } from "pinia";

const useShopStore = defineStore("shopStore", {
    state: () => ({
        shopList: []
    }),
    actions: {
        addToShop(id) {
            const find = this.shopList.find(w => w.id === id);
            if (!find) {
                this.shopList.push({ id: id, amount: 1 });
            }
        },
        addAmount(id) {
            const find = this.shopList.find(w => w.id === id);
            if (find) {
                find.amount++;
            }
        },
        removeToShop(id) {
            const list = this.shopList.filter(w => w.id !== id);
            this.shopList = list;
        },
        removeAmount(id) {
            const find = this.shopList.find(w => w.id === id);
            if (find) {
                if (find.amount === 1) {
                    this.removeToShop(id);
                } else {
                    find.amount--;
                }
            }
        }
    },
    persist: true
})

export default useShopStore;