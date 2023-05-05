---- Insert Cursos da unidade -----

DO $$
    DECLARE
	   id_curso integer;
	   id_unidade integer;
    BEGIN
		id_unidade:= idUnidade('UERJ-ZO');
		id_curso:= idCurso('TADS', 'Presencial');
		INSERT INTO cursos_unidade(UNIDADE_ID, CURSO_ID) VALUES(id_unidade, id_curso);
END 
$$;

DO $$
    DECLARE
	   id_curso integer;
	   id_unidade integer;
    BEGIN
		id_unidade:= idUnidade('UERJ-ZO');
		id_curso:= idCurso('Ciência da Computação', 'Presencial');
		INSERT INTO cursos_unidade(UNIDADE_ID, CURSO_ID) VALUES(id_unidade, id_curso);
END 
$$;