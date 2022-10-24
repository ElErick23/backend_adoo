import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from "typeorm"
import { Victima } from "./Victima"

@Entity("Solicitudes")
export class Solicitud {

    @PrimaryGeneratedColumn('uuid')
    id: string

    @ManyToOne(() => Victima, (victima) => victima.solicitudes)
    victima: Victima

    @Column()
    fecha: Date

    @Column()
    lugar: string

}
