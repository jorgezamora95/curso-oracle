create table dance(id_dance integer, nombre varchar2(20), edad integer, constraint pk_id_dance primary key(id_dance));

insert into dance values(4,'Jose',70);
select * from dance;

declare 
estatus varchar2(20);
cursor cur1 is select * from dance;
begin 
for rec in cur1 loop
if rec.edad <18 then
estatus:='precoz';
dbms_output.put_line('nombre ' || rec.nombre || ' edad ' || rec.edad || ' estatus ' || estatus);
else 
estatus:='viejo';
dbms_output.put_line('nombre ' || rec.nombre || ' edad ' || rec.edad || ' estatus ' || estatus);
end if;
end loop;
end;
/
set serveroutput on;
-----------------------------------------------------------------------------------------------
create table trabajador(seguro integer, nombre varchar2(25), edad integer,constraint pk_seguro primary key(seguro));
create table nomina(id_nomina integer, seguro integer, sueldo_base float, horas_laboradas integer, fecha_pago date, constraint pk_id_nomina primary key(id_nomina), 
constraint fk_seguro foreign key(seguro) references trabajador(seguro));

insert into trabajador values(1,'Ana',28);
insert into trabajador values(2,'Pedro',40);
insert into trabajador values(3,'Juan',35);
insert into trabajador values(4,'Karla',41);

insert into nomina values(1,1,6000,40,'');
insert into nomina values(2,2,8000,30,'');
insert into nomina values(3,3,7000,42,'');
insert into nomina values(4,4,10000,48,'');
