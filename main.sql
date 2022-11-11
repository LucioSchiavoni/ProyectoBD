create database `colegioBD`;
use `colegioBD`;

create table `grupo`(
id int not null auto_increment,
anos int ,
nombre varchar(55) not null,
grados varchar(8) not null,
constraint clp_grupo primary key (id));

create table `materias`(
    codigo int (30) not null,
    nombre varchar(55) not null,
    constraint clp_materias primary key (id)
);

create table `tiene`(
    inicio varchar(20) not null,
    fin varchar(20) not null,
    codigo_materias varchar(30) not null,
    id_grupo varchar(30) not null,
    constraint clp_tiene primary key(inicio, codigo_materias,id_grupo)
);

create table `ensenia`(
    asistio char(2) not null,
razon_inasistencia varchar(500),
codigo_materias varchar(30) not null,
id_grupo varchar(30) not null,
ci_docente varchar(11) not null,
inicio varchar(20) not null,
constraint clp_ensenia primary key(ci_docente, inicio, id_grupo, codigo_materias)
);

create table `docentes`(
ci_docente varchar(11) not null,
nombre varchar(55) not null,
constraint clp_docentes primary key(ci_docente)
);

create table `registra`(
    codigo_materias varchar(30) not null,
    id_grupo varchar(30) not null,
    inicio varchar(20) not null,
    ci_docente varchar(11) not null,
    fecha varchar(50) not null,
    ci_persona varchar(11) not null,
    constraint clp_registra primary key(ci_persona, codigo_materias, id_grupo, inicio, ci_docente) 
);

create table `persona`(
    ci_persona varchar(11) not null,
    nombre varchar(55) not null,
    rol varchar(30) not null,
    contrasenia varchar(200) not null,
    constraint clp_persona primary key (ci_persona)
);

/*Claves externas*/

    alter table `registra`
    add (constraint clp_registra_personas foreign key (ci_persona)
    references persona(ci_persona) on delete cascade);

    alter table `registra` 
    add( constraint clp_registra_materias foreign key (codigo_materias)
    references materias(codigo_materias) on delete cascade);

    alter table `registra`
    add (constraint clp_registra_grupo foreign key (id_grupo)
    references grupo(id_grupo) on delete cascade);

    alter table `registra`
    add(constraint clp_registra_inicio foreign key (inicio)
    references tiene(inicio) on delete cascade);

    alter table `registra`
    add(constraint clp_registra_docente foreign key (ci_docente)
    references docentes(ci_docente) on delete cascade);

    alter table `ensenia` 
    add(constraint clp_ensenia_docente foreign key (ci_docente)
    references docentes(ci_docente) on delete cascade);

    alter table `ensenia`
    add(constraint clp_ensenia_inicio foreign key (inicio)
    references tiene(inicio) on delete cascade);

    alter table `ensenia`
    add(constraint clp_ensenia_grupo foreign key (id_grupo)
    references grupo (id_grupo) on delete cascade);

    alter table `ensenia`
    add(constraint clp_ensenia_materias foreign key (codigo_materias)
    references materias (codigo_materias) on delete cascade);

   alter table `tiene`
   add(constraint clp_tiene_grupo foreign key (id_grupo)
   references grupo (id_grupo) on delete cascade );

   alter table `tiene`
   add(constraint clp_tiene_materias foreign key (codigo_materias)
   references materias (codigo_materias) on delete cascade);



   insert into `docentes` (nombre, ci_docente)  
   values (
    "Luis Suarez", "4.873.133-9"
    );