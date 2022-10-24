import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm"
import { Solicitud } from "./Solicitud"

@Entity("Victimas")
export class Victima {
    
  @PrimaryGeneratedColumn("uuid")
  id: string

  @Column()
  tipo: string

  @Column()
  nombre: string
  
  @Column()
  primerApellido: string
  
  @Column()
  segundoApellido: string
  
  @Column()
  fechaNac: Date
  
  @Column()
  sexo: string
  
  @Column()
  lugarNac: string
  
  @Column()
  estadoCivil: string

  @Column()
  calle: string

  @Column()
  numExt: string
  
  @Column()
  numInt: string

  @Column()
  cp: string
  
  @Column()
  colonia: string

  @Column()
  localidad: string

  @Column()
  delegMuni: string

  @Column()
  entidad: string

  @Column()
  telefono: string

  @Column()
  tipoIdentificacion: string

  @Column()
  numDoc: string

  @OneToMany(() => Solicitud, (solicitud) => solicitud.victima)
  solicitudes: Solicitud[]
}
