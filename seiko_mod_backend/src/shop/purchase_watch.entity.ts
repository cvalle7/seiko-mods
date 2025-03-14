import { Watch } from "src/watch/watch.entity";
import { Column, Entity, JoinColumn, ManyToOne, PrimaryColumn } from "typeorm";
import { Purchase } from "./purchase.entity";

@Entity('purchase_watch')
export class Purchase_watch{

    @PrimaryColumn()
    purchase_id: number

    @PrimaryColumn()
    watch_id: number

    @ManyToOne(() => Purchase, (purchase) => purchase.purchase_watches)
    @JoinColumn({name: 'purchase_id'})
    purchase: Purchase

    @ManyToOne(() => Watch, (watch) => watch.purchase_watch)
    @JoinColumn({name: 'watch_id'})
    watch: Watch

    @Column({nullable: false})
    amount: number
}