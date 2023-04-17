DO $$
    DECLARE
	    id_area integer;
	    id_tema integer;
	    id_questao integer;
        id_Questionario integer;
    BEGIN
		id_area:= idArea('Linguagens de Programação');
		INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO, AREA_CONHECIMENTO_ID) VALUES('Fácil', 2, 200, 1800, 'Prova de Python',id_area);
        id_Questionario:= idQuestionario('Prova de Python'); 

		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:');
		INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);

        id_questao:= idQuestao('Dado o código em Python abaixo, é INCORRETO afirmar que:');
        INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);

		id_tema:= idTemaQuestao(id_questao);
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);
END 
$$;

DO $$
    DECLARE
	    id_area integer;
	    id_tema integer;
	    id_questao integer;
        id_Questionario integer;
    BEGIN
		id_area:= idArea('Análise de Algoritmos e Complexidade de Computação');
		INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO, AREA_CONHECIMENTO_ID) VALUES('Fácil', 2, 200, 1800, 'Prova de Algoritmos e Estrutura de Dados',id_area);
        id_Questionario:= idQuestionario('Prova de Algoritmos e Estrutura de Dados'); 
        
		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:');
		INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);
        id_tema:= idTemaQuestao(id_questao);
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);


        id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:');
        INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);

		id_tema:= idTemaQuestao(id_questao);
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);
END 
$$;

