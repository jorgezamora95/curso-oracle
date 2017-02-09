
create table pelicula(id_pelicula integer, titulo varchar2(80), sipnosis varchar2(80), constraint pk_pelicula primary key(id_pelicula));

CREATE SEQUENCE sec_peliculas
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


drop table pelicual;
CREATE TABLE sala (num_sala INTEGER, id_pelicula, constraint pknum_sala primary key(num_sala), CONSTRAINT fkid_pelicula FOREIGN KEY(id_pelicula) REFERENCES pelicula(id_pelicula));

create sequence sec_horario
start with 1
increment by 1
nomaxvalue;

create table horarios(id_horario integer, id_pelicula integer, fecha date, constraint pk_horario primary key(id_horario), constraint id_pelicula foreign key(id_pelicula) 
references pelicula(id_pelicula));

create or replace procedure guardar_pelicula(my_id_pelicula out integer, my_titulo in varchar2, my_sipnosis in varchar2)
as
begin
select sec_peliculas.nextval into my_id_pelicula from dual;
insert into pelicula values(my_id_pelicula, my_titulo, my_sipnosis);
end;
/

create or replace procedure guardar_sala (my_num_sala in integer, my_id_pelicula in integer)
as
begin
insert into sala values(my_num_sala, my_id_pelicula);
end;
/

create or replace procedure guardar_horarios(my_id_horarios out integer, my_id_pelicula in integer, my_fecha in date)
as
begin
select sec_horario.nextval into my_id_horarios from dual;
insert into horarios values(my_id_horarios, my_id_pelicula, my_fecha);
end;
/
