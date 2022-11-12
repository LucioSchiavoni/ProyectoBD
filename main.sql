create database colegioBD;
use colegioBD;

create table grupo(
id int not null auto_increment,
anos int ,
nombre varchar(55) not null,
grados varchar(8) not null,
constraint clp_grupo primary key (id));

create table materias(
    codigo_materias varchar (30) not null,
    nombre varchar(55) not null,
    constraint clp_materias primary key (codigo_materias)
);

create table tiene(
    inicio varchar(20) not null,
    fin varchar(20) not null,
    codigo_materias varchar(30) not null,
    id_grupo int(30) not null,
    constraint clp_tiene primary key(inicio, codigo_materias,id_grupo)
);

create table ensenia(
    asistio char(2) not null,
razon_inasistencia varchar(500),
codigo_materias varchar(30) not null,
id_grupo int not null,
ci_docente varchar(11) not null,
inicio varchar(20) not null,
constraint clp_ensenia primary key(ci_docente, inicio, id_grupo, codigo_materias)
);

create table docentes(
ci_docente varchar(11) not null,
nombre varchar(55) not null,
constraint clp_docentes primary key(ci_docente)
);

create table registra(
    codigo_materias varchar(30) not null,
    id_grupo int not null,
    inicio varchar(20) not null,
    ci_docente varchar(11) not null,
    fecha varchar(50) not null,
    ci_persona varchar(11) not null,
    constraint clp_registra primary key(ci_persona, codigo_materias, id_grupo, inicio, ci_docente) 
);

create table persona(
    ci_persona varchar(11) not null,
    nombre varchar(55) not null,
    rol varchar(30) not null,
    contrasenia varchar(200) not null,
    constraint clp_persona primary key (ci_persona)
);

/*Claves externas*/

    alter table registra
    add (constraint clp_registra_personas foreign key (ci_persona)
    references persona(ci_persona) on delete cascade);

    alter table registra 
    add( constraint clp_registra_materias foreign key (codigo_materias)
    references materias(codigo_materias) on delete cascade);

    alter table registra
    add (constraint clp_registra_grupo foreign key (id_grupo)
    references grupo(id) on delete cascade);

    alter table registra
    add(constraint clp_registra_inicio foreign key (inicio)
    references tiene(inicio) on delete cascade);

    alter table registra
    add(constraint clp_registra_docente foreign key (ci_docente)
    references docentes(ci_docente) on delete cascade);

    alter table registra 
    add(constraint clp_ensenia_docente foreign key (ci_docente)
    references docentes(ci_docente) on delete cascade);

    alter table ensenia
    add(constraint clp_ensenia_inicio foreign key (inicio)
    references tiene(inicio) on delete cascade);

    alter table ensenia
    add(constraint clp_ensenia_grupo foreign key (id_grupo)
    references grupo (id) on delete cascade);

    alter table ensenia
    add(constraint clp_ensenia_materias foreign key (codigo_materias)
    references materias (codigo_materias) on delete cascade);

   alter table tiene
   add(constraint clp_tiene_grupo foreign key (id_grupo)
   references grupo (id) on delete cascade );

   alter table tiene
   add(constraint clp_tiene_materias foreign key (codigo_materias)
   references materias (codigo_materias) on delete cascade);

/*Values*/

   insert into docentes
   values (
    "4.873.133-9","Luis Suarez"
    );
    insert into docentes 
   values (
  "4.285.133-2", "Diego Lugano"
    );
    insert into docentes  
   values (
  "4.421.133-5",  "Diego Godin"
    );
    insert into docentes 
   values (
   "4.478.133-7", "Diego Forlan"
    );
    insert into docentes  
   values (
  "4.793.133-1" , "Edinson Cavani"
    );
       insert into materias
   values (
    "Economia", "05"
    );
      insert into materias
   values (
    "Sociales", "04"
    );
       insert into materias
   values (
   "Quimica" , "03"
    );
       insert into materias
   values (
    "Matematica", "02"
    );
       insert into materias
   values (
    "Fisica", "01"
    );
insert into grupo
   values (
    "01", "2022", "A","1ero"
    );
    insert into grupo
   values (
   "02", "2022", "B", "1ero"
    );
insert into grupo
   values (
   "03", "2022", "A", "2do"
    );
    insert into grupo
   values (
    "04", "2022", "B","2do"
    );
    
       insert into grupo
   values (
   "05", "2022", "A", "3ero"
    );

   insert into persona
   values (
   "4.478.133-7", "Jose Luis", "Adscriptos", "dgdhfdh"
    );
     insert into persona
   values (
   "4.478.556-7", "Manolo Lamas", "Director", "dgsdgdgd"
    );
     insert into persona
   values (
   "1.345.556-7", "Sancho Lamas", "Administrador", "dsdgsdg"
    );
      insert into persona
   values (
   "3.345.556-7", "Pedro Lopez", "Administrador", "dgsgdsgsdgds"
    );

insert into ensenia
   values (
   "No", "Cumpleanios", "01", 02, "4.478.133-7", "22/10/2022"
    );
    insert into ensenia
   values (
   "No", "Enfermo", "01", 03, "4.478.567-7", "10/7/2022"
    );
      insert into ensenia
   values (
   "No", "Enfermo", "01", 04, "4.456.332-1", "4/6/2022"
    );
      insert into ensenia
   values (
   "No", "Evento", "01", 01, "4.456.332-1", "8/4/2022"
    );


insert into tiene
   values (
   "2022","2022","04", 04
    );
    
    insert into tiene
   values (
   "2021","2021","01", 01
    );
insert into tiene
   values (
   "2022","2022","02", 02
    );
insert into tiene
   values (
   "2022","2022","03", 03
    );