--cursores

DECLARE 
CURSOR CUR_1 IS SELECT * FROM TRABAJADOR;
CURSOR CUR_2 IS SELECT * FROM NOMINA;
BEGIN
FOR REC IN CUR_1 LOOP
FOR REC1 IN CUR_2 LOOP
IF REC.SEGURO=REC1.SEGURO THEN
dbms_output.put_LINE('NOMBRE ' || REC.NOMBRE ||' EDAD ' ||REC.EDAD || ' Sueldo base ' || rec1.sueldo_base);
END IF;
END LOOP;
END LOOP;
END;
/
SET SERVEROUTPUT ON;

--cursores con UPDATE !!!!!!!!!!!!
declare 
cursor cur_3 is select * from nomina for update;
begin
for rec in cur_3 loop
update nomina set horas_laboradas = 40 where current of cur_3;
end loop;
end;
/
