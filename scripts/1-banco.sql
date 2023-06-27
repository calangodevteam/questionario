--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-06-21 21:46:26 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- SCHEMA: public

DROP SCHEMA IF EXISTS public cascade ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT USAGE ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO pg_database_owner;

--
-- TOC entry 872 (class 1247 OID 17286)
-- Name: bloom; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.bloom AS ENUM (
    'Avaliação',
    'Síntese',
    'Analise',
    'Aplicação',
    'Compreensão',
    'Conhecimento'
);


ALTER TYPE public.bloom OWNER TO postgres;

--
-- TOC entry 875 (class 1247 OID 17300)
-- Name: dificuldade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.dificuldade AS ENUM (
    'Fácil',
    'Mediano',
    'Difícil'
);


ALTER TYPE public.dificuldade OWNER TO postgres;

--
-- TOC entry 878 (class 1247 OID 17308)
-- Name: modalidade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.modalidade AS ENUM (
    'Presencial',
    'EAD',
    'Hibrido'
);


ALTER TYPE public.modalidade OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 17576)
-- Name: function_atualizar_pontuacao(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.function_atualizar_pontuacao() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
	var_estrelas INTEGER;
	var_nivel INTEGER;
	var_exp INTEGER;
	var_prox_nivel INTEGER;
BEGIN
	SELECT estrelas, nivel, experiencia, prox_nivel INTO var_estrelas, var_nivel, var_exp, var_prox_nivel
	FROM pontuacao 
	WHERE id = NEW.id;
	
	var_exp := var_exp + NEW.experiencia;
	
	WHILE var_exp >= var_prox_nivel LOOP
     	var_nivel := var_nivel+1;
		var_exp := var_exp - var_prox_nivel;
		var_prox_nivel := var_prox_nivel*1.5;
   	END LOOP;
	
	New.estrelas := New.estrelas+var_estrelas;
	New.nivel := var_nivel;
	NEW.experiencia := var_exp;
    NEW.prox_nivel := var_prox_nivel;
	
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.function_atualizar_pontuacao() OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 17578)
-- Name: function_calcular_pontuacao(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.function_calcular_pontuacao() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE 
	var_nivel_dificuldade dificuldade;
	var_estrelas INTEGER;
	var_exp INTEGER;
BEGIN

	IF OLD.termino IS NULL THEN
        
		SELECT nivel_dificuldade INTO var_nivel_dificuldade FROM questionario WHERE id = NEW.questionario_id;
	
		CASE 
			WHEN var_nivel_dificuldade = 'Fácil' THEN
				var_estrelas := NEW.qtd_acertos*6;
				var_exp :=NEW.qtd_acertos*100;
			WHEN var_nivel_dificuldade = 'Mediano' THEN
				var_estrelas := NEW.qtd_acertos*8;
				var_exp := NEW.qtd_acertos*200;
			WHEN var_nivel_dificuldade = 'Difícil' THEN
				var_estrelas := NEW.qtd_acertos*12;
				var_exp := NEW.qtd_acertos*400;
			ELSE
				var_estrelas := 0;
				var_exp := 0;
		END CASE;

		UPDATE pontuacao SET estrelas = var_estrelas, experiencia = var_exp WHERE aluno_id = NEW.aluno_id;
		
    END IF;
	
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.function_calcular_pontuacao() OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 17574)
-- Name: function_criar_pontuacao(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.function_criar_pontuacao() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO pontuacao(aluno_id)	VALUES (NEW.id);
	
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.function_criar_pontuacao() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17317)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id integer NOT NULL,
    nome character varying(255),
    email character varying(255),
    foto_perfil character varying(255),
    endereco_cep character varying(255),
    endereco_estado character varying(255),
    endereco_cidade character varying(255),
    endereco_bairro character varying(255),
    endereco_rua character varying(255),
    endereco_numero character varying(255),
    cursos_unidade_id integer
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17322)
-- Name: aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aluno_id_seq OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 215
-- Name: aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_seq OWNED BY public.aluno.id;


--
-- TOC entry 216 (class 1259 OID 17323)
-- Name: area_conhecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_conhecimento (
    id integer NOT NULL,
    nome character varying(255),
    id_pai integer
);


ALTER TABLE public.area_conhecimento OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17326)
-- Name: area_conhecimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.area_conhecimento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_conhecimento_id_seq OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_conhecimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_conhecimento_id_seq OWNED BY public.area_conhecimento.id;


--
-- TOC entry 218 (class 1259 OID 17327)
-- Name: artigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artigo (
    id integer NOT NULL,
    data_publicacao date,
    titulo character varying(255),
    url character varying(255),
    questao_id integer,
    conteudo text
);


ALTER TABLE public.artigo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17332)
-- Name: artigo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artigo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artigo_id_seq OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 219
-- Name: artigo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artigo_id_seq OWNED BY public.artigo.id;


--
-- TOC entry 220 (class 1259 OID 17333)
-- Name: autor_artigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_artigo (
    artigo_id integer NOT NULL,
    autor character varying(255)
);


ALTER TABLE public.autor_artigo OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17336)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17339)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_id_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 222
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 223 (class 1259 OID 17340)
-- Name: cursos_unidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos_unidade (
    id integer NOT NULL,
    modalidade_curso public.modalidade,
    unidade_id integer,
    curso_id integer
);


ALTER TABLE public.cursos_unidade OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17343)
-- Name: cursos_unidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_unidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cursos_unidade_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 224
-- Name: cursos_unidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_unidade_id_seq OWNED BY public.cursos_unidade.id;


--
-- TOC entry 225 (class 1259 OID 17344)
-- Name: figura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.figura (
    id integer NOT NULL,
    atributo character varying(255),
    descricao character varying(255),
    questao_id integer
);


ALTER TABLE public.figura OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17349)
-- Name: figura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.figura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.figura_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 226
-- Name: figura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.figura_id_seq OWNED BY public.figura.id;


--
-- TOC entry 227 (class 1259 OID 17350)
-- Name: instituicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicao (
    id integer NOT NULL,
    nome character varying(255),
    cnpj character varying(255)
);


ALTER TABLE public.instituicao OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17355)
-- Name: instituicao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instituicao_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 228
-- Name: instituicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituicao_id_seq OWNED BY public.instituicao.id;


--
-- TOC entry 229 (class 1259 OID 17356)
-- Name: opcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opcao (
    id integer NOT NULL,
    texto text,
    questao_id integer
);


ALTER TABLE public.opcao OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17361)
-- Name: opcao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opcao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.opcao_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 230
-- Name: opcao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opcao_id_seq OWNED BY public.opcao.id;


--
-- TOC entry 231 (class 1259 OID 17362)
-- Name: pontuacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pontuacao (
    id integer NOT NULL,
    estrelas integer DEFAULT 200,
    nivel integer DEFAULT 1,
    experiencia integer DEFAULT 0,
    prox_nivel integer DEFAULT 500,
    aluno_id integer
);


ALTER TABLE public.pontuacao OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17369)
-- Name: pontuacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pontuacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pontuacao_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 232
-- Name: pontuacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pontuacao_id_seq OWNED BY public.pontuacao.id;


--
-- TOC entry 233 (class 1259 OID 17370)
-- Name: questao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questao (
    id integer NOT NULL,
    categoria_bloom public.bloom,
    texto text,
    temas_areas_id integer,
    opcao_correta integer
);


ALTER TABLE public.questao OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17375)
-- Name: questao2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questao2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questao2_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 234
-- Name: questao2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questao2_id_seq OWNED BY public.questao.id;


--
-- TOC entry 235 (class 1259 OID 17376)
-- Name: questionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionario (
    id integer NOT NULL,
    titulo character varying(255),
    qtd_questoes integer,
    tempo_duracao integer,
    tempo_disponivel integer,
    nivel_dificuldade public.dificuldade,
    temas_areas_id integer,
    data_criacao timestamp without time zone
);


ALTER TABLE public.questionario OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17379)
-- Name: questionario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionario_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 236
-- Name: questionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionario_id_seq OWNED BY public.questionario.id;


--
-- TOC entry 237 (class 1259 OID 17380)
-- Name: questoes_questionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questoes_questionario (
    questao_id integer NOT NULL,
    questionario_id integer NOT NULL
);


ALTER TABLE public.questoes_questionario OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17535)
-- Name: resultado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resultado (
    aluno_id integer,
    questionario_id integer,
    inicio timestamp without time zone,
    termino timestamp without time zone,
    qtd_acertos integer,
    id integer NOT NULL
);


ALTER TABLE public.resultado OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17583)
-- Name: resultado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resultado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resultado_id_seq OWNER TO postgres;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 246
-- Name: resultado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resultado_id_seq OWNED BY public.resultado.id;


--
-- TOC entry 238 (class 1259 OID 17383)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tema (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.tema OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17386)
-- Name: tema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tema_id_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 239
-- Name: tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tema_id_seq OWNED BY public.tema.id;


--
-- TOC entry 240 (class 1259 OID 17387)
-- Name: temas_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas_areas (
    id integer NOT NULL,
    tema_id integer NOT NULL,
    area_conhecimento_id integer NOT NULL
);


ALTER TABLE public.temas_areas OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17390)
-- Name: temas_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temas_areas_id_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 241
-- Name: temas_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_areas_id_seq OWNED BY public.temas_areas.id;


--
-- TOC entry 242 (class 1259 OID 17391)
-- Name: temas_areas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_areas_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temas_areas_seq OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17392)
-- Name: unidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidade (
    id integer NOT NULL,
    nome character varying(255),
    endereco_cep character varying(255),
    endereco_estado character varying(255),
    endereco_cidade character varying(255),
    endereco_bairro character varying(255),
    endereco_rua character varying(255),
    endereco_numero character varying(255),
    instituicao_id integer
);


ALTER TABLE public.unidade OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17397)
-- Name: unidade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidade_id_seq OWNER TO postgres;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 244
-- Name: unidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidade_id_seq OWNED BY public.unidade.id;


--
-- TOC entry 3267 (class 2604 OID 17398)
-- Name: aluno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id SET DEFAULT nextval('public.aluno_id_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 17399)
-- Name: area_conhecimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento ALTER COLUMN id SET DEFAULT nextval('public.area_conhecimento_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 17400)
-- Name: artigo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo ALTER COLUMN id SET DEFAULT nextval('public.artigo_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 17401)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 17402)
-- Name: cursos_unidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_unidade ALTER COLUMN id SET DEFAULT nextval('public.cursos_unidade_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 17403)
-- Name: figura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura ALTER COLUMN id SET DEFAULT nextval('public.figura_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 17404)
-- Name: instituicao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao ALTER COLUMN id SET DEFAULT nextval('public.instituicao_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 17405)
-- Name: opcao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao ALTER COLUMN id SET DEFAULT nextval('public.opcao_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 17406)
-- Name: pontuacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pontuacao ALTER COLUMN id SET DEFAULT nextval('public.pontuacao_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 17407)
-- Name: questao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao ALTER COLUMN id SET DEFAULT nextval('public.questao2_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 17408)
-- Name: questionario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionario ALTER COLUMN id SET DEFAULT nextval('public.questionario_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 17584)
-- Name: resultado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado ALTER COLUMN id SET DEFAULT nextval('public.resultado_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 17409)
-- Name: tema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema ALTER COLUMN id SET DEFAULT nextval('public.tema_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 17410)
-- Name: temas_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas ALTER COLUMN id SET DEFAULT nextval('public.temas_areas_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 17411)
-- Name: unidade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade ALTER COLUMN id SET DEFAULT nextval('public.unidade_id_seq'::regclass);


--
-- TOC entry 3486 (class 0 OID 17317)
-- Dependencies: 214
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno VALUES (2, 'teste', 'teste@email.com', 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png', '23071-160', 'RJ', 'Rio de Janeiro', 'Campo Grande', 'rua teste', '23', 1);


--
-- TOC entry 3488 (class 0 OID 17323)
-- Dependencies: 216
-- Data for Name: area_conhecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.area_conhecimento VALUES (1, 'Ciências Exatas e da Terra', NULL);
INSERT INTO public.area_conhecimento VALUES (2, 'Ciências Biológicas', NULL);
INSERT INTO public.area_conhecimento VALUES (3, 'Engenharias', NULL);
INSERT INTO public.area_conhecimento VALUES (4, 'Ciências da Saúde', NULL);
INSERT INTO public.area_conhecimento VALUES (5, 'Ciências Agrárias', NULL);
INSERT INTO public.area_conhecimento VALUES (6, 'Ciências Sociais Aplicadas', NULL);
INSERT INTO public.area_conhecimento VALUES (7, 'Ciências Humanas', NULL);
INSERT INTO public.area_conhecimento VALUES (8, 'Linguística, Letras e Artes', NULL);
INSERT INTO public.area_conhecimento VALUES (9, 'Matemática', 1);
INSERT INTO public.area_conhecimento VALUES (10, 'Probabilidade e Estatística', 1);
INSERT INTO public.area_conhecimento VALUES (11, 'Ciência da Computação', 1);
INSERT INTO public.area_conhecimento VALUES (12, 'Astronomia', 1);
INSERT INTO public.area_conhecimento VALUES (13, 'Física', 1);
INSERT INTO public.area_conhecimento VALUES (14, 'Química', 1);
INSERT INTO public.area_conhecimento VALUES (15, 'GeoCiências', 1);
INSERT INTO public.area_conhecimento VALUES (16, 'Oceanografia', 1);
INSERT INTO public.area_conhecimento VALUES (17, 'Biologia Geral', 2);
INSERT INTO public.area_conhecimento VALUES (18, 'Genética', 2);
INSERT INTO public.area_conhecimento VALUES (19, 'Botânica', 2);
INSERT INTO public.area_conhecimento VALUES (20, 'Zoologia', 2);
INSERT INTO public.area_conhecimento VALUES (21, 'Ecologia', 2);
INSERT INTO public.area_conhecimento VALUES (22, 'Morfologia', 2);
INSERT INTO public.area_conhecimento VALUES (23, 'Fisiologia', 2);
INSERT INTO public.area_conhecimento VALUES (24, 'Bioquímica', 2);
INSERT INTO public.area_conhecimento VALUES (25, 'Biofísica', 2);
INSERT INTO public.area_conhecimento VALUES (26, 'Farmacologia', 2);
INSERT INTO public.area_conhecimento VALUES (27, 'Imunologia', 2);
INSERT INTO public.area_conhecimento VALUES (28, 'Microbiologia', 2);
INSERT INTO public.area_conhecimento VALUES (29, 'Parasitologia', 2);
INSERT INTO public.area_conhecimento VALUES (30, 'Engenharia Civil', 3);
INSERT INTO public.area_conhecimento VALUES (31, 'Engenharia de Minas', 3);
INSERT INTO public.area_conhecimento VALUES (32, 'Engenharia de Materiais e Metalúrgica', 3);
INSERT INTO public.area_conhecimento VALUES (33, 'Engenharia Elétrica', 3);
INSERT INTO public.area_conhecimento VALUES (34, 'Engenharia Mecânica', 3);
INSERT INTO public.area_conhecimento VALUES (35, 'Engenharia Química', 3);
INSERT INTO public.area_conhecimento VALUES (36, 'Engenharia Sanitária', 3);
INSERT INTO public.area_conhecimento VALUES (37, 'Engenharia de Produção', 3);
INSERT INTO public.area_conhecimento VALUES (38, 'Engenharia Nuclear', 3);
INSERT INTO public.area_conhecimento VALUES (39, 'Engenharia de Transportes', 3);
INSERT INTO public.area_conhecimento VALUES (40, 'Engenharia Naval e Oceânica', 3);
INSERT INTO public.area_conhecimento VALUES (41, 'Engenharia Aeroespacial', 3);
INSERT INTO public.area_conhecimento VALUES (42, 'Engenharia Biomédica', 3);
INSERT INTO public.area_conhecimento VALUES (43, 'Medicina', 4);
INSERT INTO public.area_conhecimento VALUES (44, 'Odontologia', 4);
INSERT INTO public.area_conhecimento VALUES (45, 'Farmácia', 4);
INSERT INTO public.area_conhecimento VALUES (46, 'Enfermagem', 4);
INSERT INTO public.area_conhecimento VALUES (47, 'Nutrição', 4);
INSERT INTO public.area_conhecimento VALUES (48, 'Saúde Coletiva', 4);
INSERT INTO public.area_conhecimento VALUES (49, 'Fonoaudiologia', 4);
INSERT INTO public.area_conhecimento VALUES (50, 'Fisioterapia e Terapia Ocupacional', 4);
INSERT INTO public.area_conhecimento VALUES (51, 'Educação Física', 4);
INSERT INTO public.area_conhecimento VALUES (52, 'Agronomia', 5);
INSERT INTO public.area_conhecimento VALUES (53, 'Recursos Florestais e Engenharia Florestal', 5);
INSERT INTO public.area_conhecimento VALUES (54, 'Engenharia Agrícola', 5);
INSERT INTO public.area_conhecimento VALUES (55, 'Zootecnia', 5);
INSERT INTO public.area_conhecimento VALUES (56, 'Medicina Veterinária', 5);
INSERT INTO public.area_conhecimento VALUES (57, 'Recursos Pesqueiros e Engenharia de Pesca', 5);
INSERT INTO public.area_conhecimento VALUES (58, 'Ciência e Tecnologia de Alimentos', 5);
INSERT INTO public.area_conhecimento VALUES (59, 'Direito', 6);
INSERT INTO public.area_conhecimento VALUES (60, 'Administração', 6);
INSERT INTO public.area_conhecimento VALUES (61, 'Economia', 6);
INSERT INTO public.area_conhecimento VALUES (62, 'Arquitetura e Urbanismo', 6);
INSERT INTO public.area_conhecimento VALUES (63, 'Planejamento Urbano e Regional', 6);
INSERT INTO public.area_conhecimento VALUES (64, 'Demografia', 6);
INSERT INTO public.area_conhecimento VALUES (65, 'Ciência da Informação', 6);
INSERT INTO public.area_conhecimento VALUES (66, 'Museologia', 6);
INSERT INTO public.area_conhecimento VALUES (67, 'Comunicação', 6);
INSERT INTO public.area_conhecimento VALUES (68, 'Serviço Social', 6);
INSERT INTO public.area_conhecimento VALUES (69, 'Economia Doméstica', 6);
INSERT INTO public.area_conhecimento VALUES (70, 'Desenho Industrial', 6);
INSERT INTO public.area_conhecimento VALUES (71, 'Turismo', 6);
INSERT INTO public.area_conhecimento VALUES (72, 'Filosofia', 7);
INSERT INTO public.area_conhecimento VALUES (73, 'Sociologia', 7);
INSERT INTO public.area_conhecimento VALUES (74, 'Antropologia', 7);
INSERT INTO public.area_conhecimento VALUES (75, 'Arqueologia', 7);
INSERT INTO public.area_conhecimento VALUES (76, 'História', 7);
INSERT INTO public.area_conhecimento VALUES (77, 'Geografia', 7);
INSERT INTO public.area_conhecimento VALUES (78, 'Psicologia', 7);
INSERT INTO public.area_conhecimento VALUES (79, 'Educação', 7);
INSERT INTO public.area_conhecimento VALUES (80, 'Ciência Política', 7);
INSERT INTO public.area_conhecimento VALUES (81, 'Teologia', 7);
INSERT INTO public.area_conhecimento VALUES (82, 'Linguística', 8);
INSERT INTO public.area_conhecimento VALUES (83, 'Letras', 8);
INSERT INTO public.area_conhecimento VALUES (84, 'Artes', 8);
INSERT INTO public.area_conhecimento VALUES (85, 'Álgebra', 9);
INSERT INTO public.area_conhecimento VALUES (86, 'Análise', 9);
INSERT INTO public.area_conhecimento VALUES (87, 'Geometria e Topologia', 9);
INSERT INTO public.area_conhecimento VALUES (88, 'Matemática Aplicada', 9);
INSERT INTO public.area_conhecimento VALUES (89, 'Probabilidade', 10);
INSERT INTO public.area_conhecimento VALUES (90, 'Estatística', 10);
INSERT INTO public.area_conhecimento VALUES (91, 'Probabilidade e Estatística Aplicadas', 10);
INSERT INTO public.area_conhecimento VALUES (92, 'Teoria da Computação', 11);
INSERT INTO public.area_conhecimento VALUES (93, 'Matemática da Computação', 11);
INSERT INTO public.area_conhecimento VALUES (94, 'Metodologia e Técnicas da Computação', 11);
INSERT INTO public.area_conhecimento VALUES (95, 'Sistemas de Computação', 11);
INSERT INTO public.area_conhecimento VALUES (96, 'Astronomia de Posição e Mecânica Celeste', 12);
INSERT INTO public.area_conhecimento VALUES (97, 'Astrofísica Estelar', 12);
INSERT INTO public.area_conhecimento VALUES (98, 'Astrofísica do Meio Interestelar', 12);
INSERT INTO public.area_conhecimento VALUES (99, 'Astrofísica Extragaláctica', 12);
INSERT INTO public.area_conhecimento VALUES (100, 'Astrofísica do Sistema Solar', 12);
INSERT INTO public.area_conhecimento VALUES (101, 'Instrumentação Astronômica', 12);
INSERT INTO public.area_conhecimento VALUES (102, 'Física Geral', 13);
INSERT INTO public.area_conhecimento VALUES (103, 'Áreas Clássicas de Fenomenologia e suas Aplicações', 13);
INSERT INTO public.area_conhecimento VALUES (104, 'Física das Partículas Elementares e Campos', 13);
INSERT INTO public.area_conhecimento VALUES (105, 'Física Nuclear', 13);
INSERT INTO public.area_conhecimento VALUES (106, 'Física Atômica e Molecular', 13);
INSERT INTO public.area_conhecimento VALUES (107, 'Física dos Fluidos, Física de Plasmas e Descargas Elétricas', 13);
INSERT INTO public.area_conhecimento VALUES (108, 'Física da Matéria Condensada', 13);
INSERT INTO public.area_conhecimento VALUES (109, 'Química Orgânica', 14);
INSERT INTO public.area_conhecimento VALUES (110, 'Química Inorgânica', 14);
INSERT INTO public.area_conhecimento VALUES (111, 'Físico-Química', 14);
INSERT INTO public.area_conhecimento VALUES (112, 'Química Analítica', 14);
INSERT INTO public.area_conhecimento VALUES (113, 'Geologia', 15);
INSERT INTO public.area_conhecimento VALUES (114, 'Geofísica', 15);
INSERT INTO public.area_conhecimento VALUES (115, 'Meteorologia', 15);
INSERT INTO public.area_conhecimento VALUES (116, 'Geodesia', 15);
INSERT INTO public.area_conhecimento VALUES (117, 'Geografia Física', 15);
INSERT INTO public.area_conhecimento VALUES (118, 'Oceanografia Biológica', 16);
INSERT INTO public.area_conhecimento VALUES (119, 'Oceanografia Física', 16);
INSERT INTO public.area_conhecimento VALUES (120, 'Oceanografia Química', 16);
INSERT INTO public.area_conhecimento VALUES (121, 'Oceanografia Geológica', 16);
INSERT INTO public.area_conhecimento VALUES (122, 'Genética Quantitativa', 18);
INSERT INTO public.area_conhecimento VALUES (123, 'Genética Molecular e de Micro-organismos', 18);
INSERT INTO public.area_conhecimento VALUES (124, 'Genética Vegetal', 18);
INSERT INTO public.area_conhecimento VALUES (125, 'Genética Animal', 18);
INSERT INTO public.area_conhecimento VALUES (126, 'Genética Humana e Médica', 18);
INSERT INTO public.area_conhecimento VALUES (127, 'Mutagênese', 18);
INSERT INTO public.area_conhecimento VALUES (128, 'Paleobotânica', 19);
INSERT INTO public.area_conhecimento VALUES (129, 'Morfologia Vegetal', 19);
INSERT INTO public.area_conhecimento VALUES (130, 'Fisiologia Vegetal', 19);
INSERT INTO public.area_conhecimento VALUES (131, 'Taxonomia Vegetal', 19);
INSERT INTO public.area_conhecimento VALUES (132, 'Fitogeografia', 19);
INSERT INTO public.area_conhecimento VALUES (133, 'Botânica Aplicada', 19);
INSERT INTO public.area_conhecimento VALUES (134, 'Paleozoologia', 20);
INSERT INTO public.area_conhecimento VALUES (135, 'Morfologia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento VALUES (136, 'Fisiologia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento VALUES (137, 'Comportamento Animal', 20);
INSERT INTO public.area_conhecimento VALUES (138, 'Taxonomia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento VALUES (139, 'Zoologia Aplicada', 20);
INSERT INTO public.area_conhecimento VALUES (140, 'Ecologia Teórica', 21);
INSERT INTO public.area_conhecimento VALUES (141, 'Ecologia de Ecossistemas', 21);
INSERT INTO public.area_conhecimento VALUES (142, 'Ecologia Aplicada', 21);
INSERT INTO public.area_conhecimento VALUES (143, 'Citologia e Biologia Celular', 22);
INSERT INTO public.area_conhecimento VALUES (144, 'Embriologia', 22);
INSERT INTO public.area_conhecimento VALUES (145, 'Histologia', 22);
INSERT INTO public.area_conhecimento VALUES (146, 'Anatomia', 22);
INSERT INTO public.area_conhecimento VALUES (147, 'Fisiologia Geral', 23);
INSERT INTO public.area_conhecimento VALUES (148, 'Fisiologia de Órgãos e Sistemas', 23);
INSERT INTO public.area_conhecimento VALUES (149, 'Fisiologia do Esforço', 23);
INSERT INTO public.area_conhecimento VALUES (150, 'Fisiologia Comparada', 23);
INSERT INTO public.area_conhecimento VALUES (151, 'Química de Macromoléculas', 24);
INSERT INTO public.area_conhecimento VALUES (152, 'Bioquímica dos Micro-organismos', 24);
INSERT INTO public.area_conhecimento VALUES (153, 'Metabolismo e Bioenergética', 24);
INSERT INTO public.area_conhecimento VALUES (154, 'Biologia Molecular', 24);
INSERT INTO public.area_conhecimento VALUES (155, 'Enzimologia', 24);
INSERT INTO public.area_conhecimento VALUES (156, 'Biofísica Molecular', 25);
INSERT INTO public.area_conhecimento VALUES (157, 'Biofísica Celular', 25);
INSERT INTO public.area_conhecimento VALUES (158, 'Biofísica de Processos e Sistemas', 25);
INSERT INTO public.area_conhecimento VALUES (159, 'Radiologia e Fotobiologia', 25);
INSERT INTO public.area_conhecimento VALUES (160, 'Farmacologia Geral', 26);
INSERT INTO public.area_conhecimento VALUES (161, 'Farmacologia Autonômica', 26);
INSERT INTO public.area_conhecimento VALUES (162, 'Neuropsicofarmacologia', 26);
INSERT INTO public.area_conhecimento VALUES (163, 'Farmacologia Cardiorrenal', 26);
INSERT INTO public.area_conhecimento VALUES (164, 'Farmacologia Bioquímica e Molecular', 26);
INSERT INTO public.area_conhecimento VALUES (165, 'Etnofarmacologia', 26);
INSERT INTO public.area_conhecimento VALUES (166, 'Toxicologia', 26);
INSERT INTO public.area_conhecimento VALUES (167, 'Farmacologia Clínica', 26);
INSERT INTO public.area_conhecimento VALUES (168, 'Imunoquímica', 27);
INSERT INTO public.area_conhecimento VALUES (169, 'Imunologia Celular', 27);
INSERT INTO public.area_conhecimento VALUES (170, 'Imunogenética', 27);
INSERT INTO public.area_conhecimento VALUES (171, 'Imunologia Aplicada', 27);
INSERT INTO public.area_conhecimento VALUES (172, 'Biologia e Fisiologia dos Micro-organismos', 28);
INSERT INTO public.area_conhecimento VALUES (173, 'Microbiologia Aplicada', 28);
INSERT INTO public.area_conhecimento VALUES (174, 'Protozoologia de Parasitos', 29);
INSERT INTO public.area_conhecimento VALUES (175, 'Helmintologia de Parasitos', 29);
INSERT INTO public.area_conhecimento VALUES (176, 'Entomologia e Malacologia de Parasitos e Vetores', 29);
INSERT INTO public.area_conhecimento VALUES (177, 'Construção Civil', 30);
INSERT INTO public.area_conhecimento VALUES (178, 'Estruturas', 30);
INSERT INTO public.area_conhecimento VALUES (179, 'Geotécnica', 30);
INSERT INTO public.area_conhecimento VALUES (180, 'Engenharia Hidráulica', 30);
INSERT INTO public.area_conhecimento VALUES (181, 'Infra-Estrutura de Transportes', 30);
INSERT INTO public.area_conhecimento VALUES (182, 'Pesquisa Mineral', 31);
INSERT INTO public.area_conhecimento VALUES (183, 'Lavra', 31);
INSERT INTO public.area_conhecimento VALUES (184, 'Tratamento de Minérios', 31);
INSERT INTO public.area_conhecimento VALUES (185, 'Instalações e Equipamentos Metalúrgicos', 32);
INSERT INTO public.area_conhecimento VALUES (186, 'Metalurgia Extrativa', 32);
INSERT INTO public.area_conhecimento VALUES (187, 'Metalurgia de Transformação', 32);
INSERT INTO public.area_conhecimento VALUES (188, 'Metalurgia Física', 32);
INSERT INTO public.area_conhecimento VALUES (189, 'Materiais não Metálicos', 32);
INSERT INTO public.area_conhecimento VALUES (190, 'Materiais Elétricos', 33);
INSERT INTO public.area_conhecimento VALUES (191, 'Medidas Elétricas, Magnéticas e Eletrônicas; Instrumentação', 33);
INSERT INTO public.area_conhecimento VALUES (192, 'Circuitos Elétricos, Magnéticos e Eletrônicos', 33);
INSERT INTO public.area_conhecimento VALUES (193, 'Sistemas Elétricos de Potência', 33);
INSERT INTO public.area_conhecimento VALUES (194, 'Eletrônica Industrial, Sistemas e Controles Eletrônicos', 33);
INSERT INTO public.area_conhecimento VALUES (195, 'Telecomunicações', 33);
INSERT INTO public.area_conhecimento VALUES (196, 'Fenômenos de Transporte', 34);
INSERT INTO public.area_conhecimento VALUES (197, 'Engenharia Térmica', 34);
INSERT INTO public.area_conhecimento VALUES (198, 'Mecânica dos Sólidos', 34);
INSERT INTO public.area_conhecimento VALUES (199, 'Projetos de Máquinas', 34);
INSERT INTO public.area_conhecimento VALUES (200, 'Processos de Fabricação', 34);
INSERT INTO public.area_conhecimento VALUES (201, 'Processos Industriais de Engenharia Química', 35);
INSERT INTO public.area_conhecimento VALUES (202, 'Operações Industriais e Equipamentos para Engenharia Química', 35);
INSERT INTO public.area_conhecimento VALUES (203, 'Tecnologia Química', 35);
INSERT INTO public.area_conhecimento VALUES (204, 'Recursos Hídricos', 36);
INSERT INTO public.area_conhecimento VALUES (205, 'Tratamento de Águas de Abastecimento e Residuárias', 36);
INSERT INTO public.area_conhecimento VALUES (206, 'Saneamento Básico', 36);
INSERT INTO public.area_conhecimento VALUES (207, 'Saneamento Ambiental', 36);
INSERT INTO public.area_conhecimento VALUES (208, 'Gerência de Produção', 37);
INSERT INTO public.area_conhecimento VALUES (209, 'Pesquisa Operacional', 37);
INSERT INTO public.area_conhecimento VALUES (210, 'Engenharia do Produto', 37);
INSERT INTO public.area_conhecimento VALUES (211, 'Engenharia Econômica', 37);
INSERT INTO public.area_conhecimento VALUES (212, 'Aplicações de Radioisótopos', 38);
INSERT INTO public.area_conhecimento VALUES (213, 'Fusão Controlada', 38);
INSERT INTO public.area_conhecimento VALUES (214, 'Combustível Nuclear', 38);
INSERT INTO public.area_conhecimento VALUES (215, 'Tecnologia dos Reatores', 38);
INSERT INTO public.area_conhecimento VALUES (216, 'Planejamento de Transportes', 39);
INSERT INTO public.area_conhecimento VALUES (217, 'Veículos e Equipamentos de Controle', 39);
INSERT INTO public.area_conhecimento VALUES (218, 'Operações de Transportes', 39);
INSERT INTO public.area_conhecimento VALUES (219, 'Hidrodinâmica de Navios e Sistemas Oceânicos', 40);
INSERT INTO public.area_conhecimento VALUES (220, 'Estruturas Navais e Oceânicas', 40);
INSERT INTO public.area_conhecimento VALUES (221, 'Máquinas Marítimas', 40);
INSERT INTO public.area_conhecimento VALUES (222, 'Projeto de Navios e de Sistemas Oceânicos', 40);
INSERT INTO public.area_conhecimento VALUES (223, 'Tecnologia de Construção Naval e de Sistemas Oceânicas', 40);
INSERT INTO public.area_conhecimento VALUES (224, 'Aerodinâmica', 41);
INSERT INTO public.area_conhecimento VALUES (225, 'Dinâmica de Vôo', 41);
INSERT INTO public.area_conhecimento VALUES (226, 'Estruturas Aeroespaciais', 41);
INSERT INTO public.area_conhecimento VALUES (227, 'Materiais e Processos para Engenharia Aeronáutica e Aeroespacial', 41);
INSERT INTO public.area_conhecimento VALUES (228, 'Propulsão Aeroespacial', 41);
INSERT INTO public.area_conhecimento VALUES (229, 'Sistemas Aeroespaciais', 41);
INSERT INTO public.area_conhecimento VALUES (230, 'Bioengenharia', 42);
INSERT INTO public.area_conhecimento VALUES (231, 'Engenharia Médica', 42);
INSERT INTO public.area_conhecimento VALUES (232, 'Clínica Médica', 43);
INSERT INTO public.area_conhecimento VALUES (233, 'Cirurgia', 43);
INSERT INTO public.area_conhecimento VALUES (234, 'Saúde Materno-Infantil', 43);
INSERT INTO public.area_conhecimento VALUES (235, 'Psiquiatria', 43);
INSERT INTO public.area_conhecimento VALUES (236, 'Anatomia Patológica e Patologia Clínica', 43);
INSERT INTO public.area_conhecimento VALUES (237, 'Radiologia Médica', 43);
INSERT INTO public.area_conhecimento VALUES (238, 'Medicina Legal e Deontologia', 43);
INSERT INTO public.area_conhecimento VALUES (239, 'Clínica Odontológica', 44);
INSERT INTO public.area_conhecimento VALUES (240, 'Cirurgia Buco-Maxilo-Facial', 44);
INSERT INTO public.area_conhecimento VALUES (241, 'Ortodontia', 44);
INSERT INTO public.area_conhecimento VALUES (242, 'Odontopediatria', 44);
INSERT INTO public.area_conhecimento VALUES (243, 'Periodontia', 44);
INSERT INTO public.area_conhecimento VALUES (244, 'Endodontia', 44);
INSERT INTO public.area_conhecimento VALUES (245, 'Radiologia Odontológica', 44);
INSERT INTO public.area_conhecimento VALUES (246, 'Odontologia Social e Preventiva', 44);
INSERT INTO public.area_conhecimento VALUES (247, 'Materiais Odontológicos', 44);
INSERT INTO public.area_conhecimento VALUES (248, 'Farmacotecnia', 45);
INSERT INTO public.area_conhecimento VALUES (249, 'Farmacognosia', 45);
INSERT INTO public.area_conhecimento VALUES (250, 'Análise Toxicológica', 45);
INSERT INTO public.area_conhecimento VALUES (251, 'Análise e Controle e Medicamentos', 45);
INSERT INTO public.area_conhecimento VALUES (252, 'Bromatologia', 45);
INSERT INTO public.area_conhecimento VALUES (253, 'Enfermagem Médico-Cirúrgica', 46);
INSERT INTO public.area_conhecimento VALUES (254, 'Enfermagem Obstétrica', 46);
INSERT INTO public.area_conhecimento VALUES (255, 'Enfermagem Pediátrica', 46);
INSERT INTO public.area_conhecimento VALUES (256, 'Enfermagem Psiquiátrica', 46);
INSERT INTO public.area_conhecimento VALUES (257, 'Enfermagem de Doenças Contagiosas', 46);
INSERT INTO public.area_conhecimento VALUES (258, 'Enfermagem de Saúde Pública', 46);
INSERT INTO public.area_conhecimento VALUES (259, 'Bioquímica da Nutrição', 47);
INSERT INTO public.area_conhecimento VALUES (260, 'Dietética', 47);
INSERT INTO public.area_conhecimento VALUES (261, 'Análise Nutricional de População', 47);
INSERT INTO public.area_conhecimento VALUES (262, 'Desnutrição e Desenvolvimento Fisiológico', 47);
INSERT INTO public.area_conhecimento VALUES (263, 'Epidemiologia', 48);
INSERT INTO public.area_conhecimento VALUES (264, 'Saúde Publica', 48);
INSERT INTO public.area_conhecimento VALUES (265, 'Medicina Preventiva', 48);
INSERT INTO public.area_conhecimento VALUES (266, 'Ciência do Solo', 52);
INSERT INTO public.area_conhecimento VALUES (267, 'Fitossanidade', 52);
INSERT INTO public.area_conhecimento VALUES (268, 'Fitotecnia', 52);
INSERT INTO public.area_conhecimento VALUES (269, 'Floricultura, Parques e Jardins', 52);
INSERT INTO public.area_conhecimento VALUES (270, 'Agrometeorologia', 52);
INSERT INTO public.area_conhecimento VALUES (271, 'Extensão Rural', 52);
INSERT INTO public.area_conhecimento VALUES (272, 'Silvicultura', 53);
INSERT INTO public.area_conhecimento VALUES (273, 'Manejo Florestal', 53);
INSERT INTO public.area_conhecimento VALUES (274, 'Técnicas e Operações Florestais', 53);
INSERT INTO public.area_conhecimento VALUES (275, 'Tecnologia e Utilização de Produtos Florestais', 53);
INSERT INTO public.area_conhecimento VALUES (276, 'Conservação da Natureza', 53);
INSERT INTO public.area_conhecimento VALUES (277, 'Energia de Biomassa Florestal', 53);
INSERT INTO public.area_conhecimento VALUES (278, 'Máquinas e Implementos Agrícolas', 54);
INSERT INTO public.area_conhecimento VALUES (279, 'Engenharia de Água e Solo', 54);
INSERT INTO public.area_conhecimento VALUES (280, 'Engenharia de Processamento de Produtos Agrícolas', 54);
INSERT INTO public.area_conhecimento VALUES (281, 'Construções Rurais e Ambiência', 54);
INSERT INTO public.area_conhecimento VALUES (282, 'Energização Rural', 54);
INSERT INTO public.area_conhecimento VALUES (283, 'Ecologia dos Animais Domésticos e Etologia', 55);
INSERT INTO public.area_conhecimento VALUES (284, 'Genética e Melhoramento dos Animais Domésticos', 55);
INSERT INTO public.area_conhecimento VALUES (285, 'Nutrição e Alimentação Animal', 55);
INSERT INTO public.area_conhecimento VALUES (286, 'Pastagem e Forragicultura', 55);
INSERT INTO public.area_conhecimento VALUES (287, 'Produção Animal', 55);
INSERT INTO public.area_conhecimento VALUES (288, 'Clínica e Cirurgia Animal', 56);
INSERT INTO public.area_conhecimento VALUES (289, 'Medicina Veterinária Preventiva', 56);
INSERT INTO public.area_conhecimento VALUES (290, 'Patologia Animal', 56);
INSERT INTO public.area_conhecimento VALUES (291, 'Reprodução Animal', 56);
INSERT INTO public.area_conhecimento VALUES (292, 'Inspeção de Produtos de Origem Animal', 56);
INSERT INTO public.area_conhecimento VALUES (293, 'Recursos Pesqueiros Marinhos', 57);
INSERT INTO public.area_conhecimento VALUES (294, 'Recursos Pesqueiros de Águas Interiores', 57);
INSERT INTO public.area_conhecimento VALUES (295, 'Aquicultura', 57);
INSERT INTO public.area_conhecimento VALUES (296, 'Engenharia de Pesca', 57);
INSERT INTO public.area_conhecimento VALUES (297, 'Ciência de Alimentos', 58);
INSERT INTO public.area_conhecimento VALUES (298, 'Tecnologia de Alimentos', 58);
INSERT INTO public.area_conhecimento VALUES (299, 'Engenharia de Alimentos', 58);
INSERT INTO public.area_conhecimento VALUES (300, 'Teoria do Direito', 59);
INSERT INTO public.area_conhecimento VALUES (301, 'Direito Público', 59);
INSERT INTO public.area_conhecimento VALUES (302, 'Direito Privado', 59);
INSERT INTO public.area_conhecimento VALUES (303, 'Direitos Especiais', 59);
INSERT INTO public.area_conhecimento VALUES (304, 'Administração de Empresas', 60);
INSERT INTO public.area_conhecimento VALUES (305, 'Administração Pública', 60);
INSERT INTO public.area_conhecimento VALUES (306, 'Administração de Setores Específicos', 60);
INSERT INTO public.area_conhecimento VALUES (307, 'Ciências Contábeis', 60);
INSERT INTO public.area_conhecimento VALUES (308, 'Teoria Econômica', 61);
INSERT INTO public.area_conhecimento VALUES (309, 'Métodos Quantitativos em Economia', 61);
INSERT INTO public.area_conhecimento VALUES (310, 'Economia Monetária e Fiscal', 61);
INSERT INTO public.area_conhecimento VALUES (311, 'Crescimento, Flutuações e Planejamento Econômico', 61);
INSERT INTO public.area_conhecimento VALUES (312, 'Economia Internacional', 61);
INSERT INTO public.area_conhecimento VALUES (313, 'Economia dos Recursos Humanos', 61);
INSERT INTO public.area_conhecimento VALUES (314, 'Economia Industrial', 61);
INSERT INTO public.area_conhecimento VALUES (315, 'Economia do Bem-Estar Social', 61);
INSERT INTO public.area_conhecimento VALUES (316, 'Economia Regional e Urbana', 61);
INSERT INTO public.area_conhecimento VALUES (317, 'Economias Agrária e dos Recursos Naturais', 61);
INSERT INTO public.area_conhecimento VALUES (318, 'Fundamentos de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento VALUES (319, 'Projeto de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento VALUES (320, 'Tecnologia de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento VALUES (321, 'Paisagismo', 62);
INSERT INTO public.area_conhecimento VALUES (322, 'Fundamentos do Planejamento Urbano e Regional', 63);
INSERT INTO public.area_conhecimento VALUES (323, 'Métodos e Técnicas do Planejamento Urbano e Regional', 63);
INSERT INTO public.area_conhecimento VALUES (324, 'Serviços Urbanos e Regionais', 63);
INSERT INTO public.area_conhecimento VALUES (325, 'Distribuição Espacial', 64);
INSERT INTO public.area_conhecimento VALUES (326, 'Tendência Populacional', 64);
INSERT INTO public.area_conhecimento VALUES (327, 'Componentes da Dinâmica Demográfica', 64);
INSERT INTO public.area_conhecimento VALUES (328, 'Nupcialidade e Família', 64);
INSERT INTO public.area_conhecimento VALUES (329, 'Demografia Histórica', 64);
INSERT INTO public.area_conhecimento VALUES (330, 'Política Pública e População', 64);
INSERT INTO public.area_conhecimento VALUES (331, 'Fontes de Dados Demográficos', 64);
INSERT INTO public.area_conhecimento VALUES (332, 'Teoria da Informação', 65);
INSERT INTO public.area_conhecimento VALUES (333, 'Biblioteconomia', 65);
INSERT INTO public.area_conhecimento VALUES (334, 'Arquivologia', 65);
INSERT INTO public.area_conhecimento VALUES (335, 'Teoria da Comunicação', 67);
INSERT INTO public.area_conhecimento VALUES (336, 'Jornalismo e Editoração', 67);
INSERT INTO public.area_conhecimento VALUES (337, 'Rádio e Televisão', 67);
INSERT INTO public.area_conhecimento VALUES (338, 'Relações Públicas e Propaganda', 67);
INSERT INTO public.area_conhecimento VALUES (339, 'Comunicação Visual', 67);
INSERT INTO public.area_conhecimento VALUES (340, 'Fundamentos do Serviço Social', 68);
INSERT INTO public.area_conhecimento VALUES (341, 'Serviço Social Aplicado', 68);
INSERT INTO public.area_conhecimento VALUES (342, 'Programação Visual', 70);
INSERT INTO public.area_conhecimento VALUES (343, 'Desenho de Produto', 70);
INSERT INTO public.area_conhecimento VALUES (344, 'História da Filosofia', 72);
INSERT INTO public.area_conhecimento VALUES (345, 'Metafísica', 72);
INSERT INTO public.area_conhecimento VALUES (346, 'Lógica', 72);
INSERT INTO public.area_conhecimento VALUES (347, 'Ética', 72);
INSERT INTO public.area_conhecimento VALUES (348, 'Epistemologia', 72);
INSERT INTO public.area_conhecimento VALUES (349, 'Filosofia Brasileira', 72);
INSERT INTO public.area_conhecimento VALUES (350, 'Fundamentos da Sociologia', 73);
INSERT INTO public.area_conhecimento VALUES (351, 'Sociologia do Conhecimento', 73);
INSERT INTO public.area_conhecimento VALUES (352, 'Sociologia do Desenvolvimento', 73);
INSERT INTO public.area_conhecimento VALUES (353, 'Sociologia Urbana', 73);
INSERT INTO public.area_conhecimento VALUES (354, 'Sociologia Rural', 73);
INSERT INTO public.area_conhecimento VALUES (355, 'Sociologia da Saúde', 73);
INSERT INTO public.area_conhecimento VALUES (356, 'Outras Sociologias Específicas', 73);
INSERT INTO public.area_conhecimento VALUES (357, 'Teoria Antropológica', 74);
INSERT INTO public.area_conhecimento VALUES (358, 'Etnologia Indígena', 74);
INSERT INTO public.area_conhecimento VALUES (359, 'Antropologia Urbana', 74);
INSERT INTO public.area_conhecimento VALUES (360, 'Antropologia Rural', 74);
INSERT INTO public.area_conhecimento VALUES (361, 'Antropologia das Populações Afro-Brasileiras', 74);
INSERT INTO public.area_conhecimento VALUES (362, 'Teoria e Método em Arqueologia', 75);
INSERT INTO public.area_conhecimento VALUES (363, 'Arqueologia Pré-Histórica', 75);
INSERT INTO public.area_conhecimento VALUES (364, 'Arqueologia Histórica', 75);
INSERT INTO public.area_conhecimento VALUES (365, 'Teoria e Filosofia da História', 76);
INSERT INTO public.area_conhecimento VALUES (366, 'História Antiga e Medieval', 76);
INSERT INTO public.area_conhecimento VALUES (367, 'História Moderna e Contemporânea', 76);
INSERT INTO public.area_conhecimento VALUES (368, 'História da América', 76);
INSERT INTO public.area_conhecimento VALUES (369, 'História do Brasil', 76);
INSERT INTO public.area_conhecimento VALUES (370, 'História das Ciências', 76);
INSERT INTO public.area_conhecimento VALUES (371, 'Geografia Humana', 77);
INSERT INTO public.area_conhecimento VALUES (372, 'Geografia Regional', 77);
INSERT INTO public.area_conhecimento VALUES (373, 'Fundamentos e Medidas da Psicologia', 78);
INSERT INTO public.area_conhecimento VALUES (374, 'Psicologia Experimental', 78);
INSERT INTO public.area_conhecimento VALUES (375, 'Psicologia Fisiológica', 78);
INSERT INTO public.area_conhecimento VALUES (376, 'Psicologia Comparativa', 78);
INSERT INTO public.area_conhecimento VALUES (377, 'Psicologia Social', 78);
INSERT INTO public.area_conhecimento VALUES (378, 'Psicologia Cognitiva', 78);
INSERT INTO public.area_conhecimento VALUES (379, 'Psicologia do Desenvolvimento Humano', 78);
INSERT INTO public.area_conhecimento VALUES (380, 'Psicologia do Ensino e da Aprendizagem', 78);
INSERT INTO public.area_conhecimento VALUES (381, 'Psicologia do Trabalho e Organizacional', 78);
INSERT INTO public.area_conhecimento VALUES (382, 'Tratamento e Prevenção Psicológica', 78);
INSERT INTO public.area_conhecimento VALUES (383, 'Fundamentos da Educação', 79);
INSERT INTO public.area_conhecimento VALUES (384, 'Administração Educacional', 79);
INSERT INTO public.area_conhecimento VALUES (385, 'Planejamento e Avaliação Educacional', 79);
INSERT INTO public.area_conhecimento VALUES (386, 'Ensino-Aprendizagem', 79);
INSERT INTO public.area_conhecimento VALUES (387, 'Currículo', 79);
INSERT INTO public.area_conhecimento VALUES (388, 'Orientação e Aconselhamento', 79);
INSERT INTO public.area_conhecimento VALUES (389, 'Tópicos Específicos de Educação', 79);
INSERT INTO public.area_conhecimento VALUES (390, 'Teoria Política', 80);
INSERT INTO public.area_conhecimento VALUES (391, 'Estado e Governo', 80);
INSERT INTO public.area_conhecimento VALUES (392, 'Comportamento Político', 80);
INSERT INTO public.area_conhecimento VALUES (393, 'Políticas Públicas', 80);
INSERT INTO public.area_conhecimento VALUES (394, 'Política Internacional', 80);
INSERT INTO public.area_conhecimento VALUES (395, 'História da Teologia', 81);
INSERT INTO public.area_conhecimento VALUES (396, 'Teologia Moral', 81);
INSERT INTO public.area_conhecimento VALUES (397, 'Teologia Sistemática', 81);
INSERT INTO public.area_conhecimento VALUES (398, 'Teologia Pastoral', 81);
INSERT INTO public.area_conhecimento VALUES (399, 'Teoria e Análise Linguística', 82);
INSERT INTO public.area_conhecimento VALUES (400, 'Fisiologia da Linguagem', 82);
INSERT INTO public.area_conhecimento VALUES (401, 'Linguística Histórica', 82);
INSERT INTO public.area_conhecimento VALUES (402, 'Sociolinguística e Dialetologia', 82);
INSERT INTO public.area_conhecimento VALUES (403, 'Psicolinguística', 82);
INSERT INTO public.area_conhecimento VALUES (404, 'Linguística Aplicada', 82);
INSERT INTO public.area_conhecimento VALUES (405, 'Língua Portuguesa', 83);
INSERT INTO public.area_conhecimento VALUES (406, 'Línguas Estrangeiras Modernas', 83);
INSERT INTO public.area_conhecimento VALUES (407, 'Línguas Clássicas', 83);
INSERT INTO public.area_conhecimento VALUES (408, 'Línguas Indígenas', 83);
INSERT INTO public.area_conhecimento VALUES (409, 'Teoria Literária', 83);
INSERT INTO public.area_conhecimento VALUES (410, 'Literatura Brasileira', 83);
INSERT INTO public.area_conhecimento VALUES (411, 'Outras Literaturas Vernáculas', 83);
INSERT INTO public.area_conhecimento VALUES (412, 'Literaturas Estrangeiras Modernas', 83);
INSERT INTO public.area_conhecimento VALUES (413, 'Literaturas Clássicas', 83);
INSERT INTO public.area_conhecimento VALUES (414, 'Literatura Comparada', 83);
INSERT INTO public.area_conhecimento VALUES (415, 'Fundamentos e Crítica das Artes', 84);
INSERT INTO public.area_conhecimento VALUES (416, 'Artes Plásticas', 84);
INSERT INTO public.area_conhecimento VALUES (417, 'Música', 84);
INSERT INTO public.area_conhecimento VALUES (418, 'Dança', 84);
INSERT INTO public.area_conhecimento VALUES (419, 'Teatro', 84);
INSERT INTO public.area_conhecimento VALUES (420, 'Ópera', 84);
INSERT INTO public.area_conhecimento VALUES (421, 'Fotografia', 84);
INSERT INTO public.area_conhecimento VALUES (422, 'Cinema', 84);
INSERT INTO public.area_conhecimento VALUES (423, 'Artes do Vídeo', 84);
INSERT INTO public.area_conhecimento VALUES (424, 'Educação Artística', 84);
INSERT INTO public.area_conhecimento VALUES (425, 'Conjuntos', 85);
INSERT INTO public.area_conhecimento VALUES (426, 'Lógica Matemática', 85);
INSERT INTO public.area_conhecimento VALUES (427, 'Teoria dos Números', 85);
INSERT INTO public.area_conhecimento VALUES (428, 'Grupos de Algebra Não-Comutativa', 85);
INSERT INTO public.area_conhecimento VALUES (429, 'Algebra Comutativa', 85);
INSERT INTO public.area_conhecimento VALUES (430, 'Geometria Algébrica', 85);
INSERT INTO public.area_conhecimento VALUES (431, 'Análise Complexa', 86);
INSERT INTO public.area_conhecimento VALUES (432, 'Análise Funcional', 86);
INSERT INTO public.area_conhecimento VALUES (433, 'Análise Funcional Não-Linear', 86);
INSERT INTO public.area_conhecimento VALUES (434, 'Equações Diferenciais Ordinárias', 86);
INSERT INTO public.area_conhecimento VALUES (435, 'Equações Diferenciais Parciais', 86);
INSERT INTO public.area_conhecimento VALUES (436, 'Equações Diferenciais Funcionais', 86);
INSERT INTO public.area_conhecimento VALUES (437, 'Geometria Diferencial', 87);
INSERT INTO public.area_conhecimento VALUES (438, 'Topologia Algébrica', 87);
INSERT INTO public.area_conhecimento VALUES (439, 'Topologia das Variedades', 87);
INSERT INTO public.area_conhecimento VALUES (440, 'Sistemas Dinâmicos', 87);
INSERT INTO public.area_conhecimento VALUES (441, 'Teoria das Singularidades e Teoria das Catástrofes', 87);
INSERT INTO public.area_conhecimento VALUES (442, 'Teoria das Folheações', 87);
INSERT INTO public.area_conhecimento VALUES (443, 'Física Matemática', 88);
INSERT INTO public.area_conhecimento VALUES (444, 'Análise Numérica', 88);
INSERT INTO public.area_conhecimento VALUES (445, 'Matemática Discreta e Combinatória', 88);
INSERT INTO public.area_conhecimento VALUES (446, 'Teoria Geral e Fundamentos da Probabilidade', 89);
INSERT INTO public.area_conhecimento VALUES (447, 'Teoria Geral e Processos Estocásticos', 89);
INSERT INTO public.area_conhecimento VALUES (448, 'Teoremas de Limite', 89);
INSERT INTO public.area_conhecimento VALUES (449, 'Processos Markovianos', 89);
INSERT INTO public.area_conhecimento VALUES (450, 'Análise Estocástica', 89);
INSERT INTO public.area_conhecimento VALUES (451, 'Processos Estocásticos Especiais', 89);
INSERT INTO public.area_conhecimento VALUES (452, 'Fundamentos da Estatística', 90);
INSERT INTO public.area_conhecimento VALUES (453, 'Inferência Paramétrica', 90);
INSERT INTO public.area_conhecimento VALUES (454, 'Inferência Nao-Paramétrica', 90);
INSERT INTO public.area_conhecimento VALUES (455, 'Inferência em Processos Estocásticos', 90);
INSERT INTO public.area_conhecimento VALUES (456, 'Análise Multivariada', 90);
INSERT INTO public.area_conhecimento VALUES (457, 'Regressão e Correlação', 90);
INSERT INTO public.area_conhecimento VALUES (458, 'Planejamento de Experimentos', 90);
INSERT INTO public.area_conhecimento VALUES (459, 'Análise de Dados', 90);
INSERT INTO public.area_conhecimento VALUES (460, 'Computabilidade e Modelos de Computação', 92);
INSERT INTO public.area_conhecimento VALUES (461, 'Linguagem Formais e Autômatos', 92);
INSERT INTO public.area_conhecimento VALUES (462, 'Análise de Algoritmos e Complexidade de Computação', 92);
INSERT INTO public.area_conhecimento VALUES (463, 'Lógicas e Semântica de Programas', 92);
INSERT INTO public.area_conhecimento VALUES (464, 'Matemática Simbólica', 93);
INSERT INTO public.area_conhecimento VALUES (465, 'Modelos Analíticos e de Simulação', 93);
INSERT INTO public.area_conhecimento VALUES (466, 'Linguagens de Programação', 94);
INSERT INTO public.area_conhecimento VALUES (467, 'Engenharia de Software', 94);
INSERT INTO public.area_conhecimento VALUES (468, 'Banco de Dados', 94);
INSERT INTO public.area_conhecimento VALUES (469, 'Sistemas de Informação', 94);
INSERT INTO public.area_conhecimento VALUES (470, 'Processamento Gráfico (Graphics)', 94);
INSERT INTO public.area_conhecimento VALUES (471, 'Hardware', 95);
INSERT INTO public.area_conhecimento VALUES (472, 'Arquitetura de Sistemas de Computação', 95);
INSERT INTO public.area_conhecimento VALUES (473, 'Software Básico', 95);
INSERT INTO public.area_conhecimento VALUES (474, 'Teleinformática', 95);
INSERT INTO public.area_conhecimento VALUES (475, 'Astronomia Fundamental', 96);
INSERT INTO public.area_conhecimento VALUES (476, 'Astronomia Dinâmica', 96);
INSERT INTO public.area_conhecimento VALUES (477, 'Meio Interestelar', 98);
INSERT INTO public.area_conhecimento VALUES (478, 'Nebulosa', 98);
INSERT INTO public.area_conhecimento VALUES (479, 'Galáxias', 99);
INSERT INTO public.area_conhecimento VALUES (480, 'Aglomerados de Galáxias', 99);
INSERT INTO public.area_conhecimento VALUES (481, 'Quasares', 99);
INSERT INTO public.area_conhecimento VALUES (482, 'Cosmologia', 99);
INSERT INTO public.area_conhecimento VALUES (483, 'Física Solar', 100);
INSERT INTO public.area_conhecimento VALUES (484, 'Movimento da Terra', 100);
INSERT INTO public.area_conhecimento VALUES (485, 'Sistema Planetário', 100);
INSERT INTO public.area_conhecimento VALUES (486, 'Astronomia Ótica', 101);
INSERT INTO public.area_conhecimento VALUES (487, 'Radioastronomia', 101);
INSERT INTO public.area_conhecimento VALUES (488, 'Astronomia Espacial', 101);
INSERT INTO public.area_conhecimento VALUES (489, 'Processamento de Dados Astronômicos', 101);
INSERT INTO public.area_conhecimento VALUES (490, 'Métodos Matemáticos da Física', 102);
INSERT INTO public.area_conhecimento VALUES (491, 'Física Clássica e Física Quântica; Mecânica e Campos', 102);
INSERT INTO public.area_conhecimento VALUES (492, 'Relatividade e Gravitação', 102);
INSERT INTO public.area_conhecimento VALUES (493, 'Física Estatística e Termodinâmica', 102);
INSERT INTO public.area_conhecimento VALUES (494, 'Metrologia, Técnicas Gerais de Laboratório, Sistema de Instrumentação', 102);
INSERT INTO public.area_conhecimento VALUES (495, 'Instrumentação Específica de Uso Geral em Física', 102);
INSERT INTO public.area_conhecimento VALUES (496, 'Eletricidade e Magnetismo; Campos e Partículas Carregadas', 103);
INSERT INTO public.area_conhecimento VALUES (497, 'Ótica', 103);
INSERT INTO public.area_conhecimento VALUES (498, 'Acústica', 103);
INSERT INTO public.area_conhecimento VALUES (499, 'Transferência de Calor; Processos Térmicos e Termodinâmicos', 103);
INSERT INTO public.area_conhecimento VALUES (500, 'Mecânica, Elasticidade e Reologia', 103);
INSERT INTO public.area_conhecimento VALUES (501, 'Dinâmica dos Fluidos', 103);
INSERT INTO public.area_conhecimento VALUES (502, 'Teoria Geral de Partículas e Campos', 104);
INSERT INTO public.area_conhecimento VALUES (503, 'Teorias Específicas e Modelos de Interação; Sistemática de Partículas; Raios Cósmicos', 104);
INSERT INTO public.area_conhecimento VALUES (504, 'Reações Específicas e Fenomenologia de Partículas', 104);
INSERT INTO public.area_conhecimento VALUES (505, 'Propriedades de Partículas Específicas e Ressonâncias', 104);
INSERT INTO public.area_conhecimento VALUES (506, 'Estrutura Nuclear', 105);
INSERT INTO public.area_conhecimento VALUES (507, 'Desintegração Nuclear e Radioatividade', 105);
INSERT INTO public.area_conhecimento VALUES (508, 'Reações Nucleares e Espalhamento Geral', 105);
INSERT INTO public.area_conhecimento VALUES (509, 'Reações Nucleares e Espalhamento (Reações Específicas)', 105);
INSERT INTO public.area_conhecimento VALUES (510, 'Propriedades de Núcleos Específicos', 105);
INSERT INTO public.area_conhecimento VALUES (511, 'Métodos Experimentais e Instrumentação para Partículas Elementares e Física Nuclear', 105);
INSERT INTO public.area_conhecimento VALUES (512, 'Estrutura Eletrônica de Átomos e Moléculas; Teoria', 106);
INSERT INTO public.area_conhecimento VALUES (513, 'Espectros Atômicos e Integração de Fótons', 106);
INSERT INTO public.area_conhecimento VALUES (514, 'Espectros Moleculares e Interações de Fótons com Moléculas', 106);
INSERT INTO public.area_conhecimento VALUES (515, 'Processos de Colisão e Interações de Átomos e Moléculas', 106);
INSERT INTO public.area_conhecimento VALUES (516, 'Inf.Sobre Átomos e Moléculas Obtidos Experimentalmente;Instrumentação e Técnicas', 106);
INSERT INTO public.area_conhecimento VALUES (517, 'Estudos de Átomos e Moléculas Especiais', 106);
INSERT INTO public.area_conhecimento VALUES (518, 'Cinética e Teoria de Transporte de Fluidos; Propriedades Físicas de Gases', 107);
INSERT INTO public.area_conhecimento VALUES (519, 'Física de Plasmas e Descargas Elétricas', 107);
INSERT INTO public.area_conhecimento VALUES (520, 'Estrutura de Líquidos e Sólidos; Cristalografia', 108);
INSERT INTO public.area_conhecimento VALUES (521, 'Propriedades Mecânicas e Acústicas da Matéria Condensada', 108);
INSERT INTO public.area_conhecimento VALUES (522, 'Dinâmica da Rede e Estatística de Cristais', 108);
INSERT INTO public.area_conhecimento VALUES (523, 'Equação de Estado, Equilíbrio de Fases e Transições de Fase', 108);
INSERT INTO public.area_conhecimento VALUES (524, 'Propriedades Térmicas da Matéria Condensada', 108);
INSERT INTO public.area_conhecimento VALUES (525, 'Propriedades de Transportes de Matéria Condensada (Não Eletrônicas)', 108);
INSERT INTO public.area_conhecimento VALUES (526, 'Campos Quânticos e Sólidos, Hélio, Líquido, Sólido', 108);
INSERT INTO public.area_conhecimento VALUES (527, 'Superfícies e Interfaces; Películas e Filamentos', 108);
INSERT INTO public.area_conhecimento VALUES (528, 'Estados Eletrônicos', 108);
INSERT INTO public.area_conhecimento VALUES (529, 'Transp.Eletrônicos e Prop. Elétricas de Superfícies; Interfaces e Películas', 108);
INSERT INTO public.area_conhecimento VALUES (530, 'Estruturas Eletrônicas e Propriedades Elétricas de Superfícies Interfaces e Películas', 108);
INSERT INTO public.area_conhecimento VALUES (531, 'Supercondutividade', 108);
INSERT INTO public.area_conhecimento VALUES (532, 'Materiais Magnéticos e Propriedades Magnéticas', 108);
INSERT INTO public.area_conhecimento VALUES (533, 'Ressonância Mag.e Relax.Na Mat.Condens;Efeitos Mosbauer;Corr.Ang.Pertubada', 108);
INSERT INTO public.area_conhecimento VALUES (534, 'Materiais Dielétricos e Propriedades Dielétricas', 108);
INSERT INTO public.area_conhecimento VALUES (535, 'Prop.Óticas e Espectrosc.da Mat.Condens;Outras Inter.da Mat.Com Rad.e Part.', 108);
INSERT INTO public.area_conhecimento VALUES (536, 'Emissão Eletrônica e Iônica por Líquidos e Sólidos; Fenômenos de Impacto', 108);
INSERT INTO public.area_conhecimento VALUES (537, 'Estrutura, Conformação e Estereoquímica', 109);
INSERT INTO public.area_conhecimento VALUES (538, 'Síntese Orgânica', 109);
INSERT INTO public.area_conhecimento VALUES (539, 'Físico-Química Orgânica', 109);
INSERT INTO public.area_conhecimento VALUES (540, 'Fotoquímica Orgânica', 109);
INSERT INTO public.area_conhecimento VALUES (541, 'Química dos Produtos Naturais', 109);
INSERT INTO public.area_conhecimento VALUES (542, 'Evolução, Sistemática e Ecologia Química', 109);
INSERT INTO public.area_conhecimento VALUES (543, 'Polímeros e Coloides', 109);
INSERT INTO public.area_conhecimento VALUES (544, 'Campos de Coordenação', 110);
INSERT INTO public.area_conhecimento VALUES (545, 'Não-Metais e Seus Compostos', 110);
INSERT INTO public.area_conhecimento VALUES (546, 'Compostos Organo-Metálicos', 110);
INSERT INTO public.area_conhecimento VALUES (547, 'Determinação de Estrutura de Compostos Inorgânicos', 110);
INSERT INTO public.area_conhecimento VALUES (548, 'Foto-Química Inorgânica', 110);
INSERT INTO public.area_conhecimento VALUES (549, 'Físico Química Inorgânica', 110);
INSERT INTO public.area_conhecimento VALUES (550, 'Química Bio-Inorgânica', 110);
INSERT INTO public.area_conhecimento VALUES (551, 'Cinética Química e Catálise', 111);
INSERT INTO public.area_conhecimento VALUES (552, 'Eletroquímica', 111);
INSERT INTO public.area_conhecimento VALUES (553, 'Espectroscopia', 111);
INSERT INTO public.area_conhecimento VALUES (554, 'Química de Interfaces', 111);
INSERT INTO public.area_conhecimento VALUES (555, 'Química do Estado Condensado', 111);
INSERT INTO public.area_conhecimento VALUES (556, 'Química Nuclear e Radioquímica', 111);
INSERT INTO public.area_conhecimento VALUES (557, 'Química Teórica', 111);
INSERT INTO public.area_conhecimento VALUES (558, 'Termodinâmica Química', 111);
INSERT INTO public.area_conhecimento VALUES (559, 'Separação', 112);
INSERT INTO public.area_conhecimento VALUES (560, 'Métodos Óticos de Análise', 112);
INSERT INTO public.area_conhecimento VALUES (561, 'Eletroanalítica', 112);
INSERT INTO public.area_conhecimento VALUES (562, 'Gravimetria', 112);
INSERT INTO public.area_conhecimento VALUES (563, 'Titimetria', 112);
INSERT INTO public.area_conhecimento VALUES (564, 'Instrumentação Analítica', 112);
INSERT INTO public.area_conhecimento VALUES (565, 'Análise de Traços e Química Ambiental', 112);
INSERT INTO public.area_conhecimento VALUES (566, 'Mineralogia', 113);
INSERT INTO public.area_conhecimento VALUES (567, 'Petrologia', 113);
INSERT INTO public.area_conhecimento VALUES (568, 'Geoquímica', 113);
INSERT INTO public.area_conhecimento VALUES (569, 'Geologia Regional', 113);
INSERT INTO public.area_conhecimento VALUES (570, 'Geotectônica', 113);
INSERT INTO public.area_conhecimento VALUES (571, 'Geocronologia', 113);
INSERT INTO public.area_conhecimento VALUES (572, 'Cartografia Geológica', 113);
INSERT INTO public.area_conhecimento VALUES (573, 'Metalogenia', 113);
INSERT INTO public.area_conhecimento VALUES (574, 'Hidrogeologia', 113);
INSERT INTO public.area_conhecimento VALUES (575, 'Prospecção Mineral', 113);
INSERT INTO public.area_conhecimento VALUES (576, 'Sedimentologia', 113);
INSERT INTO public.area_conhecimento VALUES (577, 'Paleontologia Estratigráfica', 113);
INSERT INTO public.area_conhecimento VALUES (578, 'Estratigrafia', 113);
INSERT INTO public.area_conhecimento VALUES (579, 'Geologia Ambiental', 113);
INSERT INTO public.area_conhecimento VALUES (580, 'Geomagnetismo', 114);
INSERT INTO public.area_conhecimento VALUES (581, 'Sismologia', 114);
INSERT INTO public.area_conhecimento VALUES (582, 'Geotermia e Fluxo Térmico', 114);
INSERT INTO public.area_conhecimento VALUES (583, 'Propriedades Físicas das Rochas', 114);
INSERT INTO public.area_conhecimento VALUES (584, 'Geofísica Nuclear', 114);
INSERT INTO public.area_conhecimento VALUES (585, 'Sensoriamento Remoto', 114);
INSERT INTO public.area_conhecimento VALUES (586, 'Aeronomia', 114);
INSERT INTO public.area_conhecimento VALUES (587, 'Desenvolvimento de Instrumentação Geofísica', 114);
INSERT INTO public.area_conhecimento VALUES (588, 'Geofísica Aplicada', 114);
INSERT INTO public.area_conhecimento VALUES (589, 'Gravimetria', 114);
INSERT INTO public.area_conhecimento VALUES (590, 'Meteorologia Dinâmica', 115);
INSERT INTO public.area_conhecimento VALUES (591, 'Meteorologia Sinótica', 115);
INSERT INTO public.area_conhecimento VALUES (592, 'Meteorologia Física', 115);
INSERT INTO public.area_conhecimento VALUES (593, 'Química da Atmosfera', 115);
INSERT INTO public.area_conhecimento VALUES (594, 'Instrumentação Meteorológica', 115);
INSERT INTO public.area_conhecimento VALUES (595, 'Climatologia', 115);
INSERT INTO public.area_conhecimento VALUES (596, 'Micrometeorologia', 115);
INSERT INTO public.area_conhecimento VALUES (597, 'Sensoriamento Remoto da Atmosfera', 115);
INSERT INTO public.area_conhecimento VALUES (598, 'Meteorologia Aplicada', 115);
INSERT INTO public.area_conhecimento VALUES (599, 'Geodesia Física', 116);
INSERT INTO public.area_conhecimento VALUES (600, 'Geodesia Geométrica', 116);
INSERT INTO public.area_conhecimento VALUES (601, 'Geodesia Celeste', 116);
INSERT INTO public.area_conhecimento VALUES (602, 'Fotogrametria', 116);
INSERT INTO public.area_conhecimento VALUES (603, 'Cartografia Básica', 116);
INSERT INTO public.area_conhecimento VALUES (604, 'Geomorfologia', 117);
INSERT INTO public.area_conhecimento VALUES (605, 'Climatologia Geográfica', 117);
INSERT INTO public.area_conhecimento VALUES (606, 'Pedologia', 117);
INSERT INTO public.area_conhecimento VALUES (607, 'Hidrogeografia', 117);
INSERT INTO public.area_conhecimento VALUES (608, 'Geoecologia', 117);
INSERT INTO public.area_conhecimento VALUES (609, 'Fotogeografia (Físico-Ecológica)', 117);
INSERT INTO public.area_conhecimento VALUES (610, 'Geocartografia', 117);
INSERT INTO public.area_conhecimento VALUES (611, 'Interação entre os Organismos Marinhos e os Parâmetros Ambientais', 118);
INSERT INTO public.area_conhecimento VALUES (612, 'Variáveis Físicas da Água do Mar', 119);
INSERT INTO public.area_conhecimento VALUES (613, 'Movimento da Água do Mar', 119);
INSERT INTO public.area_conhecimento VALUES (614, 'Origem das Massas de Água', 119);
INSERT INTO public.area_conhecimento VALUES (615, 'Interação do Oceano com o Leito do Mar', 119);
INSERT INTO public.area_conhecimento VALUES (616, 'Interação do Oceano com a Atmosfera', 119);
INSERT INTO public.area_conhecimento VALUES (617, 'Propriedades Químicas da Água do Mar', 120);
INSERT INTO public.area_conhecimento VALUES (618, 'Interações Químico-Biológicas/Geológicas das Substâncias Químicas da Água do Mar', 120);
INSERT INTO public.area_conhecimento VALUES (619, 'Geomorfologia Submarina', 121);
INSERT INTO public.area_conhecimento VALUES (620, 'Sedimentologia Marinha', 121);
INSERT INTO public.area_conhecimento VALUES (621, 'Geofísica Marinha', 121);
INSERT INTO public.area_conhecimento VALUES (622, 'Morfologia Externa', 129);
INSERT INTO public.area_conhecimento VALUES (623, 'Citologia Vegetal', 129);
INSERT INTO public.area_conhecimento VALUES (624, 'Anatomia Vegetal', 129);
INSERT INTO public.area_conhecimento VALUES (625, 'Palinologia', 129);
INSERT INTO public.area_conhecimento VALUES (626, 'Nutrição e Crescimento Vegetal', 130);
INSERT INTO public.area_conhecimento VALUES (627, 'Reprodução Vegetal', 130);
INSERT INTO public.area_conhecimento VALUES (628, 'Ecofisiologia Vegetal', 130);
INSERT INTO public.area_conhecimento VALUES (629, 'Taxonomia de Criptógamos', 131);
INSERT INTO public.area_conhecimento VALUES (630, 'Taxonomia de Fanerógamos', 131);
INSERT INTO public.area_conhecimento VALUES (631, 'Conservação das Espécies Animais', 139);
INSERT INTO public.area_conhecimento VALUES (632, 'Utilização dos Animais', 139);
INSERT INTO public.area_conhecimento VALUES (633, 'Controle Populacional de Animais', 139);
INSERT INTO public.area_conhecimento VALUES (634, 'Anatomia Humana', 146);
INSERT INTO public.area_conhecimento VALUES (635, 'Neurofisiologia', 148);
INSERT INTO public.area_conhecimento VALUES (636, 'Fisiologia Cardiovascular', 148);
INSERT INTO public.area_conhecimento VALUES (637, 'Fisiologia da Respiração', 148);
INSERT INTO public.area_conhecimento VALUES (638, 'Fisiologia Renal', 148);
INSERT INTO public.area_conhecimento VALUES (639, 'Fisiologia Endócrina', 148);
INSERT INTO public.area_conhecimento VALUES (640, 'Fisiologia da Digestão', 148);
INSERT INTO public.area_conhecimento VALUES (641, 'Cinesiologia', 148);
INSERT INTO public.area_conhecimento VALUES (642, 'Proteínas', 151);
INSERT INTO public.area_conhecimento VALUES (643, 'Lipídeos', 151);
INSERT INTO public.area_conhecimento VALUES (644, 'Glicídeos', 151);
INSERT INTO public.area_conhecimento VALUES (645, 'Farmacocinética', 160);
INSERT INTO public.area_conhecimento VALUES (646, 'Biodisponibilidade', 160);
INSERT INTO public.area_conhecimento VALUES (647, 'Virologia', 172);
INSERT INTO public.area_conhecimento VALUES (648, 'Bacteriologia', 172);
INSERT INTO public.area_conhecimento VALUES (649, 'Micologia', 172);
INSERT INTO public.area_conhecimento VALUES (650, 'Microbiologia Médica', 173);
INSERT INTO public.area_conhecimento VALUES (651, 'Microbiologia Industrial e de Fermentação', 173);
INSERT INTO public.area_conhecimento VALUES (652, 'Protozoologia Parasitária Humana', 174);
INSERT INTO public.area_conhecimento VALUES (653, 'Protozoologia Parasitária Animal', 174);
INSERT INTO public.area_conhecimento VALUES (654, 'Helmintologia Humana', 175);
INSERT INTO public.area_conhecimento VALUES (655, 'Helmintologia Animal', 175);
INSERT INTO public.area_conhecimento VALUES (656, 'Materiais e Componentes de Construção', 177);
INSERT INTO public.area_conhecimento VALUES (657, 'Processos Construtivos', 177);
INSERT INTO public.area_conhecimento VALUES (658, 'Instalações Prediais', 177);
INSERT INTO public.area_conhecimento VALUES (659, 'Estruturas de Concreto', 178);
INSERT INTO public.area_conhecimento VALUES (660, 'Estruturas de Madeiras', 178);
INSERT INTO public.area_conhecimento VALUES (661, 'Estruturas Metálicas', 178);
INSERT INTO public.area_conhecimento VALUES (662, 'Mecânica das Estruturas', 178);
INSERT INTO public.area_conhecimento VALUES (663, 'Fundações e Escavações', 179);
INSERT INTO public.area_conhecimento VALUES (664, 'Mecânicas das Rochas', 179);
INSERT INTO public.area_conhecimento VALUES (665, 'Mecânicas dos Solos', 179);
INSERT INTO public.area_conhecimento VALUES (666, 'Obras de Terra e Enrocamento', 179);
INSERT INTO public.area_conhecimento VALUES (667, 'Pavimentos', 179);
INSERT INTO public.area_conhecimento VALUES (668, 'Hidráulica', 180);
INSERT INTO public.area_conhecimento VALUES (669, 'Hidrologia', 180);
INSERT INTO public.area_conhecimento VALUES (670, 'Aeroportos; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento VALUES (671, 'Ferrovias; Projetos e Construção', 181);
INSERT INTO public.area_conhecimento VALUES (672, 'Portos e Vias Navegáveis; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento VALUES (673, 'Rodovias; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento VALUES (674, 'Caracterização do Minério', 182);
INSERT INTO public.area_conhecimento VALUES (675, 'Dimensionamento de Jazidas', 182);
INSERT INTO public.area_conhecimento VALUES (676, 'Lavra a Céu Aberto', 183);
INSERT INTO public.area_conhecimento VALUES (677, 'Lavra de Mina Subterrânea', 183);
INSERT INTO public.area_conhecimento VALUES (678, 'Equipamentos de Lavra', 183);
INSERT INTO public.area_conhecimento VALUES (679, 'Métodos de Concentração e Enriquecimento de Minérios', 184);
INSERT INTO public.area_conhecimento VALUES (680, 'Equipamentos de Beneficiamento de Minérios', 184);
INSERT INTO public.area_conhecimento VALUES (681, 'Instalações Metalúrgicas', 185);
INSERT INTO public.area_conhecimento VALUES (682, 'Equipamentos Metalúrgicos', 185);
INSERT INTO public.area_conhecimento VALUES (683, 'Aglomeração', 186);
INSERT INTO public.area_conhecimento VALUES (684, 'Eletrometalurgia', 186);
INSERT INTO public.area_conhecimento VALUES (685, 'Hidrometalurgia', 186);
INSERT INTO public.area_conhecimento VALUES (686, 'Pirometalurgia', 186);
INSERT INTO public.area_conhecimento VALUES (687, 'Tratamento de Minérios', 186);
INSERT INTO public.area_conhecimento VALUES (688, 'Conformação Mecânica', 187);
INSERT INTO public.area_conhecimento VALUES (689, 'Fundição', 187);
INSERT INTO public.area_conhecimento VALUES (690, 'Metalurgia de Po', 187);
INSERT INTO public.area_conhecimento VALUES (691, 'Recobrimentos', 187);
INSERT INTO public.area_conhecimento VALUES (692, 'Soldagem', 187);
INSERT INTO public.area_conhecimento VALUES (693, 'Tratamento Térmicos, Mecânicos e Químicos', 187);
INSERT INTO public.area_conhecimento VALUES (694, 'Usinagem', 187);
INSERT INTO public.area_conhecimento VALUES (695, 'Estrutura dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento VALUES (696, 'Propriedades Físicas dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento VALUES (697, 'Propriedades Mecânicas dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento VALUES (698, 'Transformação de Fases', 188);
INSERT INTO public.area_conhecimento VALUES (699, 'Corrosão', 188);
INSERT INTO public.area_conhecimento VALUES (700, 'Extração e Transformação de Materiais', 189);
INSERT INTO public.area_conhecimento VALUES (701, 'Cerâmicos', 189);
INSERT INTO public.area_conhecimento VALUES (702, 'Materiais Conjugados não Metálicos', 189);
INSERT INTO public.area_conhecimento VALUES (703, 'Polímeros, Aplicações', 189);
INSERT INTO public.area_conhecimento VALUES (704, 'Materiais Condutores', 190);
INSERT INTO public.area_conhecimento VALUES (705, 'Materiais e Componentes Semicondutores', 190);
INSERT INTO public.area_conhecimento VALUES (706, 'Materiais e Dispositivos Supercondutores', 190);
INSERT INTO public.area_conhecimento VALUES (707, 'Materiais Dielétricos, Piezoelétricos e Ferroelétricos', 190);
INSERT INTO public.area_conhecimento VALUES (708, 'Materiais e Componentes Eletroóticos e Magnetoóticos, Materiais Fotoelétricos', 190);
INSERT INTO public.area_conhecimento VALUES (709, 'Materiais e Dispositivos Magnéticos', 190);
INSERT INTO public.area_conhecimento VALUES (710, 'Medidas Elétricas', 191);
INSERT INTO public.area_conhecimento VALUES (711, 'Medidas Magnéticas', 191);
INSERT INTO public.area_conhecimento VALUES (712, 'Instrumentação Eletromecânica', 191);
INSERT INTO public.area_conhecimento VALUES (713, 'Instrumentação Eletrônica', 191);
INSERT INTO public.area_conhecimento VALUES (714, 'Sistemas Eletrônicos de Medida e de Controle', 191);
INSERT INTO public.area_conhecimento VALUES (715, 'Teoria Geral dos Circuitos Elétricos', 192);
INSERT INTO public.area_conhecimento VALUES (716, 'Circuitos Lineares e Não-Lineares', 192);
INSERT INTO public.area_conhecimento VALUES (717, 'Circuitos Eletrônicos', 192);
INSERT INTO public.area_conhecimento VALUES (718, 'Circuitos Magnéticos, Magnetismos, Eletromagnetismo', 192);
INSERT INTO public.area_conhecimento VALUES (719, 'Geração da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento VALUES (720, 'Transmissão da Energia Elétrica, Distribuição da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento VALUES (721, 'Conversão e Retificação da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento VALUES (722, 'Medição, Controle, Correção e Proteção de Sistemas Elétricos de Potência', 193);
INSERT INTO public.area_conhecimento VALUES (723, 'Máquinas Elétricas e Dispositivos de Potência', 193);
INSERT INTO public.area_conhecimento VALUES (724, 'Instalações Elétricas Prediais e Industriais', 193);
INSERT INTO public.area_conhecimento VALUES (725, 'Eletrônica Industrial', 194);
INSERT INTO public.area_conhecimento VALUES (726, 'Automação Eletrônica de Processos Elétricos e Industriais', 194);
INSERT INTO public.area_conhecimento VALUES (727, 'Controle de Processos Eletrônicos, Retroalimentação', 194);
INSERT INTO public.area_conhecimento VALUES (728, 'Teoria Eletromagnética, Micro-ondas, Propagação de Ondas, Antenas', 195);
INSERT INTO public.area_conhecimento VALUES (729, 'Radionavegação e Radioastronomia', 195);
INSERT INTO public.area_conhecimento VALUES (730, 'Sistemas de Telecomunicações', 195);
INSERT INTO public.area_conhecimento VALUES (731, 'Transferência de Calor', 196);
INSERT INTO public.area_conhecimento VALUES (732, 'Mecânica dos Fluidos', 196);
INSERT INTO public.area_conhecimento VALUES (733, 'Dinâmica dos Gases', 196);
INSERT INTO public.area_conhecimento VALUES (734, 'Princípios Variacionais e Métodos Numéricos', 196);
INSERT INTO public.area_conhecimento VALUES (735, 'Termodinâmica', 197);
INSERT INTO public.area_conhecimento VALUES (736, 'Controle Ambiental', 197);
INSERT INTO public.area_conhecimento VALUES (737, 'Aproveitamento da Energia', 197);
INSERT INTO public.area_conhecimento VALUES (738, 'Mecânica dos Corpos Sólidos, Elásticos e Plásticos', 198);
INSERT INTO public.area_conhecimento VALUES (739, 'Dinâmica dos Corpos Rígidos, Elásticos e Plásticos', 198);
INSERT INTO public.area_conhecimento VALUES (740, 'Análise de Tensões', 198);
INSERT INTO public.area_conhecimento VALUES (741, 'Termoelasticidade', 198);
INSERT INTO public.area_conhecimento VALUES (742, 'Teoria dos Mecanismos', 199);
INSERT INTO public.area_conhecimento VALUES (743, 'Estática e Dinâmica Aplicada', 199);
INSERT INTO public.area_conhecimento VALUES (744, 'Elementos de Máquinas', 199);
INSERT INTO public.area_conhecimento VALUES (745, 'Fundamentos Gerais de Projetos das Máquinas', 199);
INSERT INTO public.area_conhecimento VALUES (746, 'Máquinas, Motores e Equipamentos', 199);
INSERT INTO public.area_conhecimento VALUES (747, 'Métodos de Síntese e Otimização Aplicados ao Projeto Mecânico', 199);
INSERT INTO public.area_conhecimento VALUES (748, 'Controle de Sistemas Mecânicos', 199);
INSERT INTO public.area_conhecimento VALUES (749, 'Aproveitamento de Energia', 199);
INSERT INTO public.area_conhecimento VALUES (750, 'Matrizes e Ferramentas', 200);
INSERT INTO public.area_conhecimento VALUES (751, 'Máquinas de Usinagem e Conformação', 200);
INSERT INTO public.area_conhecimento VALUES (752, 'Controle Numérico', 200);
INSERT INTO public.area_conhecimento VALUES (753, 'Robotização', 200);
INSERT INTO public.area_conhecimento VALUES (754, 'Processos de Fabricação, Seleção Econômica', 200);
INSERT INTO public.area_conhecimento VALUES (755, 'Processos Bioquímicos', 201);
INSERT INTO public.area_conhecimento VALUES (756, 'Processos Orgânicos', 201);
INSERT INTO public.area_conhecimento VALUES (757, 'Processos Inorgânicos', 201);
INSERT INTO public.area_conhecimento VALUES (758, 'Reatores Químicos', 202);
INSERT INTO public.area_conhecimento VALUES (759, 'Operações Características de Processos Bioquímicos', 202);
INSERT INTO public.area_conhecimento VALUES (760, 'Operações de Separação e Mistura', 202);
INSERT INTO public.area_conhecimento VALUES (761, 'Balancos Globais de Matéria e Energia', 203);
INSERT INTO public.area_conhecimento VALUES (762, 'Água', 203);
INSERT INTO public.area_conhecimento VALUES (763, 'Álcool', 203);
INSERT INTO public.area_conhecimento VALUES (764, 'Alimentos', 203);
INSERT INTO public.area_conhecimento VALUES (765, 'Borrachas', 203);
INSERT INTO public.area_conhecimento VALUES (766, 'Carvão', 203);
INSERT INTO public.area_conhecimento VALUES (767, 'Cerâmica', 203);
INSERT INTO public.area_conhecimento VALUES (768, 'Cimento', 203);
INSERT INTO public.area_conhecimento VALUES (769, 'Couro', 203);
INSERT INTO public.area_conhecimento VALUES (770, 'Detergentes', 203);
INSERT INTO public.area_conhecimento VALUES (771, 'Fertilizantes', 203);
INSERT INTO public.area_conhecimento VALUES (772, 'Medicamentos', 203);
INSERT INTO public.area_conhecimento VALUES (773, 'Metais não-Ferrosos', 203);
INSERT INTO public.area_conhecimento VALUES (774, 'Óleos', 203);
INSERT INTO public.area_conhecimento VALUES (775, 'Papel e Celulose', 203);
INSERT INTO public.area_conhecimento VALUES (776, 'Petróleo e Petroquímica', 203);
INSERT INTO public.area_conhecimento VALUES (777, 'Polímeros', 203);
INSERT INTO public.area_conhecimento VALUES (778, 'Produtos Naturais', 203);
INSERT INTO public.area_conhecimento VALUES (779, 'Têxteis', 203);
INSERT INTO public.area_conhecimento VALUES (780, 'Tratamentos e Aproveitamento de Rejeitos', 203);
INSERT INTO public.area_conhecimento VALUES (781, 'Xisto', 203);
INSERT INTO public.area_conhecimento VALUES (782, 'Planejamento Integrado dos Recursos Hídricos', 204);
INSERT INTO public.area_conhecimento VALUES (783, 'Tecnologia e Problemas Sanitários de Irrigação', 204);
INSERT INTO public.area_conhecimento VALUES (784, 'Águas Subterrâneas e Poços Profundos', 204);
INSERT INTO public.area_conhecimento VALUES (785, 'Controle de Enchentes e de Barragens', 204);
INSERT INTO public.area_conhecimento VALUES (786, 'Sedimentologia', 204);
INSERT INTO public.area_conhecimento VALUES (787, 'Química Sanitária', 205);
INSERT INTO public.area_conhecimento VALUES (788, 'Processos Simplificados de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento VALUES (789, 'Técnicas Convencionais de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento VALUES (790, 'Técnicas Avançadas de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento VALUES (791, 'Estudos e Caracterização de Efluentes Industriais', 205);
INSERT INTO public.area_conhecimento VALUES (792, 'Lay Out de Processos Industriais', 205);
INSERT INTO public.area_conhecimento VALUES (793, 'Resíduos Radioativos', 205);
INSERT INTO public.area_conhecimento VALUES (794, 'Técnicas de Abastecimento da Água', 206);
INSERT INTO public.area_conhecimento VALUES (795, 'Drenagem de Águas Residuárias', 206);
INSERT INTO public.area_conhecimento VALUES (796, 'Drenagem Urbana de Águas Pluviais', 206);
INSERT INTO public.area_conhecimento VALUES (797, 'Resíduos Sólidos, Domésticos e Industriais', 206);
INSERT INTO public.area_conhecimento VALUES (798, 'Limpeza Pública', 206);
INSERT INTO public.area_conhecimento VALUES (799, 'Instalações Hidráulico-Sanitárias', 206);
INSERT INTO public.area_conhecimento VALUES (800, 'Ecologia Aplicada à Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento VALUES (801, 'Microbiologia Aplicada e Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento VALUES (802, 'Parasitologia Aplicada à Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento VALUES (803, 'Qualidade do Ar, das Águas e do Solo', 207);
INSERT INTO public.area_conhecimento VALUES (804, 'Controle da Poluição', 207);
INSERT INTO public.area_conhecimento VALUES (805, 'Legislação Ambiental', 207);
INSERT INTO public.area_conhecimento VALUES (806, 'Planejamento de Instalações Industriais', 208);
INSERT INTO public.area_conhecimento VALUES (807, 'Planejamento, Projeto e Controle de Sistemas de Produção', 208);
INSERT INTO public.area_conhecimento VALUES (808, 'Higiene e Segurança do Trabalho', 208);
INSERT INTO public.area_conhecimento VALUES (809, 'Suprimentos', 208);
INSERT INTO public.area_conhecimento VALUES (810, 'Garantia de Controle de Qualidade', 208);
INSERT INTO public.area_conhecimento VALUES (811, 'Processos Estocásticos e Teorias da Filas', 209);
INSERT INTO public.area_conhecimento VALUES (812, 'Programação Linear, Não-Linear, Mista e Dinâmica', 209);
INSERT INTO public.area_conhecimento VALUES (813, 'Séries Temporais', 209);
INSERT INTO public.area_conhecimento VALUES (814, 'Teoria dos Grafos', 209);
INSERT INTO public.area_conhecimento VALUES (815, 'Teoria dos Jogos', 209);
INSERT INTO public.area_conhecimento VALUES (816, 'Ergonomia', 210);
INSERT INTO public.area_conhecimento VALUES (817, 'Metodologia de Projeto do Produto', 210);
INSERT INTO public.area_conhecimento VALUES (818, 'Processos de Trabalho', 210);
INSERT INTO public.area_conhecimento VALUES (819, 'Gerência do Projeto e do Produto', 210);
INSERT INTO public.area_conhecimento VALUES (820, 'Desenvolvimento de Produto', 210);
INSERT INTO public.area_conhecimento VALUES (821, 'Estudo de Mercado', 211);
INSERT INTO public.area_conhecimento VALUES (822, 'Localização Industrial', 211);
INSERT INTO public.area_conhecimento VALUES (823, 'Análise de Custos', 211);
INSERT INTO public.area_conhecimento VALUES (824, 'Economia de Tecnologia', 211);
INSERT INTO public.area_conhecimento VALUES (825, 'Vida Econômica dos Equipamentos', 211);
INSERT INTO public.area_conhecimento VALUES (826, 'Avaliação de Projetos', 211);
INSERT INTO public.area_conhecimento VALUES (827, 'Produção de Radioisótopos', 212);
INSERT INTO public.area_conhecimento VALUES (828, 'Aplicações Industriais de Radioisótopos', 212);
INSERT INTO public.area_conhecimento VALUES (829, 'Instrumentação para Medida e Controle de Radiação', 212);
INSERT INTO public.area_conhecimento VALUES (830, 'Processos Industriais da Fusão Controlada', 213);
INSERT INTO public.area_conhecimento VALUES (831, 'Problemas Tecnológicos da Fusão Controlada', 213);
INSERT INTO public.area_conhecimento VALUES (832, 'Extração de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento VALUES (833, 'Conversão, Enriquecimento e Fabricação de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento VALUES (834, 'Reprocessamento de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento VALUES (835, 'Rejeitos de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento VALUES (836, 'Núcleo do Reator', 215);
INSERT INTO public.area_conhecimento VALUES (837, 'Materiais Nucleares e Blindagem de Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (838, 'Transferência de Calor em Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (839, 'Geração e Integração Com Sistemas Elétricos em Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (840, 'Instrumentação Para Operação e Controle de Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (841, 'Segurança, Localização e Licenciamento de Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (842, 'Aspectos Econômicos de Reatores', 215);
INSERT INTO public.area_conhecimento VALUES (843, 'Planejamento e Organização do Sistema de Transporte', 216);
INSERT INTO public.area_conhecimento VALUES (844, 'Economia dos Transportes', 216);
INSERT INTO public.area_conhecimento VALUES (845, 'Vias de Transporte', 217);
INSERT INTO public.area_conhecimento VALUES (846, 'Veículos de Transportes', 217);
INSERT INTO public.area_conhecimento VALUES (847, 'Estação de Transporte', 217);
INSERT INTO public.area_conhecimento VALUES (848, 'Equipamentos Auxiliares e Controles', 217);
INSERT INTO public.area_conhecimento VALUES (849, 'Engenharia de Tráfego', 218);
INSERT INTO public.area_conhecimento VALUES (850, 'Capacidade de Vias de Transporte', 218);
INSERT INTO public.area_conhecimento VALUES (851, 'Operação de Sistemas de Transporte', 218);
INSERT INTO public.area_conhecimento VALUES (852, 'Resistência Hidrodinâmica', 219);
INSERT INTO public.area_conhecimento VALUES (853, 'Propulsão de Navios', 219);
INSERT INTO public.area_conhecimento VALUES (854, 'Análise Teórica e Experimental de Estrutura', 220);
INSERT INTO public.area_conhecimento VALUES (855, 'Dinâmica Estrutural Naval e Oceânica', 220);
INSERT INTO public.area_conhecimento VALUES (856, 'Síntese Estrutural Naval e Oceânica', 220);
INSERT INTO public.area_conhecimento VALUES (857, 'Análise de Sistemas Propulsores', 221);
INSERT INTO public.area_conhecimento VALUES (858, 'Controle e Automação de Sistemas Propulsores', 221);
INSERT INTO public.area_conhecimento VALUES (859, 'Equipamentos Auxiliares do Sistema Propulsivo', 221);
INSERT INTO public.area_conhecimento VALUES (860, 'Motor de Propulsão', 221);
INSERT INTO public.area_conhecimento VALUES (861, 'Projetos de Navios', 222);
INSERT INTO public.area_conhecimento VALUES (862, 'Projetos de Sistemas Oceânicos Fixos e Semi-Fixos', 222);
INSERT INTO public.area_conhecimento VALUES (863, 'Projetos de Embarcações Não-Convencionais', 222);
INSERT INTO public.area_conhecimento VALUES (864, 'Métodos de Fabricação de Navios e Sistemas Oceânicos', 223);
INSERT INTO public.area_conhecimento VALUES (865, 'Soldagem de Estruturas Navais e Oceânicos', 223);
INSERT INTO public.area_conhecimento VALUES (866, 'Custos de Construção Naval', 223);
INSERT INTO public.area_conhecimento VALUES (867, 'Normatização e Certificação de Qualidade de Navios', 223);
INSERT INTO public.area_conhecimento VALUES (868, 'Aerodinâmica de Aeronaves Espaciais', 224);
INSERT INTO public.area_conhecimento VALUES (869, 'Aerodinâmica dos Processos Geofísicos e Interplanetários', 224);
INSERT INTO public.area_conhecimento VALUES (870, 'Trajetórias e Orbitas', 225);
INSERT INTO public.area_conhecimento VALUES (871, 'Estabilidade e Controle', 225);
INSERT INTO public.area_conhecimento VALUES (872, 'Aeroelasticidade', 226);
INSERT INTO public.area_conhecimento VALUES (873, 'Fadiga', 226);
INSERT INTO public.area_conhecimento VALUES (874, 'Projeto de Estruturas Aeroespaciais', 226);
INSERT INTO public.area_conhecimento VALUES (875, 'Combustão e Escoamento com Reações Químicas', 228);
INSERT INTO public.area_conhecimento VALUES (876, 'Propulsão de Foguetes', 228);
INSERT INTO public.area_conhecimento VALUES (877, 'Máquinas de Fluxo', 228);
INSERT INTO public.area_conhecimento VALUES (878, 'Motores Alternativos', 228);
INSERT INTO public.area_conhecimento VALUES (879, 'Aviões', 229);
INSERT INTO public.area_conhecimento VALUES (880, 'Foguetes', 229);
INSERT INTO public.area_conhecimento VALUES (881, 'Helicópteros', 229);
INSERT INTO public.area_conhecimento VALUES (882, 'Hovercraft', 229);
INSERT INTO public.area_conhecimento VALUES (883, 'Satélites e Outros Dispositivos Aeroespaciais', 229);
INSERT INTO public.area_conhecimento VALUES (884, 'Normatização e Certificação de Qualidade de Aeronaves e Componentes', 229);
INSERT INTO public.area_conhecimento VALUES (885, 'Manutenção de Sistemas Aeroespaciais', 229);
INSERT INTO public.area_conhecimento VALUES (886, 'Processamento de Sinais Biológicos', 230);
INSERT INTO public.area_conhecimento VALUES (887, 'Modelagem de Fenômenos Biológicos', 230);
INSERT INTO public.area_conhecimento VALUES (888, 'Modelagem de Sistemas Biológicos', 230);
INSERT INTO public.area_conhecimento VALUES (889, 'Biomateriais e Materiais Biocompatíveis', 231);
INSERT INTO public.area_conhecimento VALUES (890, 'Transdutores para Aplicações Biomédicas', 231);
INSERT INTO public.area_conhecimento VALUES (891, 'Instrumentação Odontológica e Médico-Hospitalar', 231);
INSERT INTO public.area_conhecimento VALUES (892, 'Tecnologia de Próteses', 231);
INSERT INTO public.area_conhecimento VALUES (893, 'Angiologia', 232);
INSERT INTO public.area_conhecimento VALUES (894, 'Dermatologia', 232);
INSERT INTO public.area_conhecimento VALUES (895, 'Alergologia e Imunologia Clínica', 232);
INSERT INTO public.area_conhecimento VALUES (896, 'Cancerologia', 232);
INSERT INTO public.area_conhecimento VALUES (897, 'Hematologia', 232);
INSERT INTO public.area_conhecimento VALUES (898, 'Endocrinologia', 232);
INSERT INTO public.area_conhecimento VALUES (899, 'Neurologia', 232);
INSERT INTO public.area_conhecimento VALUES (900, 'Pediatria', 232);
INSERT INTO public.area_conhecimento VALUES (901, 'Doenças Infecciosas e Parasitárias', 232);
INSERT INTO public.area_conhecimento VALUES (902, 'Cardiologia', 232);
INSERT INTO public.area_conhecimento VALUES (903, 'Gastroenterologia', 232);
INSERT INTO public.area_conhecimento VALUES (904, 'Pneumologia', 232);
INSERT INTO public.area_conhecimento VALUES (905, 'Nefrologia', 232);
INSERT INTO public.area_conhecimento VALUES (906, 'Reumatologia', 232);
INSERT INTO public.area_conhecimento VALUES (907, 'Ginecologia e Obstetrícia', 232);
INSERT INTO public.area_conhecimento VALUES (908, 'Fisiatria', 232);
INSERT INTO public.area_conhecimento VALUES (909, 'Oftalmologia', 232);
INSERT INTO public.area_conhecimento VALUES (910, 'Ortopedia', 232);
INSERT INTO public.area_conhecimento VALUES (911, 'Cirurgia Plástica e Restauradora', 233);
INSERT INTO public.area_conhecimento VALUES (912, 'Cirurgia Otorrinolaringológica', 233);
INSERT INTO public.area_conhecimento VALUES (913, 'Cirurgia Oftalmológica', 233);
INSERT INTO public.area_conhecimento VALUES (914, 'Cirurgia Cardiovascular', 233);
INSERT INTO public.area_conhecimento VALUES (915, 'Cirurgia Torácica', 233);
INSERT INTO public.area_conhecimento VALUES (916, 'Cirurgia Gastroenterologia', 233);
INSERT INTO public.area_conhecimento VALUES (917, 'Cirurgia Pediátrica', 233);
INSERT INTO public.area_conhecimento VALUES (918, 'Neurocirurgia', 233);
INSERT INTO public.area_conhecimento VALUES (919, 'Cirurgia Urológica', 233);
INSERT INTO public.area_conhecimento VALUES (920, 'Cirurgia Proctológica', 233);
INSERT INTO public.area_conhecimento VALUES (921, 'Cirurgia Ortopédica', 233);
INSERT INTO public.area_conhecimento VALUES (922, 'Cirurgia Traumatológica', 233);
INSERT INTO public.area_conhecimento VALUES (923, 'Anestesiologia', 233);
INSERT INTO public.area_conhecimento VALUES (924, 'Cirurgia Experimental', 233);
INSERT INTO public.area_conhecimento VALUES (925, 'Gênese, Morfologia e Classificação dos Solos', 266);
INSERT INTO public.area_conhecimento VALUES (926, 'Física do Solo', 266);
INSERT INTO public.area_conhecimento VALUES (927, 'Química do Solo', 266);
INSERT INTO public.area_conhecimento VALUES (928, 'Microbiologia e Bioquímica do Solo', 266);
INSERT INTO public.area_conhecimento VALUES (929, 'Fertilidade do Solo e Adubação', 266);
INSERT INTO public.area_conhecimento VALUES (930, 'Manejo e Conservação do Solo', 266);
INSERT INTO public.area_conhecimento VALUES (931, 'Fitopatologia', 267);
INSERT INTO public.area_conhecimento VALUES (932, 'Entomologia Agrícola', 267);
INSERT INTO public.area_conhecimento VALUES (933, 'Parasitologia Agrícola', 267);
INSERT INTO public.area_conhecimento VALUES (934, 'Microbiologia Agrícola', 267);
INSERT INTO public.area_conhecimento VALUES (935, 'Defesa Fitossanitária', 267);
INSERT INTO public.area_conhecimento VALUES (936, 'Manejo e Tratos Culturais', 268);
INSERT INTO public.area_conhecimento VALUES (937, 'Mecanização Agrícola', 268);
INSERT INTO public.area_conhecimento VALUES (938, 'Produção e Beneficiamento de Sementes', 268);
INSERT INTO public.area_conhecimento VALUES (939, 'Produção de Mudas', 268);
INSERT INTO public.area_conhecimento VALUES (940, 'Melhoramento Vegetal', 268);
INSERT INTO public.area_conhecimento VALUES (941, 'Fisiologia de Plantas Cultivadas', 268);
INSERT INTO public.area_conhecimento VALUES (942, 'Matologia', 268);
INSERT INTO public.area_conhecimento VALUES (943, 'Floricultura', 269);
INSERT INTO public.area_conhecimento VALUES (944, 'Parques e Jardins', 269);
INSERT INTO public.area_conhecimento VALUES (945, 'Arborização de Vias Públicas', 269);
INSERT INTO public.area_conhecimento VALUES (946, 'Dendrologia', 272);
INSERT INTO public.area_conhecimento VALUES (947, 'Florestamento e Reflorestamento', 272);
INSERT INTO public.area_conhecimento VALUES (948, 'Genética e Melhoramento Florestal', 272);
INSERT INTO public.area_conhecimento VALUES (949, 'Sementes Florestais', 272);
INSERT INTO public.area_conhecimento VALUES (950, 'Nutrição Florestal', 272);
INSERT INTO public.area_conhecimento VALUES (951, 'Fisiologia Florestal', 272);
INSERT INTO public.area_conhecimento VALUES (952, 'Solos Florestais', 272);
INSERT INTO public.area_conhecimento VALUES (953, 'Proteção Florestal', 272);
INSERT INTO public.area_conhecimento VALUES (954, 'Economia Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (955, 'Politica e Legislação Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (956, 'Administração Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (957, 'Dendrometria e Inventário Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (958, 'Fotointerpretação Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (959, 'Ordenamento Florestal', 273);
INSERT INTO public.area_conhecimento VALUES (960, 'Exploração Florestal', 274);
INSERT INTO public.area_conhecimento VALUES (961, 'Mecanização Florestal', 274);
INSERT INTO public.area_conhecimento VALUES (962, 'Anatomia e Identificação de Produtos Florestais', 275);
INSERT INTO public.area_conhecimento VALUES (963, 'Propriedades Físico-Mecânicas da Madeira', 275);
INSERT INTO public.area_conhecimento VALUES (964, 'Relações Água-Madeira e Secagem', 275);
INSERT INTO public.area_conhecimento VALUES (965, 'Tratamento da Madeira', 275);
INSERT INTO public.area_conhecimento VALUES (966, 'Processamento Mecânico da Madeira', 275);
INSERT INTO public.area_conhecimento VALUES (967, 'Química da Madeira', 275);
INSERT INTO public.area_conhecimento VALUES (968, 'Resinas de Madeiras', 275);
INSERT INTO public.area_conhecimento VALUES (969, 'Tecnologia de Celulose e Papel', 275);
INSERT INTO public.area_conhecimento VALUES (970, 'Tecnologia de Chapas', 275);
INSERT INTO public.area_conhecimento VALUES (971, 'Hidrologia Florestal', 276);
INSERT INTO public.area_conhecimento VALUES (972, 'Conservação de Áreas Silvestres', 276);
INSERT INTO public.area_conhecimento VALUES (973, 'Conservação de Bacias Hidrográficas', 276);
INSERT INTO public.area_conhecimento VALUES (974, 'Recuperação de Áreas Degradadas', 276);
INSERT INTO public.area_conhecimento VALUES (975, 'Irrigação e Drenagem', 279);
INSERT INTO public.area_conhecimento VALUES (976, 'Conservação de Solo e Água', 279);
INSERT INTO public.area_conhecimento VALUES (977, 'Pré-Processamento de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento VALUES (978, 'Armazenamento de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento VALUES (979, 'Transferência de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento VALUES (980, 'Assentamento Rural', 281);
INSERT INTO public.area_conhecimento VALUES (981, 'Engenharia de Construções Rurais', 281);
INSERT INTO public.area_conhecimento VALUES (982, 'Saneamento Rural', 281);
INSERT INTO public.area_conhecimento VALUES (983, 'Exigências Nutricionais dos Animais', 285);
INSERT INTO public.area_conhecimento VALUES (984, 'Avaliação de Alimentos para Animais', 285);
INSERT INTO public.area_conhecimento VALUES (985, 'Conservação de Alimentos para Animais', 285);
INSERT INTO public.area_conhecimento VALUES (986, 'Avaliação, Produção e Conservação de Forragens', 286);
INSERT INTO public.area_conhecimento VALUES (987, 'Manejo e Conservação de Pastagens', 286);
INSERT INTO public.area_conhecimento VALUES (988, 'Fisiologia de Plantas Forrageiras', 286);
INSERT INTO public.area_conhecimento VALUES (989, 'Melhoramento de Plantas Forrageiras e Produção de Sementes', 286);
INSERT INTO public.area_conhecimento VALUES (990, 'Toxicologia e Plantas Tóxicas', 286);
INSERT INTO public.area_conhecimento VALUES (991, 'Criação de Animais', 287);
INSERT INTO public.area_conhecimento VALUES (992, 'Manejo de Animais', 287);
INSERT INTO public.area_conhecimento VALUES (993, 'Instalações para Produção Animal', 287);
INSERT INTO public.area_conhecimento VALUES (994, 'Anestesiologia Animal', 288);
INSERT INTO public.area_conhecimento VALUES (995, 'Técnica Cirúrgica Animal', 288);
INSERT INTO public.area_conhecimento VALUES (996, 'Radiologia de Animais', 288);
INSERT INTO public.area_conhecimento VALUES (997, 'Farmacologia e Terapêutica Animal', 288);
INSERT INTO public.area_conhecimento VALUES (998, 'Obstetrícia Animal', 288);
INSERT INTO public.area_conhecimento VALUES (999, 'Clínica Veterinária', 288);
INSERT INTO public.area_conhecimento VALUES (1000, 'Clínica Cirúrgica Animal', 288);
INSERT INTO public.area_conhecimento VALUES (1001, 'Toxicologia Animal', 288);
INSERT INTO public.area_conhecimento VALUES (1002, 'Epidemiologia Animal', 289);
INSERT INTO public.area_conhecimento VALUES (1003, 'Saneamento Aplicado à Saúde do Homem', 289);
INSERT INTO public.area_conhecimento VALUES (1004, 'Doenças Infecciosas de Animais', 289);
INSERT INTO public.area_conhecimento VALUES (1005, 'Doenças Parasitárias de Animais', 289);
INSERT INTO public.area_conhecimento VALUES (1006, 'Saúde Animal (Programas Sanitários)', 289);
INSERT INTO public.area_conhecimento VALUES (1007, 'Patologia Aviária', 290);
INSERT INTO public.area_conhecimento VALUES (1008, 'Anatomia Patologia Animal', 290);
INSERT INTO public.area_conhecimento VALUES (1009, 'Patologia Clínica Animal', 290);
INSERT INTO public.area_conhecimento VALUES (1010, 'Ginecologia e Andrologia Animal', 291);
INSERT INTO public.area_conhecimento VALUES (1011, 'Inseminação Artificial Animal', 291);
INSERT INTO public.area_conhecimento VALUES (1012, 'Fisiopatologia da Reprodução Animal', 291);
INSERT INTO public.area_conhecimento VALUES (1013, 'Fatores Abióticos do Mar', 293);
INSERT INTO public.area_conhecimento VALUES (1014, 'Avaliação de Estoques Pesqueiros Marinhos', 293);
INSERT INTO public.area_conhecimento VALUES (1015, 'Exploração Pesqueira Marinha', 293);
INSERT INTO public.area_conhecimento VALUES (1016, 'Manejo e Conservação de Recursos Pesqueiros Marinhos', 293);
INSERT INTO public.area_conhecimento VALUES (1017, 'Fatores Abióticos de Águas Interiores', 294);
INSERT INTO public.area_conhecimento VALUES (1018, 'Avaliação de Estoques Pesqueiros de Águas Interiores', 294);
INSERT INTO public.area_conhecimento VALUES (1019, 'Explotação Pesqueira de Águas Interiores', 294);
INSERT INTO public.area_conhecimento VALUES (1020, 'Manejo e Conservação de Recursos Pesqueiros de Águas Interiores', 294);
INSERT INTO public.area_conhecimento VALUES (1021, 'Maricultura', 295);
INSERT INTO public.area_conhecimento VALUES (1022, 'Carcinocultura', 295);
INSERT INTO public.area_conhecimento VALUES (1023, 'Ostreicultura', 295);
INSERT INTO public.area_conhecimento VALUES (1024, 'Piscicultura', 295);
INSERT INTO public.area_conhecimento VALUES (1025, 'Valor Nutritivo de Alimentos', 297);
INSERT INTO public.area_conhecimento VALUES (1026, 'Química, Física, Físico-Química e Bioquímica dos Alim. e das Mat.-Primas Alimentares', 297);
INSERT INTO public.area_conhecimento VALUES (1027, 'Microbiologia de Alimentos', 297);
INSERT INTO public.area_conhecimento VALUES (1028, 'Fisiologia Pós-Colheita', 297);
INSERT INTO public.area_conhecimento VALUES (1029, 'Toxicidade e Resíduos de Pesticidas em Alimentos', 297);
INSERT INTO public.area_conhecimento VALUES (1030, 'Avaliação e Controle de Qualidade de Alimentos', 297);
INSERT INTO public.area_conhecimento VALUES (1031, 'Padrões, Legislação e Fiscalização de Alimentos', 297);
INSERT INTO public.area_conhecimento VALUES (1032, 'Tecnologia de Produtos de Origem Animal', 298);
INSERT INTO public.area_conhecimento VALUES (1033, 'Tecnologia de Produtos de Origem Vegetal', 298);
INSERT INTO public.area_conhecimento VALUES (1034, 'Tecnologia das Bebidas', 298);
INSERT INTO public.area_conhecimento VALUES (1035, 'Tecnologia de Alimentos Dietéticos e Nutricionais', 298);
INSERT INTO public.area_conhecimento VALUES (1036, 'Aproveitamento de Subprodutos', 298);
INSERT INTO public.area_conhecimento VALUES (1037, 'Embalagens de Produtos Alimentares', 298);
INSERT INTO public.area_conhecimento VALUES (1038, 'Instalações Industriais de Produção de Alimentos', 299);
INSERT INTO public.area_conhecimento VALUES (1039, 'Armazenamento de Alimentos', 299);
INSERT INTO public.area_conhecimento VALUES (1040, 'Teoria Geral do Direito', 300);
INSERT INTO public.area_conhecimento VALUES (1041, 'Teoria Geral do Processo', 300);
INSERT INTO public.area_conhecimento VALUES (1042, 'Teoria do Estado', 300);
INSERT INTO public.area_conhecimento VALUES (1043, 'História do Direito', 300);
INSERT INTO public.area_conhecimento VALUES (1044, 'Filosofia do Direito', 300);
INSERT INTO public.area_conhecimento VALUES (1045, 'Lógica Jurídica', 300);
INSERT INTO public.area_conhecimento VALUES (1046, 'Sociologia Jurídica', 300);
INSERT INTO public.area_conhecimento VALUES (1047, 'Antropologia Jurídica', 300);
INSERT INTO public.area_conhecimento VALUES (1048, 'Direito Tributário', 301);
INSERT INTO public.area_conhecimento VALUES (1049, 'Direito Penal', 301);
INSERT INTO public.area_conhecimento VALUES (1050, 'Direito Processual Penal', 301);
INSERT INTO public.area_conhecimento VALUES (1051, 'Direito Processual Civil', 301);
INSERT INTO public.area_conhecimento VALUES (1052, 'Direito Constitucional', 301);
INSERT INTO public.area_conhecimento VALUES (1053, 'Direito Administrativo', 301);
INSERT INTO public.area_conhecimento VALUES (1054, 'Direito Internacional Público', 301);
INSERT INTO public.area_conhecimento VALUES (1055, 'Direito Civil', 302);
INSERT INTO public.area_conhecimento VALUES (1056, 'Direito Comercial', 302);
INSERT INTO public.area_conhecimento VALUES (1057, 'Direito do Trabalho', 302);
INSERT INTO public.area_conhecimento VALUES (1058, 'Direito Internacional Privado', 302);
INSERT INTO public.area_conhecimento VALUES (1059, 'Administração da Produção', 304);
INSERT INTO public.area_conhecimento VALUES (1060, 'Administração Financeira', 304);
INSERT INTO public.area_conhecimento VALUES (1061, 'Mercadologia', 304);
INSERT INTO public.area_conhecimento VALUES (1062, 'Negócios Internacionais', 304);
INSERT INTO public.area_conhecimento VALUES (1063, 'Administração de Recursos Humanos', 304);
INSERT INTO public.area_conhecimento VALUES (1064, 'Contabilidade e Finanças Públicas', 305);
INSERT INTO public.area_conhecimento VALUES (1065, 'Organizações Públicas', 305);
INSERT INTO public.area_conhecimento VALUES (1066, 'Política e Planejamento Governamentais', 305);
INSERT INTO public.area_conhecimento VALUES (1067, 'Administração de Pessoal', 305);
INSERT INTO public.area_conhecimento VALUES (1068, 'Economia Geral', 308);
INSERT INTO public.area_conhecimento VALUES (1069, 'Teoria Geral da Economia', 308);
INSERT INTO public.area_conhecimento VALUES (1070, 'História do Pensamento Econômico', 308);
INSERT INTO public.area_conhecimento VALUES (1071, 'História Econômica', 308);
INSERT INTO public.area_conhecimento VALUES (1072, 'Sistemas Econômicos', 308);
INSERT INTO public.area_conhecimento VALUES (1073, 'Métodos e Modelos Matemáticos, Econométricos e Estatísticos', 309);
INSERT INTO public.area_conhecimento VALUES (1074, 'Estatística Sócio-Econômica', 309);
INSERT INTO public.area_conhecimento VALUES (1075, 'Contabilidade Nacional', 309);
INSERT INTO public.area_conhecimento VALUES (1076, 'Economia Matemática', 309);
INSERT INTO public.area_conhecimento VALUES (1077, 'Teoria Monetária e Financeira', 310);
INSERT INTO public.area_conhecimento VALUES (1078, 'Instituições Monetárias e Financeiras do Brasil', 310);
INSERT INTO public.area_conhecimento VALUES (1079, 'Finanças Públicas Internas', 310);
INSERT INTO public.area_conhecimento VALUES (1080, 'Política Fiscal do Brasil', 310);
INSERT INTO public.area_conhecimento VALUES (1081, 'Crescimento e Desenvolvimento Econômico', 311);
INSERT INTO public.area_conhecimento VALUES (1082, 'Teoria e Política de Planejamento Econômico', 311);
INSERT INTO public.area_conhecimento VALUES (1083, 'Flutuações Cíclicas e Projeções Econômicas', 311);
INSERT INTO public.area_conhecimento VALUES (1084, 'Inflação', 311);
INSERT INTO public.area_conhecimento VALUES (1085, 'Teoria do Comércio Internacional', 312);
INSERT INTO public.area_conhecimento VALUES (1086, 'Relações do Comércio; Política Comercial; Integração Econômica', 312);
INSERT INTO public.area_conhecimento VALUES (1087, 'Balanço de Pagamentos; Finanças Internacionais', 312);
INSERT INTO public.area_conhecimento VALUES (1088, 'Investimentos Internacionais e Ajuda Externa', 312);
INSERT INTO public.area_conhecimento VALUES (1089, 'Treinamento e Alocação de Mão-de-Obra; Oferta de Mão-de-Obra e Força de Trabalho', 313);
INSERT INTO public.area_conhecimento VALUES (1090, 'Mercado de Trabalho; Política do Governo', 313);
INSERT INTO public.area_conhecimento VALUES (1091, 'Sindicatos, Dissídios Coletivos, Relações de Emprego (Empregador/Empregado)', 313);
INSERT INTO public.area_conhecimento VALUES (1092, 'Capital Humano', 313);
INSERT INTO public.area_conhecimento VALUES (1093, 'Demografia Econômica', 313);
INSERT INTO public.area_conhecimento VALUES (1094, 'Organização Industrial e Estudos Industriais', 314);
INSERT INTO public.area_conhecimento VALUES (1095, 'Mudança Tecnológica', 314);
INSERT INTO public.area_conhecimento VALUES (1096, 'Economia dos Programas de Bem-Estar Social', 315);
INSERT INTO public.area_conhecimento VALUES (1097, 'Economia do Consumidor', 315);
INSERT INTO public.area_conhecimento VALUES (1098, 'Economia Regional', 316);
INSERT INTO public.area_conhecimento VALUES (1099, 'Economia Urbana', 316);
INSERT INTO public.area_conhecimento VALUES (1100, 'Renda e Tributação', 316);
INSERT INTO public.area_conhecimento VALUES (1101, 'Economia Agrária', 317);
INSERT INTO public.area_conhecimento VALUES (1102, 'Economia dos Recursos Naturais', 317);
INSERT INTO public.area_conhecimento VALUES (1103, 'História da Arquitetura e Urbanismo', 318);
INSERT INTO public.area_conhecimento VALUES (1104, 'Teoria da Arquitetura', 318);
INSERT INTO public.area_conhecimento VALUES (1105, 'História do Urbanismo', 318);
INSERT INTO public.area_conhecimento VALUES (1106, 'Teoria do Urbanismo', 318);
INSERT INTO public.area_conhecimento VALUES (1107, 'Planejamento e Projetos da Edificação', 319);
INSERT INTO public.area_conhecimento VALUES (1108, 'Planejamento e Projeto do Espaço Urbano', 319);
INSERT INTO public.area_conhecimento VALUES (1109, 'Planejamento e Projeto do Equipamento', 319);
INSERT INTO public.area_conhecimento VALUES (1110, 'Adequação Ambiental', 320);
INSERT INTO public.area_conhecimento VALUES (1111, 'Desenvolvimento Histórico do Paisagismo', 321);
INSERT INTO public.area_conhecimento VALUES (1112, 'Conceituação de Paisagismo e Metodologia do Paisagismo', 321);
INSERT INTO public.area_conhecimento VALUES (1113, 'Estudos de Organização do Espaço Exterior', 321);
INSERT INTO public.area_conhecimento VALUES (1114, 'Projetos de Espaços Livres Urbanos', 321);
INSERT INTO public.area_conhecimento VALUES (1115, 'Teoria do Planejamento Urbano e Regional', 322);
INSERT INTO public.area_conhecimento VALUES (1116, 'Teoria da Urbanização', 322);
INSERT INTO public.area_conhecimento VALUES (1117, 'Política Urbana', 322);
INSERT INTO public.area_conhecimento VALUES (1118, 'História Urbana', 322);
INSERT INTO public.area_conhecimento VALUES (1119, 'Informação, Cadastro e Mapeamento', 323);
INSERT INTO public.area_conhecimento VALUES (1120, 'Técnica de Previsão Urbana e Regional', 323);
INSERT INTO public.area_conhecimento VALUES (1121, 'Técnicas de Análise e Avaliação Urbana e Regional', 323);
INSERT INTO public.area_conhecimento VALUES (1122, 'Técnicas de Planejamento e Projeto Urbanos e Regionais', 323);
INSERT INTO public.area_conhecimento VALUES (1123, 'Administração Municipal e Urbana', 324);
INSERT INTO public.area_conhecimento VALUES (1124, 'Estudos da Habitação', 324);
INSERT INTO public.area_conhecimento VALUES (1125, 'Aspectos Sociais do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento VALUES (1126, 'Aspectos Econômicos do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento VALUES (1127, 'Aspectos Físico-Ambientais do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento VALUES (1128, 'Serviços Comunitários', 324);
INSERT INTO public.area_conhecimento VALUES (1129, 'Infra-Estruturas Urbanas e Regionais', 324);
INSERT INTO public.area_conhecimento VALUES (1130, 'Transporte e Tráfego Urbano e Regional', 324);
INSERT INTO public.area_conhecimento VALUES (1131, 'Legislação Urbana e Regional', 324);
INSERT INTO public.area_conhecimento VALUES (1132, 'Distribuição Espacial Geral', 325);
INSERT INTO public.area_conhecimento VALUES (1133, 'Distribuição Espacial Urbana', 325);
INSERT INTO public.area_conhecimento VALUES (1134, 'Distribuição Espacial Rural', 325);
INSERT INTO public.area_conhecimento VALUES (1135, 'Tendências Passadas', 326);
INSERT INTO public.area_conhecimento VALUES (1136, 'Taxas e Estimativas Correntes', 326);
INSERT INTO public.area_conhecimento VALUES (1137, 'Projeções', 326);
INSERT INTO public.area_conhecimento VALUES (1138, 'Fecundidade', 327);
INSERT INTO public.area_conhecimento VALUES (1139, 'Mortalidade', 327);
INSERT INTO public.area_conhecimento VALUES (1140, 'Migração', 327);
INSERT INTO public.area_conhecimento VALUES (1141, 'Casamento e Divórcio', 328);
INSERT INTO public.area_conhecimento VALUES (1142, 'Família e Reprodução', 328);
INSERT INTO public.area_conhecimento VALUES (1143, 'Distribuição Espacial', 329);
INSERT INTO public.area_conhecimento VALUES (1144, 'Natalidade, Mortalidade, Migração', 329);
INSERT INTO public.area_conhecimento VALUES (1145, 'Nupcialidade e Família', 329);
INSERT INTO public.area_conhecimento VALUES (1146, 'Métodos e Técnicas de Demografia Histórica', 329);
INSERT INTO public.area_conhecimento VALUES (1147, 'Política Populacional', 330);
INSERT INTO public.area_conhecimento VALUES (1148, 'Políticas de Redistribuição de População', 330);
INSERT INTO public.area_conhecimento VALUES (1149, 'Políticas de Planejamento Familiar', 330);
INSERT INTO public.area_conhecimento VALUES (1150, 'Teoria Geral da Informação', 332);
INSERT INTO public.area_conhecimento VALUES (1151, 'Processos da Comunicação', 332);
INSERT INTO public.area_conhecimento VALUES (1152, 'Representação da Informação', 332);
INSERT INTO public.area_conhecimento VALUES (1153, 'Teoria da Classificação', 333);
INSERT INTO public.area_conhecimento VALUES (1154, 'Métodos Quantitativos. Bibliometria', 333);
INSERT INTO public.area_conhecimento VALUES (1155, 'Técnicas de Recuperação de Informação', 333);
INSERT INTO public.area_conhecimento VALUES (1156, 'Processos de Disseminação da Informação', 333);
INSERT INTO public.area_conhecimento VALUES (1157, 'Organização de Arquivos', 334);
INSERT INTO public.area_conhecimento VALUES (1158, 'Teoria e Ética do Jornalismo', 336);
INSERT INTO public.area_conhecimento VALUES (1159, 'Organização Editorial de Jornais', 336);
INSERT INTO public.area_conhecimento VALUES (1160, 'Organização Comercial de Jornais', 336);
INSERT INTO public.area_conhecimento VALUES (1161, 'Jornalismo Especializado (Comunitário, Rural, Empresarial, Científico)', 336);
INSERT INTO public.area_conhecimento VALUES (1162, 'Radiodifusão', 337);
INSERT INTO public.area_conhecimento VALUES (1163, 'Videodifusão', 337);
INSERT INTO public.area_conhecimento VALUES (1164, 'Serviço Social do Trabalho', 341);
INSERT INTO public.area_conhecimento VALUES (1165, 'Serviço Social da Educação', 341);
INSERT INTO public.area_conhecimento VALUES (1166, 'Serviço Social do Menor', 341);
INSERT INTO public.area_conhecimento VALUES (1167, 'Serviço Social da Saúde', 341);
INSERT INTO public.area_conhecimento VALUES (1168, 'Serviço Social da Habitação', 341);
INSERT INTO public.area_conhecimento VALUES (1169, 'Teoria Sociológica', 350);
INSERT INTO public.area_conhecimento VALUES (1170, 'História da Sociologia', 350);
INSERT INTO public.area_conhecimento VALUES (1171, 'História dos Estados Unidos', 368);
INSERT INTO public.area_conhecimento VALUES (1172, 'História Latino-Americana', 368);
INSERT INTO public.area_conhecimento VALUES (1173, 'História do Brasil Colônia', 369);
INSERT INTO public.area_conhecimento VALUES (1174, 'História do Brasil Império', 369);
INSERT INTO public.area_conhecimento VALUES (1175, 'História do Brasil República', 369);
INSERT INTO public.area_conhecimento VALUES (1176, 'História Regional do Brasil', 369);
INSERT INTO public.area_conhecimento VALUES (1177, 'Geografia da População', 371);
INSERT INTO public.area_conhecimento VALUES (1178, 'Geografia Agrária', 371);
INSERT INTO public.area_conhecimento VALUES (1179, 'Geografia Urbana', 371);
INSERT INTO public.area_conhecimento VALUES (1180, 'Geografia Econômica', 371);
INSERT INTO public.area_conhecimento VALUES (1181, 'Geografia Política', 371);
INSERT INTO public.area_conhecimento VALUES (1182, 'Teoria do Desenvolvimento Regional', 372);
INSERT INTO public.area_conhecimento VALUES (1183, 'Regionalização', 372);
INSERT INTO public.area_conhecimento VALUES (1184, 'Análise Regional', 372);
INSERT INTO public.area_conhecimento VALUES (1185, 'História, Teorias e Sistemas em Psicologia', 373);
INSERT INTO public.area_conhecimento VALUES (1186, 'Metodologia, Instrumentação e Equipamento em Psicologia', 373);
INSERT INTO public.area_conhecimento VALUES (1187, 'Construção e Validade de Testes, Escalas e Outras Medidas Psicológicas', 373);
INSERT INTO public.area_conhecimento VALUES (1188, 'Técnicas de Processamento Estatístico, Matemático e Computacional em Psicologia', 373);
INSERT INTO public.area_conhecimento VALUES (1189, 'Processos Perceptuais e Motores', 374);
INSERT INTO public.area_conhecimento VALUES (1190, 'Processos de Aprendizagem, Memória e Motivação', 374);
INSERT INTO public.area_conhecimento VALUES (1191, 'Processos Cognitivos e Atencionais', 374);
INSERT INTO public.area_conhecimento VALUES (1192, 'Estados Subjetivos e Emoção', 374);
INSERT INTO public.area_conhecimento VALUES (1193, 'Neurologia, Eletrofisiologia e Comportamento', 375);
INSERT INTO public.area_conhecimento VALUES (1194, 'Processos Psico-Fisiológicos', 375);
INSERT INTO public.area_conhecimento VALUES (1195, 'Estimulação Elétrica e com Drogas; Comportamento', 375);
INSERT INTO public.area_conhecimento VALUES (1196, 'Psicobiologia', 375);
INSERT INTO public.area_conhecimento VALUES (1197, 'Estudos Naturalísticos do Comportamento Animal', 376);
INSERT INTO public.area_conhecimento VALUES (1198, 'Mecanismos Instintivos e Processos Sociais em Animais', 376);
INSERT INTO public.area_conhecimento VALUES (1199, 'Relações Interpessoais', 377);
INSERT INTO public.area_conhecimento VALUES (1200, 'Processos Grupais e de Comunicação', 377);
INSERT INTO public.area_conhecimento VALUES (1201, 'Papéis e Estruturas Sociais; Indivíduo', 377);
INSERT INTO public.area_conhecimento VALUES (1202, 'Processos Perceptuais e Cognitivos; Desenvolvimento', 379);
INSERT INTO public.area_conhecimento VALUES (1203, 'Desenvolvimento Social e da Personalidade', 379);
INSERT INTO public.area_conhecimento VALUES (1204, 'Planejamento Institucional', 380);
INSERT INTO public.area_conhecimento VALUES (1205, 'Programação de Condições de Ensino', 380);
INSERT INTO public.area_conhecimento VALUES (1206, 'Treinamento de Pessoal', 380);
INSERT INTO public.area_conhecimento VALUES (1207, 'Aprendizagem e Desempenho Acadêmicos', 380);
INSERT INTO public.area_conhecimento VALUES (1208, 'Ensino e Aprendizagem na Sala de Aula', 380);
INSERT INTO public.area_conhecimento VALUES (1209, 'Análise Institucional', 381);
INSERT INTO public.area_conhecimento VALUES (1210, 'Recrutamento e Seleção de Pessoal', 381);
INSERT INTO public.area_conhecimento VALUES (1211, 'Treinamento e Avaliação', 381);
INSERT INTO public.area_conhecimento VALUES (1212, 'Fatores Humanos no Trabalho', 381);
INSERT INTO public.area_conhecimento VALUES (1213, 'Planejamento Ambiental e Comportamento Humano', 381);
INSERT INTO public.area_conhecimento VALUES (1214, 'Intervenção Terapêutica', 382);
INSERT INTO public.area_conhecimento VALUES (1215, 'Programas de Atendimento Comunitário', 382);
INSERT INTO public.area_conhecimento VALUES (1216, 'Treinamento e Reabilitação', 382);
INSERT INTO public.area_conhecimento VALUES (1217, 'Desvios da Conduta', 382);
INSERT INTO public.area_conhecimento VALUES (1218, 'Distúrbios da Linguagem', 382);
INSERT INTO public.area_conhecimento VALUES (1219, 'Distúrbios Psicossomáticos', 382);
INSERT INTO public.area_conhecimento VALUES (1220, 'Filosofia da Educação', 383);
INSERT INTO public.area_conhecimento VALUES (1221, 'História da Educação', 383);
INSERT INTO public.area_conhecimento VALUES (1222, 'Sociologia da Educação', 383);
INSERT INTO public.area_conhecimento VALUES (1223, 'Antropologia Educacional', 383);
INSERT INTO public.area_conhecimento VALUES (1224, 'Economia da Educação', 383);
INSERT INTO public.area_conhecimento VALUES (1225, 'Psicologia Educacional', 383);
INSERT INTO public.area_conhecimento VALUES (1226, 'Administração de Sistemas Educacionais', 384);
INSERT INTO public.area_conhecimento VALUES (1227, 'Administração de Unidades Educativas', 384);
INSERT INTO public.area_conhecimento VALUES (1228, 'Política Educacional', 385);
INSERT INTO public.area_conhecimento VALUES (1229, 'Planejamento Educacional', 385);
INSERT INTO public.area_conhecimento VALUES (1230, 'Avaliação de Sistemas, Instituições, Planos e Programas Educacionais', 385);
INSERT INTO public.area_conhecimento VALUES (1231, 'Teorias da Instrução', 386);
INSERT INTO public.area_conhecimento VALUES (1232, 'Métodos e Técnicas de Ensino', 386);
INSERT INTO public.area_conhecimento VALUES (1233, 'Tecnologia Educacional', 386);
INSERT INTO public.area_conhecimento VALUES (1234, 'Avaliação da Aprendizagem', 386);
INSERT INTO public.area_conhecimento VALUES (1235, 'Teoria Geral de Planejamento e Desenvolvimento Curricular', 387);
INSERT INTO public.area_conhecimento VALUES (1236, 'Currículos Específicos para Níveis e Tipos de Educação', 387);
INSERT INTO public.area_conhecimento VALUES (1237, 'Orientação Educacional', 388);
INSERT INTO public.area_conhecimento VALUES (1238, 'Orientação Vocacional', 388);
INSERT INTO public.area_conhecimento VALUES (1239, 'Educação de Adultos', 389);
INSERT INTO public.area_conhecimento VALUES (1240, 'Educação Permanente', 389);
INSERT INTO public.area_conhecimento VALUES (1241, 'Educação Rural', 389);
INSERT INTO public.area_conhecimento VALUES (1242, 'Educação em Periferias Urbanas', 389);
INSERT INTO public.area_conhecimento VALUES (1243, 'Educação Especial', 389);
INSERT INTO public.area_conhecimento VALUES (1244, 'Educação Pré-Escolar', 389);
INSERT INTO public.area_conhecimento VALUES (1245, 'Ensino Profissionalizante', 389);
INSERT INTO public.area_conhecimento VALUES (1246, 'Teoria Política Clássica', 390);
INSERT INTO public.area_conhecimento VALUES (1247, 'Teoria Política Medieval', 390);
INSERT INTO public.area_conhecimento VALUES (1248, 'Teoria Política Moderna', 390);
INSERT INTO public.area_conhecimento VALUES (1249, 'Teoria Política Contemporânea', 390);
INSERT INTO public.area_conhecimento VALUES (1250, 'Estrutura e Transformação do Estado', 391);
INSERT INTO public.area_conhecimento VALUES (1251, 'Sistemas Governamentais Comparados', 391);
INSERT INTO public.area_conhecimento VALUES (1252, 'Relações Intergovernamentais', 391);
INSERT INTO public.area_conhecimento VALUES (1253, 'Estudos do Poder Local', 391);
INSERT INTO public.area_conhecimento VALUES (1254, 'Instituições Governamentais Específicas', 391);
INSERT INTO public.area_conhecimento VALUES (1255, 'Estudos Eleitorais e Partidos Políticos', 392);
INSERT INTO public.area_conhecimento VALUES (1256, 'Atitude e Ideologias Políticas', 392);
INSERT INTO public.area_conhecimento VALUES (1257, 'Conflitos e Coalizões Políticas', 392);
INSERT INTO public.area_conhecimento VALUES (1258, 'Comportamento Legislativo', 392);
INSERT INTO public.area_conhecimento VALUES (1259, 'Classes Sociais e Grupos de Interesse', 392);
INSERT INTO public.area_conhecimento VALUES (1260, 'Análise do Processo Decisório', 393);
INSERT INTO public.area_conhecimento VALUES (1261, 'Análise Institucional', 393);
INSERT INTO public.area_conhecimento VALUES (1262, 'Técnicas de Antecipação', 393);
INSERT INTO public.area_conhecimento VALUES (1263, 'Política Externa do Brasil', 394);
INSERT INTO public.area_conhecimento VALUES (1264, 'Organizações Internacionais', 394);
INSERT INTO public.area_conhecimento VALUES (1265, 'Integração Internacional, Conflito, Guerra e Paz', 394);
INSERT INTO public.area_conhecimento VALUES (1266, 'Relações Internacionais, Bilaterais e Multilaterais', 394);
INSERT INTO public.area_conhecimento VALUES (1267, 'Teoria da Arte', 415);
INSERT INTO public.area_conhecimento VALUES (1268, 'História da Arte', 415);
INSERT INTO public.area_conhecimento VALUES (1269, 'Crítica da Arte', 415);
INSERT INTO public.area_conhecimento VALUES (1270, 'Pintura', 416);
INSERT INTO public.area_conhecimento VALUES (1271, 'Desenho', 416);
INSERT INTO public.area_conhecimento VALUES (1272, 'Gravura', 416);
INSERT INTO public.area_conhecimento VALUES (1273, 'Escultura', 416);
INSERT INTO public.area_conhecimento VALUES (1274, 'Cerâmica', 416);
INSERT INTO public.area_conhecimento VALUES (1275, 'Tecelagem', 416);
INSERT INTO public.area_conhecimento VALUES (1276, 'Regência', 417);
INSERT INTO public.area_conhecimento VALUES (1277, 'Instrumentação Musical', 417);
INSERT INTO public.area_conhecimento VALUES (1278, 'Composição Musical', 417);
INSERT INTO public.area_conhecimento VALUES (1279, 'Canto', 417);
INSERT INTO public.area_conhecimento VALUES (1280, 'Execução da Dança', 418);
INSERT INTO public.area_conhecimento VALUES (1281, 'Coreografia', 418);
INSERT INTO public.area_conhecimento VALUES (1282, 'Dramaturgia', 419);
INSERT INTO public.area_conhecimento VALUES (1283, 'Direção Teatral', 419);
INSERT INTO public.area_conhecimento VALUES (1284, 'Cenografia', 419);
INSERT INTO public.area_conhecimento VALUES (1285, 'Interpretação Teatral', 419);
INSERT INTO public.area_conhecimento VALUES (1286, 'Administração e Produção de Filmes', 422);
INSERT INTO public.area_conhecimento VALUES (1287, 'Roteiro e Direção Cinematográficos', 422);
INSERT INTO public.area_conhecimento VALUES (1288, 'Técnicas de Registro e Processamento de Filmes', 422);
INSERT INTO public.area_conhecimento VALUES (1289, 'Interpretação Cinematográfica', 422);


--
-- TOC entry 3490 (class 0 OID 17327)
-- Dependencies: 218
-- Data for Name: artigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artigo VALUES (3, '2023-05-14', 'Técnicas de Criação de Questões Aleatórias', 'https://www.linkedin.com/in/leandro-rocha-musser-carneiro/', 54, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.');


--
-- TOC entry 3492 (class 0 OID 17333)
-- Dependencies: 220
-- Data for Name: autor_artigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autor_artigo VALUES (3, 'Leandro Musser');


--
-- TOC entry 3493 (class 0 OID 17336)
-- Dependencies: 221
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso VALUES (1, 'TADS');
INSERT INTO public.curso VALUES (2, 'Ciência da Computação');


--
-- TOC entry 3495 (class 0 OID 17340)
-- Dependencies: 223
-- Data for Name: cursos_unidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cursos_unidade VALUES (1, 'Presencial', 1, 1);
INSERT INTO public.cursos_unidade VALUES (2, 'Presencial', 1, 2);


--
-- TOC entry 3497 (class 0 OID 17344)
-- Dependencies: 225
-- Data for Name: figura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.figura VALUES (2, 'https:\/\/iili.io\/HUkgmw7.png', 'Foto Leandro Musser', 53);


--
-- TOC entry 3499 (class 0 OID 17350)
-- Dependencies: 227
-- Data for Name: instituicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instituicao VALUES (1, 'UERJ', '33.540.014/0001-57');


--
-- TOC entry 3501 (class 0 OID 17356)
-- Dependencies: 229
-- Data for Name: opcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.opcao VALUES (113, 'Uma constante é um determinado valor fixo que não se modifica ao longo do tempo, durante a execução de um programa.', 50);
INSERT INTO public.opcao VALUES (114, 'Uma variável corresponde a uma posição de memória, cujo conteúdo pode variar ao longo do tempo durante a execução de um programa.', 50);
INSERT INTO public.opcao VALUES (115, 'Um valor lógico é utilizado em proposições lógicas e só pode assumir os valores Falso ou Verdadeiro.', 50);
INSERT INTO public.opcao VALUES (116, 'Um valor do tipo literal pode assumir sequência de caracteres, como letras e números, exceto símbolos especiais.', 50);
INSERT INTO public.opcao VALUES (117, 'Nada', 51);
INSERT INTO public.opcao VALUES (118, 'Opção aleatória', 51);
INSERT INTO public.opcao VALUES (119, 'Tudo', 51);
INSERT INTO public.opcao VALUES (120, 'Teste', 51);
INSERT INTO public.opcao VALUES (121, '1', 52);
INSERT INTO public.opcao VALUES (122, 'Óbvio que é 2', 52);
INSERT INTO public.opcao VALUES (123, '3', 52);
INSERT INTO public.opcao VALUES (124, '4', 52);
INSERT INTO public.opcao VALUES (125, '128', 53);
INSERT INTO public.opcao VALUES (126, '256', 53);
INSERT INTO public.opcao VALUES (127, '1023', 53);
INSERT INTO public.opcao VALUES (128, '49501', 53);
INSERT INTO public.opcao VALUES (129, 'Teste', 54);
INSERT INTO public.opcao VALUES (130, 'Random', 54);
INSERT INTO public.opcao VALUES (131, 'Abc', 54);
INSERT INTO public.opcao VALUES (132, 'Olá, mundo!', 54);
INSERT INTO public.opcao VALUES (133, 'Saindo codificando ideias que aparecem na mente em tempo real', 55);
INSERT INTO public.opcao VALUES (134, 'Construindo primeiro o banco de dados com entidades com atributos aleatórios que eu acho que podem ser úteis, mas sem certeza de nada', 55);
INSERT INTO public.opcao VALUES (135, 'Criando o máximo de recursos possíveis no menor tempo sem se importar com os efeitos disso, pois o importante é o agora', 55);
INSERT INTO public.opcao VALUES (136, 'Planejando tudo antes', 55);


--
-- TOC entry 3503 (class 0 OID 17362)
-- Dependencies: 231
-- Data for Name: pontuacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pontuacao VALUES (4, 200, 1, 0, 500, 2);


--
-- TOC entry 3505 (class 0 OID 17370)
-- Dependencies: 233
-- Data for Name: questao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questao VALUES (50, 'Analise', 'Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:', 13, 116);
INSERT INTO public.questao VALUES (51, 'Aplicação', 'O que faz o algoritmo XYZ?', 13, 118);
INSERT INTO public.questao VALUES (52, 'Analise', 'Diga qual vai ser o valor de a no final da execução.

int a = 1;
a++;', 9, 122);
INSERT INTO public.questao VALUES (53, 'Aplicação', 'Usando Python, calcule a quantidade de Pixels na seguinte imagem', 11, 128);
INSERT INTO public.questao VALUES (54, 'Analise', 'Questão aleatória para criar volume', 10, 132);
INSERT INTO public.questao VALUES (55, 'Conhecimento', 'Como construir um sistema do jeito certo?', 14, 136);


--
-- TOC entry 3507 (class 0 OID 17376)
-- Dependencies: 235
-- Data for Name: questionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questionario VALUES (13, 'Prova de Programação', 2, 60, 60, 'Mediano', 13, '2025-12-19 20:10:50');
INSERT INTO public.questionario VALUES (14, 'Prova de Teste', 2, 999, 999, 'Difícil', 11, '2025-12-19 21:13:44');


--
-- TOC entry 3509 (class 0 OID 17380)
-- Dependencies: 237
-- Data for Name: questoes_questionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questoes_questionario VALUES (53, 14);
INSERT INTO public.questoes_questionario VALUES (50, 13);
INSERT INTO public.questoes_questionario VALUES (51, 13);


--
-- TOC entry 3517 (class 0 OID 17535)
-- Dependencies: 245
-- Data for Name: resultado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3510 (class 0 OID 17383)
-- Dependencies: 238
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tema VALUES (1, 'Java');
INSERT INTO public.tema VALUES (2, 'C#');
INSERT INTO public.tema VALUES (3, 'Python');
INSERT INTO public.tema VALUES (4, 'Ruby');
INSERT INTO public.tema VALUES (5, 'Algoritmos e Estrutura de Dados');
INSERT INTO public.tema VALUES (6, 'Tipos de linguagem');
INSERT INTO public.tema VALUES (7, 'Teste');


--
-- TOC entry 3512 (class 0 OID 17387)
-- Dependencies: 240
-- Data for Name: temas_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas_areas VALUES (2, 1, 3);
INSERT INTO public.temas_areas VALUES (5, 2, 3);
INSERT INTO public.temas_areas VALUES (6, 2, 2);
INSERT INTO public.temas_areas VALUES (7, 2, 1);
INSERT INTO public.temas_areas VALUES (9, 1, 466);
INSERT INTO public.temas_areas VALUES (10, 2, 466);
INSERT INTO public.temas_areas VALUES (11, 3, 466);
INSERT INTO public.temas_areas VALUES (12, 4, 466);
INSERT INTO public.temas_areas VALUES (13, 5, 466);
INSERT INTO public.temas_areas VALUES (14, 6, 466);


--
-- TOC entry 3515 (class 0 OID 17392)
-- Dependencies: 243
-- Data for Name: unidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidade VALUES (1, 'UERJ-ZO', '23070-200', 'RJ', 'Rio de Janeiro', 'Campo Grande', 'Av. Manuel Caldeira de Alvarenga', '1203', 1);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 215
-- Name: aluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_id_seq', 2, true);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 217
-- Name: area_conhecimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_conhecimento_id_seq', 1289, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 219
-- Name: artigo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artigo_id_seq', 3, true);


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 222
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 2, true);


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 224
-- Name: cursos_unidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_unidade_id_seq', 2, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 226
-- Name: figura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.figura_id_seq', 2, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 228
-- Name: instituicao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instituicao_id_seq', 1, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 230
-- Name: opcao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opcao_id_seq', 136, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 232
-- Name: pontuacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pontuacao_id_seq', 4, true);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 234
-- Name: questao2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questao2_id_seq', 55, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 236
-- Name: questionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionario_id_seq', 14, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 246
-- Name: resultado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resultado_id_seq', 1, false);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 239
-- Name: tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tema_id_seq', 7, true);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 241
-- Name: temas_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_areas_id_seq', 14, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 242
-- Name: temas_areas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_areas_seq', 1, false);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 244
-- Name: unidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidade_id_seq', 1, true);


--
-- TOC entry 3287 (class 2606 OID 17413)
-- Name: aluno aluno_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_email_key UNIQUE (email);


--
-- TOC entry 3289 (class 2606 OID 17415)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 17417)
-- Name: area_conhecimento area_conhecimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento
    ADD CONSTRAINT area_conhecimento_pkey PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 17419)
-- Name: artigo artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo
    ADD CONSTRAINT artigo_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 17421)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 17423)
-- Name: cursos_unidade cursos_unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_unidade
    ADD CONSTRAINT cursos_unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 17425)
-- Name: figura figura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura
    ADD CONSTRAINT figura_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 17427)
-- Name: instituicao instituicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao
    ADD CONSTRAINT instituicao_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 17429)
-- Name: opcao opcao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao
    ADD CONSTRAINT opcao_pkey PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 17431)
-- Name: pontuacao pontuacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pontuacao
    ADD CONSTRAINT pontuacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 17433)
-- Name: questao questao2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao2_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 17435)
-- Name: questionario questionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionario
    ADD CONSTRAINT questionario_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 17437)
-- Name: questoes_questionario questoes_questionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questoes_questionario_pkey PRIMARY KEY (questao_id, questionario_id);


--
-- TOC entry 3321 (class 2606 OID 17586)
-- Name: resultado resultado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado
    ADD CONSTRAINT resultado_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 17439)
-- Name: tema tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema
    ADD CONSTRAINT tema_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 17441)
-- Name: temas_areas temas_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT temas_areas_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 17443)
-- Name: unidade unidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT unidade_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 17445)
-- Name: temas_areas unique_temas_areas_tema_area; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT unique_temas_areas_tema_area UNIQUE (tema_id, area_conhecimento_id);


--
-- TOC entry 3342 (class 2620 OID 17577)
-- Name: pontuacao atualizar_pontuacao; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER atualizar_pontuacao BEFORE UPDATE ON public.pontuacao FOR EACH ROW EXECUTE FUNCTION public.function_atualizar_pontuacao();


--
-- TOC entry 3343 (class 2620 OID 17579)
-- Name: resultado calcular_pontuacao; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER calcular_pontuacao AFTER UPDATE ON public.resultado FOR EACH ROW EXECUTE FUNCTION public.function_calcular_pontuacao();


--
-- TOC entry 3341 (class 2620 OID 17575)
-- Name: aluno criar_pontuacao_aluno; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER criar_pontuacao_aluno AFTER INSERT ON public.aluno FOR EACH ROW EXECUTE FUNCTION public.function_criar_pontuacao();


--
-- TOC entry 3330 (class 2606 OID 17448)
-- Name: pontuacao aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pontuacao
    ADD CONSTRAINT aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.aluno(id);


--
-- TOC entry 3339 (class 2606 OID 17540)
-- Name: resultado aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado
    ADD CONSTRAINT aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.aluno(id);


--
-- TOC entry 3336 (class 2606 OID 17453)
-- Name: temas_areas area_conhecimento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT area_conhecimento_id_fkey FOREIGN KEY (area_conhecimento_id) REFERENCES public.area_conhecimento(id);


--
-- TOC entry 3323 (class 2606 OID 17458)
-- Name: area_conhecimento area_conhecimento_pai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento
    ADD CONSTRAINT area_conhecimento_pai FOREIGN KEY (id_pai) REFERENCES public.area_conhecimento(id);


--
-- TOC entry 3325 (class 2606 OID 17463)
-- Name: autor_artigo artigo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_artigo
    ADD CONSTRAINT artigo_id_fkey FOREIGN KEY (artigo_id) REFERENCES public.artigo(id);


--
-- TOC entry 3326 (class 2606 OID 17468)
-- Name: cursos_unidade curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_unidade
    ADD CONSTRAINT curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 3322 (class 2606 OID 17473)
-- Name: aluno cursos_unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT cursos_unidade_id_fkey FOREIGN KEY (cursos_unidade_id) REFERENCES public.cursos_unidade(id);


--
-- TOC entry 3338 (class 2606 OID 17478)
-- Name: unidade instituicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidade
    ADD CONSTRAINT instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES public.instituicao(id);


--
-- TOC entry 3331 (class 2606 OID 17483)
-- Name: questao opcao_correta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT opcao_correta_fkey FOREIGN KEY (opcao_correta) REFERENCES public.opcao(id);


--
-- TOC entry 3329 (class 2606 OID 17488)
-- Name: opcao questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3334 (class 2606 OID 17493)
-- Name: questoes_questionario questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 3324 (class 2606 OID 17498)
-- Name: artigo questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 3328 (class 2606 OID 17503)
-- Name: figura questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 3335 (class 2606 OID 17508)
-- Name: questoes_questionario questionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questionario_id_fkey FOREIGN KEY (questionario_id) REFERENCES public.questionario(id);


--
-- TOC entry 3340 (class 2606 OID 17545)
-- Name: resultado questionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resultado
    ADD CONSTRAINT questionario_id_fkey FOREIGN KEY (questionario_id) REFERENCES public.questionario(id);


--
-- TOC entry 3337 (class 2606 OID 17513)
-- Name: temas_areas tema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES public.tema(id);


--
-- TOC entry 3332 (class 2606 OID 17518)
-- Name: questao temas_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT temas_areas_id_fkey FOREIGN KEY (temas_areas_id) REFERENCES public.temas_areas(id);


--
-- TOC entry 3333 (class 2606 OID 17523)
-- Name: questionario temas_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionario
    ADD CONSTRAINT temas_areas_id_fkey FOREIGN KEY (temas_areas_id) REFERENCES public.temas_areas(id) NOT VALID;


--
-- TOC entry 3327 (class 2606 OID 17528)
-- Name: cursos_unidade unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos_unidade
    ADD CONSTRAINT unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES public.unidade(id);


-- Completed on 2023-06-21 21:46:26 UTC

--
-- PostgreSQL database dump complete
--

