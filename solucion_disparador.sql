CREATE TABLE TRABAJADOR(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(20), SUELDO_BASE FLOAT);
CREATE TABLE RESPALDO(ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(20), SUELDO_BASE FLOAT);


CREATE OR REPLACE PROCEDURE CONTAR(NUMERO OUT INTEGER)
AS
BEGIN
SELECT COUNT(*) INTO NUMERO FROM TRABAJADOR;
DBMS_OUTPUT.PUT_LINE('ENCONTRADO ' ||NUMERO);
END;
/

DECLARE 
VALOR INTEGER;
BEGIN
CONTAR(VALOR);
END;
/

-- EL QUE COPIA
CREATE OR REPLACE PROCEDURE COPIAR 
AS
CURSOR CUR_TRABAJADOR IS SELECT * FROM TRABAJADOR;
BEGIN
FOR REC IN CUR_TRABAJADOR LOOP
INSERT INTO RESPALDO VALUES(REC.ID, REC.NOMBRE, REC.SUELDO_BASE);
END LOOP;
END;
/

CREATE OR REPLACE TRIGGER DISP_TRABAJADOR BEFORE INSERT ON TRABAJADOR FOR EACH ROW
DECLARE
VALOR INTEGER;
BEGIN
CONTAR(VALOR);
IF  VALOR = 3 THEN
COPIAR();
DELETE FROM TRABAJADOR;
END IF;
END;
/
------------------------------------------------------
INSERT INTO TRABAJADOR VALUES(7,'ROMAN',3600);
INSERT INTO TRABAJADOR VALUES(8,'ARELY',3800);
INSERT INTO TRABAJADOR VALUES(9,'KARLA',100);


SELECT * FROM TRABAJADOR;
SELECT * FROM RESPALDO;
