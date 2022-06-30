SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER B_IU_CPF_R_TRG
BEFORE INSERT OR UPDATE OF nr_cpf
ON t_mc_cli_fisica
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	pcd_validador_cpf(:new.nr_cpf);	
	DBMS_OUTPUT.PUT_LINE('CPF ANTIGO: ' || TO_CHAR(:old.nr_cpf));
	DBMS_OUTPUT.PUT_LINE('CPF NOVO: ' 	|| TO_CHAR(:new.nr_cpf));
EXCEPTION 
	WHEN OTHERS THEN RAISE;
END;
/