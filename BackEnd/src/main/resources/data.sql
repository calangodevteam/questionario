---- Criação tabelas ----


DROP TABLE IF EXISTS questoes_questionario;
DROP TABLE IF EXISTS temas_questionario;
DROP TABLE IF EXISTS questionario;
DROP TYPE IF EXISTS dificuldade;
DROP TABLE IF EXISTS autor_artigo;
DROP TABLE IF EXISTS artigo;
DROP TABLE IF EXISTS figura;
DROP TABLE IF EXISTS opcao;
DROP TABLE IF EXISTS questao;
DROP TYPE IF EXISTS bloom;
DROP TABLE IF EXISTS tema;
DROP TABLE IF EXISTS area_conhecimento;

CREATE TABLE area_conhecimento
(
  id SERIAL PRIMARY KEY,
  nome VARCHAR(255),
  id_pai INTEGER,
  CONSTRAINT area_conhecimento_pai FOREIGN KEY (id_pai) REFERENCES area_conhecimento (id)
	ON UPDATE NO ACTION
    ON DELETE NO ACTION
);

CREATE TABLE tema 
(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	area_conhecimento_id integer,
	
	CONSTRAINT area_conhecimento_id_fkey FOREIGN KEY (area_conhecimento_id) REFERENCES area_conhecimento (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TYPE bloom AS ENUM ('Avaliação', 'Síntese', 'Analise', 'Aplicação', 'Compreensão', 'Conhecimento');

CREATE TABLE questao
(
    id SERIAL PRIMARY KEY,
    categoria_bloom bloom,
    texto text,
    tema_id integer,
    CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES tema (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TABLE opcao
(
    id SERIAL PRIMARY KEY,
    correta boolean,
    numero integer,
    texto text,
    questao_id integer,
    CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES questao (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE figura
(
    id SERIAL PRIMARY KEY,
    atributo VARCHAR(255),
    descricao VARCHAR(255),
    questao_id integer,
    CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES questao (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE artigo
(
    id SERIAL PRIMARY KEY,
    data_publicacao DATE,
    titulo VARCHAR(255),
    url VARCHAR(255),
    questao_id integer,
    CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES questao (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE autor_artigo
(
    artigo_id integer NOT NULL,
    autor VARCHAR(255),
    CONSTRAINT artigo_id_fkey FOREIGN KEY (artigo_id) REFERENCES public.artigo (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TYPE dificuldade AS ENUM ('Fácil', 'Mediano', 'Difícil');

CREATE TABLE questionario
(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(255),
	qtd_questoes integer,
	tempo_duracao integer,
	tempo_disponivel integer,
	nivel_dificuldade dificuldade
);

CREATE TABLE temas_questionario 
(
    questionario_id integer NOT NULL,
    tema_id integer NOT NULL,
    
    CONSTRAINT temas_questionario_pkey PRIMARY KEY (questionario_id, tema_id),
	CONSTRAINT questionario_id_fkey FOREIGN KEY (questionario_id) REFERENCES questionario (id),
	CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES tema (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TABLE questoes_questionario
(
	questao_id integer NOT NULL,
	questionario_id integer NOT NULL,
	
	CONSTRAINT questoes_questionario_pkey PRIMARY KEY (questao_id, questionario_id),
	CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES questao (id),
	CONSTRAINT questionario_id_fkey FOREIGN KEY (questionario_id) REFERENCES questionario (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);


---- Inserts em tabelas ----


---- Area de Conhecimento ----

INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('AREAS DE CONHECIMENTOS', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Redes', 1);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Engenharia de software', 1);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Programação', 1);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Linguagens', 4);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Redes wirelles', 2);

---- Tema ----

INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Protocolos', 2);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Java', 5);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Metodos ageis', 3);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('c#', 5);

---- Questao ----

INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Conhecimento', 'O que é ipv4?',1);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Compreensão', 'O que é C#?',4);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Síntese', 'Quantas camadas tem o modelo OSI?',1);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Aplicação', 'O que é o scrum?',3);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Avaliação', 'Marque a questão que apresenta um erro de sintaxe.',2);

---- Figura ----

INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('ipv4.jpg', 'figura ipv4', 1);
INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('scrum.jpg', 'figura scrum', 4);
INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('java.jpg', 'figura java', 5);
INSERT INTO figura(ATRIBUTO, DESCRICAO, QUESTAO_ID) VALUES('modeloosi.jpg', 'figura modelo osi', 3);

---- Artigo ----

INSERT INTO artigo(DATA_PUBLICACAO, TITULO, URL, QUESTAO_ID) VALUES('2023-01-31', 'A história dos protocolos de rede.', 'https://www.google.com', 1);
INSERT INTO artigo(DATA_PUBLICACAO, TITULO, URL, QUESTAO_ID) VALUES('2023-01-31', ' Métodos ágeis.', 'https://www.google.com', 4);

---- Autores Artigos ----

INSERT INTO autor_artigo(ARTIGO_ID, AUTOR) VALUES(1, 'Jorge Santos');
INSERT INTO autor_artigo(ARTIGO_ID, AUTOR) VALUES(2, 'Marcio Cruz');
INSERT INTO autor_artigo(ARTIGO_ID, AUTOR) VALUES(2, 'Vinicius Silva');

---- Opcao ----

INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Um tipo de maça', 1, 1);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Um tipo de programa', 1, 2);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Tecnologia para carros da época', 1, 3);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(True, 'Um protocolo', 1, 4);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Um tipo de maça', 2, 1);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Tecnologia para carros da época', 2, 2);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Um protocolo', 2, 3);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(True, 'É uma linguagem formal, orientada a objetos, que permite que um programador escreva um conjunto de ordens', 2, 4);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, '5', 3, 1);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, '4', 3, 2);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, '6', 3, 3);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(True, '7', 3, 4);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Um tipo de maça', 4, 1);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'Tecnologia para carros da época', 4, 2);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'É uma linguagem formal que permite que um programador escreva um conjunto de ordens', 4, 3);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(True, 'Scrum é um conjunto de boas práticas empregado no gerenciamento de projetos complexos', 4, 4);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'system.out.printlm("hello world");', 5, 1);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'system.out.println("hello world")', 5, 2);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(False, 'system.in.println("hello world");', 5, 3);
INSERT INTO opcao(CORRETA, TEXTO, QUESTAO_ID, NUMERO) VALUES(True, 'system.out.println("hello world");', 5, 4);

---- Questionario ----

INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO) VALUES('Fácil', 2, 200, 1800, 'Prova de Redes'); 

---- Temas do Questionario ----

INSERT INTO temas_questionario(QUESTIONARIO_ID, TEMA_ID) VALUES(1,1);

---- Questoes Questionario ----

INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(1,1); 
INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(1,3); 
