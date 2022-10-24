create table `derechos humanos`
(
    ID                      int         not null,
    Competencia             varchar(45) null,
    Organismo               varchar(45) null,
    `Violacion a DD`        varchar(45) null,
    `Autoridad responsable` varchar(45) null,
    `Tipo de resolucion`    varchar(45) null,
    Folio                   varchar(45) null,
    `Estado Actual`         varchar(45) null,
    `Otra autoridad`        varchar(45) null
);

create table identificacion
(
    Identif         binary(1)   not null,
    Tipo            varchar(45) null,
    `numero de doc` varchar(45) null
);

create table `investigacion ministerial`
(
    ID                           int         not null,
    Denuncia                     binary(2)   null,
    Fecha                        datetime    null,
    Competencia                  varchar(45) null,
    Entidad                      varchar(45) null,
    Delito                       varchar(45) null,
    AgenciaMP                    varchar(45) null,
    APCIAC                       varchar(45) null,
    `Estado de la investigacion` varchar(45) null,
    Autoridadescol               varchar(45) null
);

create table `proceso judicial`
(
    ID                  int         not null,
    Fecha               varchar(45) null,
    Competencia         varchar(45) null,
    Entidad             varchar(45) null,
    Delito              varchar(45) null,
    `Numero de Juzgado` varchar(45) null,
    `Numero de proceso` varchar(45) null,
    `Estado de proceso` varchar(45) null
);

create table `servidor publico`
(
    ID                     int         not null,
    `Tipo de solicitante`  varchar(45) null,
    `Tipo de daño sufrido` varchar(45) null
);

create table victimas
(
    Id                 varchar(36) not null
        primary key,
    Tipo               varchar(45) null,
    Nombre             varchar(45) null,
    PrimerApellido     varchar(45) null,
    SegundoApellido    varchar(45) null,
    FechaNac           date        null,
    Sexo               varchar(45) null,
    LugarNac           varchar(45) null,
    EstadoCivil        varchar(45) null,
    Calle              varchar(45) null,
    NumExt             varchar(45) null,
    NumInt             varchar(45) null,
    CP                 varchar(45) null,
    Colonia            varchar(45) null,
    Localidad          varchar(45) null,
    DelegMuni          varchar(45) null,
    Entidad            varchar(45) null,
    Telefono           varchar(45) null,
    TipoIdentificacion varchar(45) null,
    NumDoc             varchar(45) null
);

create table caracteristicasvictimas
(
    `Tipo de victima`            varchar(45) null,
    Edad                         varchar(45) null,
    Nomtutor                     varchar(45) null,
    `Situcion de calle`          varchar(45) null,
    Discapacidad                 varchar(45) null,
    `Tipo de discapacidad`       varchar(45) null,
    `Grado de dependencia`       varchar(45) null,
    Migrante                     varchar(45) null,
    `Pais de origen`             varchar(45) null,
    `Pais destino`               varchar(45) null,
    Traductor                    varchar(45) null,
    Idioma                       varchar(45) null,
    Indigena                     varchar(45) null,
    `Caracteristicas victimacol` varchar(45) null,
    IdVictima                    varchar(36) not null
        primary key,
    constraint caracteristicasvictimas_victimas_null_fk
        foreign key (IdVictima) references victimas (Id)
);

create table solicitudes
(
    Id        varchar(36) not null
        primary key,
    Fecha     date        null,
    Lugar     varchar(45) null,
    VictimaId varchar(36) null,
    constraint solicitudes_victimas_null_fk
        foreign key (VictimaId) references victimas (Id)
);

create table hechos
(
    Calle                varchar(45)                 null,
    `Codigo postal`      varchar(45)                 null,
    Localidad            varchar(45)                 null,
    `Entidad federativa` varchar(45)                 null,
    `Numero exterior`    varchar(45)                 null,
    `Numero interior`    varchar(45)                 null,
    Colonia              varchar(45)                 null,
    DelegaMuni           varchar(45)                 null,
    Fecha                varchar(45)                 null,
    `Datos extra`        varchar(45)                 null,
    Relato               varchar(45)                 null,
    IdSolicitud          varchar(36)                 not null,
    IdHechos             varchar(36) charset utf8mb3 not null
        primary key,
    constraint hechos_solicitudes_null_fk
        foreign key (IdSolicitud) references solicitudes (Id)
);

create table solicitantes
(
    Id                          varchar(36) not null
        primary key,
    Tipo                        varchar(45) not null,
    Nombre                      varchar(45) null,
    `Primer Apellido`           varchar(45) null,
    `Segundo Apellido`          varchar(45) null,
    Parentesco                  varchar(45) null,
    Cargo                       varchar(45) null,
    `Dependencia o institucion` varchar(45) null,
    `Telefono movil`            varchar(45) null,
    `Telefono fijo`             varchar(45) null,
    `Correo electronico`        varchar(45) null,
    `Otros datos de contacto`   varchar(45) null,
    IdSolicitud                 varchar(36) null,
    constraint solicitantes_solicitudes_null_fk
        foreign key (IdSolicitud) references solicitudes (Id)
);

create table relacionesvictimasolicitante
(
    Relacion      varchar(100) null,
    Id            varchar(36)  not null
        primary key,
    IdSolicitante varchar(36)  null,
    IdVictima     varchar(36)  not null,
    constraint relacionesvictimasolicitante_solicitantes_null_fk
        foreign key (IdSolicitante) references solicitantes (Id),
    constraint relacionesvictimasolicitante_victimas_null_fk
        foreign key (IdVictima) references victimas (Id)
);


