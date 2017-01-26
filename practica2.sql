set serveroutput on;


--RECAPITULANDO LO QUE ES UN BLOQUE PL SQL

DECLARE

nombre varchar2(20):='Jorge Zamora';
BEGIN
DBMS_OUTPUT.PUT_LINE('Buenas noches ' || nombre);
END;  
/

declare
edad integer:=21;
dias integer;
estatus varchar2(12);
begin
dias:=edad*365;
if dias >10000 then
  estatus:='Viejo';
  else 
  estatus:='Joven';
end if;
dbms_output.put_line('Tu edad en dias es ' || dias || ' estatus: ' || estatus);
end;
/

--veremos nuestro primer procedimiento almacenado
create or replace procedure saludar(mensaje IN varchar2)
as
begin
dbms_output.put_line('Hola buenas noches ' || mensaje);
end;
/

-- ejecutamos el procedimiento

exec saludar('Jorge zamora');


create sequence sec_persona
start with 1
increment by 1
nomaxvalue;

--generamos la tabla
create table persona (id_persona integer, nombre varchar2(20),edad integer, constraint pk_id_persona primary key (id_persona));
