---- Criação tabelas ----

DROP TABLE IF EXISTS autor_artigo CASCADE;
DROP TABLE IF EXISTS artigo CASCADE;
DROP TABLE IF EXISTS figura CASCADE;
DROP TABLE IF EXISTS opcao CASCADE;
DROP TABLE IF EXISTS questoes_questionario CASCADE;
DROP TABLE IF EXISTS questao CASCADE;
DROP TABLE IF EXISTS temas_questionario CASCADE;
DROP TABLE IF EXISTS questionario CASCADE;
DROP TABLE IF EXISTS areas_tema CASCADE;
DROP TABLE IF EXISTS ementa CASCADE;
DROP TABLE IF EXISTS tema CASCADE;
DROP TABLE IF EXISTS cursos_unidade CASCADE;
DROP TABLE IF EXISTS curso CASCADE;
DROP TABLE IF EXISTS unidade CASCADE;
DROP TABLE IF EXISTS instituicao CASCADE;
DROP TABLE IF EXISTS area_conhecimento CASCADE;
DROP TYPE IF EXISTS modalidade;
DROP TYPE IF EXISTS bloom;
DROP TYPE IF EXISTS dificuldade;

CREATE TYPE dificuldade AS ENUM ('Fácil', 'Mediano', 'Difícil');

CREATE TYPE bloom AS ENUM ('Avaliação', 'Síntese', 'Analise', 'Aplicação', 'Compreensão', 'Conhecimento');

CREATE TYPE modalidade AS ENUM ('Presencial', 'EAD', 'Hibrido');

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
	nome VARCHAR(255)
);

CREATE TABLE areas_tema
(
    tema_id integer,
    area_conhecimento_id integer,
    
    CONSTRAINT areas_tema_pkey PRIMARY KEY (tema_id, area_conhecimento_id),
    CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES tema (id),
    CONSTRAINT area_conhecimento_id_fkey FOREIGN KEY (area_conhecimento_id) REFERENCES area_conhecimento (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

CREATE TABLE instituicao
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    cnpj VARCHAR(255)
);

CREATE TABLE unidade
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    endereco_cep VARCHAR(255),
    endereco_estado VARCHAR(255),
    endereco_cidade VARCHAR(255),
    endereco_rua VARCHAR(255),
	endereco_bairro VARCHAR(255),
	endereco_numero VARCHAR(255),
    instituicao_id INTEGER,
    CONSTRAINT instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES instituicao (id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE curso
(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    modalidade_curso modalidade
);

CREATE TABLE cursos_unidade
(
    unidade_id integer,
    curso_id integer,

    CONSTRAINT cursos_unidade_pkey PRIMARY KEY (unidade_id, curso_id),
    CONSTRAINT unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES unidade (id),
    CONSTRAINT curso_id_fkey FOREIGN KEY (curso_id) REFERENCES curso (id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);
CREATE TABLE ementa
(
    curso_id integer,
    tema_id integer,

    CONSTRAINT ementa_pkey PRIMARY KEY (curso_id, tema_id),
    CONSTRAINT curso_id_fkey FOREIGN KEY (curso_id) REFERENCES curso (id),
    CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES tema (id)
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