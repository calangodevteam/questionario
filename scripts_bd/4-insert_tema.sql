---- Inserts de Tema ----
DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Física');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Aloha',id_area);		
END 
$$;