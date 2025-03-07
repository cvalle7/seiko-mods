import { ClockType } from "src/clock_type/clock_type.entity";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

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

    @ManyToOne(() => ClockType, (ct) => ct.id, {onDelete: 'CASCADE'})
    type: ClockType

}