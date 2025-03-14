import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Purchase_watch } from "./purchase_watch.entity";

@Entity('purchase')
export class Purchase{

    @PrimaryGeneratedColumn()
    id:number

    @Column({nullable: false})
    mail: string

    @Column({nullable: false})
    total: number

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date

    @OneToMany(() => Purchase_watch, (pw) => pw.purchase)
    purchase_watches: Purchase_watch[]
}