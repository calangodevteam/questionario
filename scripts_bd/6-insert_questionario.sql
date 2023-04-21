DO $$
    DECLARE
	    id_tema integer;
	    id_questao integer;
        id_Questionario integer;
    BEGIN
		-- inserir questionario e recuperar id
		INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO) VALUES('Fácil', 2, 200, 1800, 'Prova de Python');
		id_Questionario:= idQuestionario('Prova de Python'); 
 
		-- buscar id tema e inserir na tabela temas_questionario
		id_tema:= idTema('Python');
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);

		-- add questao e inserir na tabela questoes_questionario
		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:');
		INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);

        id_questao:= idQuestao('Dado o código em Python abaixo, é INCORRETO afirmar que:');
        INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);
END 
$$;

DO $$
    DECLARE
	    id_tema integer;
	    id_questao integer;
        id_Questionario integer;
    BEGIN

		-- inserir questionario e recuperar id
		INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO) VALUES('Fácil', 2, 200, 1800, 'Prova de Algoritmos e Estrutura de Dados');
        id_Questionario:= idQuestionario('Prova de Algoritmos e Estrutura de Dados'); 

		-- buscar id tema e inserir na tabela temas_questionario
		id_tema:= idTema('Algoritmos e Estrutura de Dados');
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);

		id_tema:= idTema('Python');
		INSERT INTO temas_questionario(TEMA_ID, QUESTIONARIO_ID) VALUES(id_tema, id_Questionario);
        
		-- add questao e inserir na tabela questoes_questionario
		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:');
		INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);

        id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:');
        INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(id_Questionario,id_questao);
END 
$$;

