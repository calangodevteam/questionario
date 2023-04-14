DO $$
    DECLARE
	   id_tema integer;
       id_questao integer;
	   id_artigo integer;
       id_opcao_correta integer;
    BEGIN
		id_tema:= idTema('Java');
		INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Conhecimento', 'O que é ipv4?', id_tema);
		id_questao:= idQuestao('O que é ipv4?');
		
		INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('ipv4.jpg', 'figura ipv4', id_questao);
		
		INSERT INTO artigo(DATA_PUBLICACAO, TITULO, URL, QUESTAO_ID) VALUES('2023-01-31', 'Métodos ágeis', 'https://www.google.com', id_questao);
		id_artigo:= idArtigo('Métodos ágeis', id_questao);
		INSERT INTO autor_artigo(ARTIGO_ID, AUTOR) VALUES(id_artigo, 'Jorge Santos');
		
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de maça', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de programa', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Tecnologia para carros da época', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um protocolo', id_questao);
		
		id_opcao_correta:= idOpcao('Um protocolo', id_questao);
		UPDATE questao SET OPCAO_CORRETA = id_opcao_correta WHERE ID = id_questao;
		
END 
$$;