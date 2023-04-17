---- Inserts de Tema ----
DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Java',id_area);		
END 
$$;

DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('C#',id_area);		
END 
$$;

DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Python',id_area);		
END 
$$;

DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Ruby',id_area);		
END 
$$;

DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Análise de Algoritmos e Complexidade de Computação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Algoritmos e Estrutura de Dados',id_area);		
END 
$$;

DO $$
    DECLARE
	   id_area integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Tipos de linguagem',id_area);		
END 
$$;