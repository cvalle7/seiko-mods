import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity('mail_config')
export class Mail_config {

    @PrimaryGeneratedColumn()
    id: number

    @Column({unique: true, nullable: false})
    name: string

    @Column({nullable: false})
    content: string

    @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
    created_at: Date
}