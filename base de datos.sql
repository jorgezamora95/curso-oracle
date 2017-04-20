create table alumno(id integer, nombre varchar2(25), apellido varchar2(25), constraint pk_id PRIMARY KEY(id));

create sequence sec_alumno
start with 1
increment by 1
nomaxvalue;

create or replace procedure guardar_alumno(my_id out integer,my_nombre in varchar2,my_apellido in varchar2)
as
begin
select sec_alumno.nextval into my_id from dual;
end;
/
