import { Watch } from "src/watch/watch.entity";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('clock_type')
export class ClockType {

    @PrimaryGeneratedColumn()
    id: number

    @Column({ nullable: false })
    name: string

    @Column({ nullable: false })
    tittle: string

    @Column({ nullable: false })
    description: string

    @Column({ nullable: false })
    background_image: string

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    updated_at: Date

    @OneToMany(() => Watch, (watch) => watch.type)
    watchs: Watch[]

}