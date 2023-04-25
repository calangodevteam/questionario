---- Inserts de Tema ----
DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME) VALUES('Java');
		id_tema:= idTema('Java');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);
END 
$$;

DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME) VALUES('C#');
		id_tema:= idTema('C#');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);	
END 
$$;

DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME) VALUES('Python');
		id_tema:= idTema('Python');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);	
END 
$$;

DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME) VALUES('Ruby');
		id_tema:= idTema('Ruby');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);	
END 
$$;

DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Análise de Algoritmos e Complexidade de Computação');	
		INSERT INTO tema(NOME) VALUES('Algoritmos e Estrutura de Dados');
		id_tema:= idTema('Algoritmos e Estrutura de Dados');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);
END 
$$;

DO $$
    DECLARE
	   id_area integer;
	   id_tema integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');	
		INSERT INTO tema(NOME) VALUES('Tipos de linguagem');
		id_tema:= idTema('Tipos de linguagem');
		INSERT INTO areas_tema(AREA_CONHECIMENTO_ID, TEMA_ID) VALUES(id_area, id_tema);	
END 
$$;