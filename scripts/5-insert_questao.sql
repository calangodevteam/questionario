---- Insert Questões -----

DO $$
    DECLARE
	   id_tema integer;
       id_questao integer;
	   id_artigo integer;
       id_opcao_correta integer;
    BEGIN
		id_tema:= idTema('Algoritmos e Estrutura de Dados');
		INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Analise', 'Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:', id_tema);
		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:');
		
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Uma constante é um determinado valor fixo que não se modifica ao longo do tempo, durante a execução de um programa.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Uma variável corresponde a uma posição de memória, cujo conteúdo pode variar ao longo do tempo durante a execução de um programa.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um valor lógico é utilizado em proposições lógicas e só pode assumir os valores Falso ou Verdadeiro.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um valor do tipo literal pode assumir sequência de caracteres, como letras e números, exceto símbolos especiais.', id_questao);
		
		id_opcao_correta:= idOpcao('Um valor do tipo literal pode assumir sequência de caracteres, como letras e números, exceto símbolos especiais.', id_questao);
		UPDATE questao SET OPCAO_CORRETA = id_opcao_correta WHERE ID = id_questao;
		
END 
$$;

DO $$
    DECLARE
	   id_tema integer;
       id_questao integer;
	   id_artigo integer;
       id_opcao_correta integer;
    BEGIN
		id_tema:= idTema('Python');
		INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Conhecimento', 'Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:', id_tema);
		id_questao:= idQuestao('Com relação a Algoritmos e Estrutura de Dados em Python, dadas as afirmações abaixo, segundo Farrer (1999), assinale a alternativa CORRETA:');
		
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Python é uma linguagem compilável, a qual, após esse processo, gera um arquivo executável, do tipo binário.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('A declaração de variáveis é algo obrigatório em Python.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Python é uma linguagem procedural a qual não contempla orientação a objetos.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Em comandos condicionais ou de repetição, a separação de blocos de código em Phyton é feita utilizando a indentação.', id_questao);
		
		id_opcao_correta:= idOpcao('Em comandos condicionais ou de repetição, a separação de blocos de código em Phyton é feita utilizando a indentação.', id_questao);
		UPDATE questao SET OPCAO_CORRETA = id_opcao_correta WHERE ID = id_questao;
		
END 
$$;

DO $$
    DECLARE
	   id_tema integer;
       id_questao integer;
	   id_artigo integer;
       id_opcao_correta integer;
    BEGIN
		id_tema:= idTema('Tipos de linguagem');
		INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Conhecimento', 'Segundo Sebesta (2011), as linguagens de programação são, normalmente, divididas em quatro categorias. Assinale a alternativa que as apresenta CORRETAMENTE:', id_tema);
		id_questao:= idQuestao('Segundo Sebesta (2011), as linguagens de programação são, normalmente, divididas em quatro categorias. Assinale a alternativa que as apresenta CORRETAMENTE:');

		INSERT INTO artigo(DATA_PUBLICACAO, TITULO, URL, QUESTAO_ID) VALUES('2023-01-31', 'As linguagens de programação', 'https://www.google.com', id_questao);
		id_artigo:= idArtigo('As linguagens de programação', id_questao);
		INSERT INTO autor_artigo(ARTIGO_ID, AUTOR) VALUES(id_artigo, 'Jorge Santos');
		
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Imperativas, lógicas, marcação e orientadas a objeto.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Imperativas, funcionais, lógicas e orientadas a objeto.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Funcionais, marcação, lógicas e orientadas a objeto.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Imperativas, funcionais, visuais e orientadas a objeto.', id_questao);
		
		id_opcao_correta:= idOpcao('Imperativas, funcionais, lógicas e orientadas a objeto.', id_questao);
		UPDATE questao SET OPCAO_CORRETA = id_opcao_correta WHERE ID = id_questao;
		
END 
$$;

DO $$
    DECLARE
	   id_tema integer;
       id_questao integer;
	   id_artigo integer;
       id_opcao_correta integer;
    BEGIN
		id_tema:= idTema('Python');
		INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Aplicação', 'Dado o código em Python abaixo, é INCORRETO afirmar que:', id_tema);
		id_questao:= idQuestao('Dado o código em Python abaixo, é INCORRETO afirmar que:');
		
		INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('codigo_py.jpg', 'codigo da questao', id_questao);
		
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('O código está correto e apresentará os números de 2 a 9, indicando quando um número for primo, e demonstrando a primeira ocorrência de um múltiplo, quando o número não for primo.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('O “else:” está colocado em local errado, pois comandos de repetição, em Python, não permitem a utilização de else.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('A instrução de impressão “%.2f” vai exibir a divisão de n/x com duas casas decimais.', id_questao);
		INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('No primeiro comando de repetição, os valores assumidos por “n” serão: 2,3,4,5,6,7,8,9.', id_questao);
		
		id_opcao_correta:= idOpcao('O “else:” está colocado em local errado, pois comandos de repetição, em Python, não permitem a utilização de else.', id_questao);
		UPDATE questao SET OPCAO_CORRETA = id_opcao_correta WHERE ID = id_questao;
		
END 
$$;