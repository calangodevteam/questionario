---- Criação tabelas ----

DROP TABLE IF EXISTS autor_artigo CASCADE;
DROP TABLE IF EXISTS artigo CASCADE;
DROP TABLE IF EXISTS figura CASCADE;
DROP TABLE IF EXISTS opcao CASCADE;
DROP TABLE IF EXISTS questoes_questionario CASCADE;
DROP TABLE IF EXISTS temas_questionario CASCADE;
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
	area_conhecimento_id integer,
	CONSTRAINT area_conhecimento_id_fkey FOREIGN KEY (area_conhecimento_id) REFERENCES area_conhecimento (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TABLE questao
(
    id SERIAL PRIMARY KEY,
    categoria_bloom bloom,
    texto text UNIQUE,
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