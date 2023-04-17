---- Criação tabelas ----

DROP TABLE IF EXISTS autor_artigo CASCADE;
DROP TABLE IF EXISTS artigo CASCADE;
DROP TABLE IF EXISTS figura CASCADE;
DROP TABLE IF EXISTS opcao CASCADE;
DROP TABLE IF EXISTS questoes_questionario CASCADE;
DROP TABLE IF EXISTS questao CASCADE;
DROP TABLE IF EXISTS questionario CASCADE;
DROP TABLE IF EXISTS tema CASCADE;
DROP TABLE IF EXISTS area_conhecimento CASCADE;

DROP TYPE IF EXISTS bloom;
DROP TYPE IF EXISTS dificuldade;

CREATE TYPE dificuldade AS ENUM ('Fácil', 'Mediano', 'Difícil');

CREATE TYPE bloom AS ENUM ('Avaliação', 'Síntese', 'Analise', 'Aplicação', 'Compreensão', 'Conhecimento');

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

CREATE TABLE questionario
(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(255),
	qtd_questoes integer,
	tempo_duracao integer,
	tempo_disponivel integer,
	nivel_dificuldade dificuldade,
	tema_id integer,
	CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES tema (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TABLE questao
(
    id SERIAL PRIMARY KEY,
    categoria_bloom bloom,
    texto text,
    tema_id integer,
	opcao_correta integer,
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

CREATE TABLE opcao
(
    id SERIAL PRIMARY KEY,
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
    CONSTRAINT artigo_id_fkey FOREIGN KEY (artigo_id) REFERENCES artigo (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


 ALTER TABLE IF EXISTS questao
 ADD CONSTRAINT opcao_correta_fkey FOREIGN KEY (opcao_correta) REFERENCES opcao(id);


---- Inserts em tabelas ----


---- Area de Conhecimento ----

INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Redes', NULL );
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Engenharia de software', NULL );
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Programação', NULL );
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Linguagens', 3);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Redes wirelles', 1);

---- Tema ----

INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Protocolos', 1);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Java', 4);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('Metodos ageis', 2);
INSERT INTO tema(NOME, AREA_CONHECIMENTO_ID) VALUES('c#', 4);

---- Questao ----

INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Conhecimento', 'O que é ipv4?', 1);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Compreensão', 'O que é C#?', 4);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Síntese', 'Quantas camadas tem o modelo OSI?', 1);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Aplicação', 'O que é o scrum?', 3);
INSERT INTO questao(categoria_bloom, TEXTO, TEMA_ID) VALUES('Avaliação', 'Marque a questão que apresenta um erro de sintaxe.', 2);

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

INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de maça', 1);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de programa', 1);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Tecnologia para carros da época', 1);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um protocolo', 1);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de maça', 2);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Tecnologia para carros da época', 2);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um protocolo', 2);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('É uma linguagem formal, orientada a objetos, que permite que um programador escreva um conjunto de ordens', 2);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('5', 3);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('4', 3);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('6', 3);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('7', 3);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Um tipo de maça', 4);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Tecnologia para carros da época', 4);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('É uma linguagem formal que permite que um programador escreva um conjunto de ordens', 4);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('Scrum é um conjunto de boas práticas empregado no gerenciamento de projetos complexos', 4);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('system.out.printlm("hello world");', 5);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('system.out.println("hello world")', 5);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('system.in.println("hello world");', 5);
INSERT INTO opcao(TEXTO, QUESTAO_ID) VALUES('system.out.println("hello world");', 5);


---- Atualização para inserção das questões corretas ----

UPDATE questao SET OPCAO_CORRETA = 4 WHERE ID = 1;
UPDATE questao SET OPCAO_CORRETA = 8 WHERE ID = 2;
UPDATE questao SET OPCAO_CORRETA = 12 WHERE ID = 3;
UPDATE questao SET OPCAO_CORRETA = 16 WHERE ID = 4;
UPDATE questao SET OPCAO_CORRETA = 20 WHERE ID = 5;

---- Questionario ----

INSERT INTO questionario(NIVEL_DIFICULDADE, QTD_QUESTOES, TEMPO_DISPONIVEL, TEMPO_DURACAO, TITULO, TEMA_ID) VALUES('Fácil', 2, 200, 1800, 'Prova de Redes',1); 


---- Questoes Questionario ----

INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(1,1); 
INSERT INTO questoes_questionario(QUESTIONARIO_ID, QUESTAO_ID) VALUES(1,3); 
