begin work;
create table persona(
dni integer primary key,
apellido varchar(30),
nombre varchar(30),
fecnac date,
estadoCivil varchar(10),
constraint CH_Persona_EstadoCivil check (estadoCivil in
('SOLTERO','CASADO','VIUDO','DIVORCIADO'))
    
);
create table auditoria(
operacion varchar(30),
origen varchar(30),
fechadecambio date,
valoranterior text,
valoractual text
);

insert into "persona"("dni","apellido","nombre","fecnac","estadocivil")
values(1124,'Perez ','Juan','2000-04-17','Soltero');
DROP TABLE auditoria
select * from auditoria
CREATE OR REPLACE FUNCTION Func_au() RETURNS TRIGGER AS $$
DECLARE
valornuevo text;
valorviejo text;
origen varchar;
usuario varchar;
BEGIN
  if TG_OP ='INSERT'then
    
    valornuevo=row(new.*);
    origen:=TG_TABLE_NAME;
    usuario:=user;
    insert into auditoria("operacion","origen","fechadecambio","valoranterior","valoractual")
    values(TG_OP,origen,now(),null, valornuevo);
    
  else if
    TG_OP='UPDATE'then
      
      valornuevo:=row(new.*);
      valorviejo:=row(old.*);
      origen=TG_TABLE_NAME;
      usuario=user;
      insert into auditoria("operacion","origen","fechadecambio","valoranterior","valoractual")
      values(TG_OP,origen,now(),valorviejo, valornuevo);
      
  else if TG_OP = 'DELETE'then
   
    origen=TG_TABLE_NAME;
    valorviejo:=row(old.*);
    usuario:=user;
    insert into auditoria("operacion","origen","fechadecambio","valoranterior","valoractual")
    values(TG_OP,origen,now(),valorviejo, null);
  
  end if;
  end if;
  end if;
  return null;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_2 BEFORE INSERT OR UPDATE OR DELETE ON persona
FOR EACH ROW EXECUTE PROCEDURE func_au();
    
CREATE OR REPLACE FUNCTION func_e() RETURNS TRIGGER AS $funcemp$
DECLARE
edad smallint ;
estadocivil varchar(10);
BEGIN
NEW.estadoCivil := UPPER(NEW.estadoCivil);
edad := date_part('year',age(NEW.fecnac));
IF NEW.apellido = '' or NEW.apellido =' ' THEN 
RAISE EXCEPTION 'no puede tener apellido vacío';
END IF;
IF edad <= '18' THEN
RAISE EXCEPTION 'no puede ser menor de 18 años';
END IF;
RETURN NEW;
END; $funcemp$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_e BEFORE INSERT OR UPDATE ON persona
FOR EACH ROW EXECUTE PROCEDURE func_e();


CREATE OR REPLACE FUNCTION func_p() RETURNS TRIGGER AS $funcemp$
DECLARE
BEGIN
NEW.estadoCivil := UPPER(NEW.estadoCivil);
if OLD.estadoCivil = 'SOLTERO' AND (NEW.estadoCivil = 'VIUDO' or
NEW.estadoCivil='DIVORCIADO') THEN
RAISE EXCEPTION 'ERROR de transición en estado civil';
END IF;
if (OLD.estadoCivil = 'CASADO' or OLD.estadoCivil = 'DIVORCIADO' OR OLD.estadoCivil =
'VIUDO') AND (NEW.estadoCivil = 'SOLTERO') THEN
RAISE EXCEPTION 'ERROR de transición en estado civil';
END IF;
if OLD.estadoCivil = 'DIVORCIADO' AND (NEW.estadoCivil = 'VIUDO') THEN
RAISE EXCEPTION 'ERROR de transición en estado civil';
END IF;
if OLD.estadoCivil = 'VIUDO' AND (NEW.estadoCivil = 'DIVORDIADO') THEN
RAISE EXCEPTION 'ERROR de transición en estado civil';
END IF;
RETURN NEW;
END; $funcemp$ LANGUAGE plpgsql;

CREATE  TRIGGER trigger_p BEFORE UPDATE ON persona
FOR EACH ROW EXECUTE PROCEDURE func_p();
 
 
 alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
 
select now();

update persona SET apellido='' where dni=11131
/*delete persona where dni=11131*/
commit