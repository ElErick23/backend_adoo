import { AppDataSource } from "./data-source"
import { Solicitud } from "./entity/Solicitud"
import { Victima } from "./entity/Victima"

AppDataSource.initialize().then(async () => {
    const victimJSON = JSON.parse('{"tipo": "Directa", "nombre": "Moya", "primerApellido": "Moyez", "segundoApellido": "Moyensio"}')

    const victima = Object.assign(new Victima, victimJSON)

    const solicitud = new Solicitud()
    solicitud.fecha = new Date('2022/10/20')
    solicitud.lugar = 'Mejico'
    solicitud.victima = victima

    await AppDataSource.manager.save(victima)
    await AppDataSource.manager.save(solicitud)
    console.log("Saved a new victima with id: " + victima.id)
    console.log("Saved a new solicitud with id: " + solicitud.id)

    // console.log("Loading users from the database...")
    // const users = await AppDataSource.manager.find(Solicitud)
    // console.log("Loaded users: ", users)

    // console.log("Here you can setup and run express / fastify / any other framework.")

}).catch(error => console.log(error))
