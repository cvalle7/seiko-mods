import { ClockType } from "src/clock_type/clock_type.entity";
import { Purchase_watch } from "src/shop/purchase_watch.entity";
import { Column, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('watch')
export class Watch {

    @PrimaryGeneratedColumn()
    id: number

    @Column({ nullable: false })
    name: string

    @Column({nullable: false})
    price: number

    @Column({ nullable: false })
    background_image: string

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    updated_at: Date

    @ManyToOne(() => ClockType, (ct) => ct.watches, {onDelete: 'CASCADE'})
    @JoinColumn({name: 'clock_type_id'})
    type: ClockType

    @OneToMany(() => Purchase_watch, (pw) => pw.watch)
    purchase_watch: Purchase_watch[]

}