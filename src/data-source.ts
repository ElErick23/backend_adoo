import "reflect-metadata"
import { DataSource } from "typeorm"
import { Solicitud } from "./entity/Solicitud"
import { Victima } from "./entity/Victima"

export const AppDataSource = new DataSource({
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "n0m3l0",
    database: "fud",
    synchronize: false,
    logging: false,
    entities: [Solicitud, Victima],
    migrations: [],
    subscribers: [],
})
