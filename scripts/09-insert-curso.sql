---- Insert Cursos -----

DO $$
    DECLARE
	   id_curso integer;
	   id_tema integer;
    BEGIN
		INSERT INTO curso(NOME, MODALIDADE_CURSO) VALUES('TADS', 'Presencial');
		id_curso:= idCurso('TADS', 'Presencial');
        
        id_tema:= idTema('Java');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);

        id_tema:= idTema('C#');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);

        id_tema:= idTema('Python');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);
END 
$$;

DO $$
    DECLARE
	   id_curso integer;
	   id_tema integer;
    BEGIN
		INSERT INTO curso(NOME, MODALIDADE_CURSO) VALUES('Ciência da Computação', 'Presencial');
		id_curso:= idCurso('Ciência da Computação', 'Presencial');
        
        id_tema:= idTema('Java');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);

        id_tema:= idTema('C#');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);

        id_tema:= idTema('Python');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);

        id_tema:= idTema('Tipos de linguagem');
		INSERT INTO ementa(CURSO_ID, TEMA_ID) VALUES(id_curso, id_tema);
END 
$$;