--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-05-15 20:21:47 -03

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

--
-- TOC entry 843 (class 1247 OID 83918)
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
-- TOC entry 840 (class 1247 OID 83910)
-- Name: dificuldade; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.dificuldade AS ENUM (
    'Fácil',
    'Mediano',
    'Difícil'
);


ALTER TYPE public.dificuldade OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 83932)
-- Name: area_conhecimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area_conhecimento (
    id integer NOT NULL,
    nome character varying(255),
    id_pai integer
);


ALTER TABLE public.area_conhecimento OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 83931)
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
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 209
-- Name: area_conhecimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.area_conhecimento_id_seq OWNED BY public.area_conhecimento.id;


--
-- TOC entry 221 (class 1259 OID 84047)
-- Name: artigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artigo (
    id integer NOT NULL,
    data_publicacao date,
    titulo character varying(255),
    url character varying(255),
    questao_id integer
);


ALTER TABLE public.artigo OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 84046)
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
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 220
-- Name: artigo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artigo_id_seq OWNED BY public.artigo.id;


--
-- TOC entry 222 (class 1259 OID 84060)
-- Name: autor_artigo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor_artigo (
    artigo_id integer NOT NULL,
    autor character varying(255)
);


ALTER TABLE public.autor_artigo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 84033)
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
-- TOC entry 218 (class 1259 OID 84032)
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
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 218
-- Name: figura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.figura_id_seq OWNED BY public.figura.id;


--
-- TOC entry 217 (class 1259 OID 84019)
-- Name: opcao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opcao (
    id integer NOT NULL,
    texto text,
    questao_id integer
);


ALTER TABLE public.opcao OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 84018)
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
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 216
-- Name: opcao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opcao_id_seq OWNED BY public.opcao.id;


--
-- TOC entry 226 (class 1259 OID 92163)
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
-- TOC entry 225 (class 1259 OID 92162)
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
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 225
-- Name: questao2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questao2_id_seq OWNED BY public.questao.id;


--
-- TOC entry 214 (class 1259 OID 83966)
-- Name: questionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionario (
    id integer NOT NULL,
    titulo character varying(255),
    qtd_questoes integer,
    tempo_duracao integer,
    tempo_disponivel integer,
    nivel_dificuldade public.dificuldade
);


ALTER TABLE public.questionario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 83965)
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
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 213
-- Name: questionario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionario_id_seq OWNED BY public.questionario.id;


--
-- TOC entry 215 (class 1259 OID 84003)
-- Name: questoes_questionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questoes_questionario (
    questao_id integer NOT NULL,
    questionario_id integer NOT NULL
);


ALTER TABLE public.questoes_questionario OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 83944)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tema (
    id integer NOT NULL,
    nome character varying(255)
);


ALTER TABLE public.tema OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 83943)
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
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 211
-- Name: tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tema_id_seq OWNED BY public.tema.id;


--
-- TOC entry 224 (class 1259 OID 92142)
-- Name: temas_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas_areas (
    id integer NOT NULL,
    tema_id integer NOT NULL,
    area_conhecimento_id integer NOT NULL
);


ALTER TABLE public.temas_areas OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 92141)
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
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 223
-- Name: temas_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_areas_id_seq OWNED BY public.temas_areas.id;


--
-- TOC entry 227 (class 1259 OID 92338)
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
-- TOC entry 4239 (class 2604 OID 83935)
-- Name: area_conhecimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento ALTER COLUMN id SET DEFAULT nextval('public.area_conhecimento_id_seq'::regclass);


--
-- TOC entry 4244 (class 2604 OID 84050)
-- Name: artigo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo ALTER COLUMN id SET DEFAULT nextval('public.artigo_id_seq'::regclass);


--
-- TOC entry 4243 (class 2604 OID 84036)
-- Name: figura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura ALTER COLUMN id SET DEFAULT nextval('public.figura_id_seq'::regclass);


--
-- TOC entry 4242 (class 2604 OID 84022)
-- Name: opcao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao ALTER COLUMN id SET DEFAULT nextval('public.opcao_id_seq'::regclass);


--
-- TOC entry 4246 (class 2604 OID 92166)
-- Name: questao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao ALTER COLUMN id SET DEFAULT nextval('public.questao2_id_seq'::regclass);


--
-- TOC entry 4241 (class 2604 OID 83969)
-- Name: questionario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionario ALTER COLUMN id SET DEFAULT nextval('public.questionario_id_seq'::regclass);


--
-- TOC entry 4240 (class 2604 OID 83947)
-- Name: tema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema ALTER COLUMN id SET DEFAULT nextval('public.tema_id_seq'::regclass);


--
-- TOC entry 4245 (class 2604 OID 92145)
-- Name: temas_areas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas ALTER COLUMN id SET DEFAULT nextval('public.temas_areas_id_seq'::regclass);


--
-- TOC entry 4418 (class 0 OID 83932)
-- Dependencies: 210
-- Data for Name: area_conhecimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1, 'Ciências Exatas e da Terra', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (2, 'Ciências Biológicas', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (3, 'Engenharias', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (4, 'Ciências da Saúde', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (5, 'Ciências Agrárias', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (6, 'Ciências Sociais Aplicadas', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (7, 'Ciências Humanas', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (8, 'Linguística, Letras e Artes', NULL);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (9, 'Matemática', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (10, 'Probabilidade e Estatística', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (11, 'Ciência da Computação', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (12, 'Astronomia', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (13, 'Física', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (14, 'Química', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (15, 'GeoCiências', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (16, 'Oceanografia', 1);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (17, 'Biologia Geral', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (18, 'Genética', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (19, 'Botânica', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (20, 'Zoologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (21, 'Ecologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (22, 'Morfologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (23, 'Fisiologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (24, 'Bioquímica', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (25, 'Biofísica', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (26, 'Farmacologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (27, 'Imunologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (28, 'Microbiologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (29, 'Parasitologia', 2);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (30, 'Engenharia Civil', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (31, 'Engenharia de Minas', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (32, 'Engenharia de Materiais e Metalúrgica', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (33, 'Engenharia Elétrica', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (34, 'Engenharia Mecânica', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (35, 'Engenharia Química', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (36, 'Engenharia Sanitária', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (37, 'Engenharia de Produção', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (38, 'Engenharia Nuclear', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (39, 'Engenharia de Transportes', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (40, 'Engenharia Naval e Oceânica', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (41, 'Engenharia Aeroespacial', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (42, 'Engenharia Biomédica', 3);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (43, 'Medicina', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (44, 'Odontologia', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (45, 'Farmácia', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (46, 'Enfermagem', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (47, 'Nutrição', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (48, 'Saúde Coletiva', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (49, 'Fonoaudiologia', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (50, 'Fisioterapia e Terapia Ocupacional', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (51, 'Educação Física', 4);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (52, 'Agronomia', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (53, 'Recursos Florestais e Engenharia Florestal', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (54, 'Engenharia Agrícola', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (55, 'Zootecnia', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (56, 'Medicina Veterinária', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (57, 'Recursos Pesqueiros e Engenharia de Pesca', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (58, 'Ciência e Tecnologia de Alimentos', 5);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (59, 'Direito', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (60, 'Administração', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (61, 'Economia', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (62, 'Arquitetura e Urbanismo', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (63, 'Planejamento Urbano e Regional', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (64, 'Demografia', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (65, 'Ciência da Informação', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (66, 'Museologia', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (67, 'Comunicação', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (68, 'Serviço Social', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (69, 'Economia Doméstica', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (70, 'Desenho Industrial', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (71, 'Turismo', 6);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (72, 'Filosofia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (73, 'Sociologia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (74, 'Antropologia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (75, 'Arqueologia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (76, 'História', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (77, 'Geografia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (78, 'Psicologia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (79, 'Educação', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (80, 'Ciência Política', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (81, 'Teologia', 7);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (82, 'Linguística', 8);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (83, 'Letras', 8);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (84, 'Artes', 8);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (85, 'Álgebra', 9);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (86, 'Análise', 9);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (87, 'Geometria e Topologia', 9);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (88, 'Matemática Aplicada', 9);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (89, 'Probabilidade', 10);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (90, 'Estatística', 10);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (91, 'Probabilidade e Estatística Aplicadas', 10);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (92, 'Teoria da Computação', 11);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (93, 'Matemática da Computação', 11);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (94, 'Metodologia e Técnicas da Computação', 11);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (95, 'Sistemas de Computação', 11);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (96, 'Astronomia de Posição e Mecânica Celeste', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (97, 'Astrofísica Estelar', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (98, 'Astrofísica do Meio Interestelar', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (99, 'Astrofísica Extragaláctica', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (100, 'Astrofísica do Sistema Solar', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (101, 'Instrumentação Astronômica', 12);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (102, 'Física Geral', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (103, 'Áreas Clássicas de Fenomenologia e suas Aplicações', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (104, 'Física das Partículas Elementares e Campos', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (105, 'Física Nuclear', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (106, 'Física Atômica e Molecular', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (107, 'Física dos Fluidos, Física de Plasmas e Descargas Elétricas', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (108, 'Física da Matéria Condensada', 13);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (109, 'Química Orgânica', 14);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (110, 'Química Inorgânica', 14);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (111, 'Físico-Química', 14);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (112, 'Química Analítica', 14);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (113, 'Geologia', 15);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (114, 'Geofísica', 15);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (115, 'Meteorologia', 15);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (116, 'Geodesia', 15);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (117, 'Geografia Física', 15);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (118, 'Oceanografia Biológica', 16);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (119, 'Oceanografia Física', 16);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (120, 'Oceanografia Química', 16);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (121, 'Oceanografia Geológica', 16);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (122, 'Genética Quantitativa', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (123, 'Genética Molecular e de Micro-organismos', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (124, 'Genética Vegetal', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (125, 'Genética Animal', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (126, 'Genética Humana e Médica', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (127, 'Mutagênese', 18);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (128, 'Paleobotânica', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (129, 'Morfologia Vegetal', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (130, 'Fisiologia Vegetal', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (131, 'Taxonomia Vegetal', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (132, 'Fitogeografia', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (133, 'Botânica Aplicada', 19);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (134, 'Paleozoologia', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (135, 'Morfologia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (136, 'Fisiologia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (137, 'Comportamento Animal', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (138, 'Taxonomia dos Grupos Recentes', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (139, 'Zoologia Aplicada', 20);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (140, 'Ecologia Teórica', 21);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (141, 'Ecologia de Ecossistemas', 21);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (142, 'Ecologia Aplicada', 21);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (143, 'Citologia e Biologia Celular', 22);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (144, 'Embriologia', 22);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (145, 'Histologia', 22);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (146, 'Anatomia', 22);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (147, 'Fisiologia Geral', 23);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (148, 'Fisiologia de Órgãos e Sistemas', 23);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (149, 'Fisiologia do Esforço', 23);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (150, 'Fisiologia Comparada', 23);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (151, 'Química de Macromoléculas', 24);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (152, 'Bioquímica dos Micro-organismos', 24);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (153, 'Metabolismo e Bioenergética', 24);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (154, 'Biologia Molecular', 24);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (155, 'Enzimologia', 24);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (156, 'Biofísica Molecular', 25);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (157, 'Biofísica Celular', 25);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (158, 'Biofísica de Processos e Sistemas', 25);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (159, 'Radiologia e Fotobiologia', 25);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (160, 'Farmacologia Geral', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (161, 'Farmacologia Autonômica', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (162, 'Neuropsicofarmacologia', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (163, 'Farmacologia Cardiorrenal', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (164, 'Farmacologia Bioquímica e Molecular', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (165, 'Etnofarmacologia', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (166, 'Toxicologia', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (167, 'Farmacologia Clínica', 26);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (168, 'Imunoquímica', 27);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (169, 'Imunologia Celular', 27);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (170, 'Imunogenética', 27);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (171, 'Imunologia Aplicada', 27);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (172, 'Biologia e Fisiologia dos Micro-organismos', 28);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (173, 'Microbiologia Aplicada', 28);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (174, 'Protozoologia de Parasitos', 29);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (175, 'Helmintologia de Parasitos', 29);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (176, 'Entomologia e Malacologia de Parasitos e Vetores', 29);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (177, 'Construção Civil', 30);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (178, 'Estruturas', 30);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (179, 'Geotécnica', 30);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (180, 'Engenharia Hidráulica', 30);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (181, 'Infra-Estrutura de Transportes', 30);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (182, 'Pesquisa Mineral', 31);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (183, 'Lavra', 31);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (184, 'Tratamento de Minérios', 31);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (185, 'Instalações e Equipamentos Metalúrgicos', 32);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (186, 'Metalurgia Extrativa', 32);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (187, 'Metalurgia de Transformação', 32);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (188, 'Metalurgia Física', 32);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (189, 'Materiais não Metálicos', 32);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (190, 'Materiais Elétricos', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (191, 'Medidas Elétricas, Magnéticas e Eletrônicas; Instrumentação', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (192, 'Circuitos Elétricos, Magnéticos e Eletrônicos', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (193, 'Sistemas Elétricos de Potência', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (194, 'Eletrônica Industrial, Sistemas e Controles Eletrônicos', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (195, 'Telecomunicações', 33);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (196, 'Fenômenos de Transporte', 34);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (197, 'Engenharia Térmica', 34);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (198, 'Mecânica dos Sólidos', 34);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (199, 'Projetos de Máquinas', 34);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (200, 'Processos de Fabricação', 34);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (201, 'Processos Industriais de Engenharia Química', 35);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (202, 'Operações Industriais e Equipamentos para Engenharia Química', 35);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (203, 'Tecnologia Química', 35);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (204, 'Recursos Hídricos', 36);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (205, 'Tratamento de Águas de Abastecimento e Residuárias', 36);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (206, 'Saneamento Básico', 36);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (207, 'Saneamento Ambiental', 36);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (208, 'Gerência de Produção', 37);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (209, 'Pesquisa Operacional', 37);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (210, 'Engenharia do Produto', 37);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (211, 'Engenharia Econômica', 37);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (212, 'Aplicações de Radioisótopos', 38);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (213, 'Fusão Controlada', 38);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (214, 'Combustível Nuclear', 38);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (215, 'Tecnologia dos Reatores', 38);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (216, 'Planejamento de Transportes', 39);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (217, 'Veículos e Equipamentos de Controle', 39);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (218, 'Operações de Transportes', 39);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (219, 'Hidrodinâmica de Navios e Sistemas Oceânicos', 40);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (220, 'Estruturas Navais e Oceânicas', 40);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (221, 'Máquinas Marítimas', 40);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (222, 'Projeto de Navios e de Sistemas Oceânicos', 40);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (223, 'Tecnologia de Construção Naval e de Sistemas Oceânicas', 40);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (224, 'Aerodinâmica', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (225, 'Dinâmica de Vôo', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (226, 'Estruturas Aeroespaciais', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (227, 'Materiais e Processos para Engenharia Aeronáutica e Aeroespacial', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (228, 'Propulsão Aeroespacial', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (229, 'Sistemas Aeroespaciais', 41);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (230, 'Bioengenharia', 42);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (231, 'Engenharia Médica', 42);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (232, 'Clínica Médica', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (233, 'Cirurgia', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (234, 'Saúde Materno-Infantil', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (235, 'Psiquiatria', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (236, 'Anatomia Patológica e Patologia Clínica', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (237, 'Radiologia Médica', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (238, 'Medicina Legal e Deontologia', 43);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (239, 'Clínica Odontológica', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (240, 'Cirurgia Buco-Maxilo-Facial', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (241, 'Ortodontia', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (242, 'Odontopediatria', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (243, 'Periodontia', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (244, 'Endodontia', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (245, 'Radiologia Odontológica', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (246, 'Odontologia Social e Preventiva', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (247, 'Materiais Odontológicos', 44);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (248, 'Farmacotecnia', 45);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (249, 'Farmacognosia', 45);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (250, 'Análise Toxicológica', 45);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (251, 'Análise e Controle e Medicamentos', 45);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (252, 'Bromatologia', 45);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (253, 'Enfermagem Médico-Cirúrgica', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (254, 'Enfermagem Obstétrica', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (255, 'Enfermagem Pediátrica', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (256, 'Enfermagem Psiquiátrica', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (257, 'Enfermagem de Doenças Contagiosas', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (258, 'Enfermagem de Saúde Pública', 46);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (259, 'Bioquímica da Nutrição', 47);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (260, 'Dietética', 47);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (261, 'Análise Nutricional de População', 47);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (262, 'Desnutrição e Desenvolvimento Fisiológico', 47);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (263, 'Epidemiologia', 48);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (264, 'Saúde Publica', 48);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (265, 'Medicina Preventiva', 48);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (266, 'Ciência do Solo', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (267, 'Fitossanidade', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (268, 'Fitotecnia', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (269, 'Floricultura, Parques e Jardins', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (270, 'Agrometeorologia', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (271, 'Extensão Rural', 52);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (272, 'Silvicultura', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (273, 'Manejo Florestal', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (274, 'Técnicas e Operações Florestais', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (275, 'Tecnologia e Utilização de Produtos Florestais', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (276, 'Conservação da Natureza', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (277, 'Energia de Biomassa Florestal', 53);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (278, 'Máquinas e Implementos Agrícolas', 54);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (279, 'Engenharia de Água e Solo', 54);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (280, 'Engenharia de Processamento de Produtos Agrícolas', 54);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (281, 'Construções Rurais e Ambiência', 54);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (282, 'Energização Rural', 54);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (283, 'Ecologia dos Animais Domésticos e Etologia', 55);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (284, 'Genética e Melhoramento dos Animais Domésticos', 55);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (285, 'Nutrição e Alimentação Animal', 55);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (286, 'Pastagem e Forragicultura', 55);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (287, 'Produção Animal', 55);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (288, 'Clínica e Cirurgia Animal', 56);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (289, 'Medicina Veterinária Preventiva', 56);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (290, 'Patologia Animal', 56);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (291, 'Reprodução Animal', 56);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (292, 'Inspeção de Produtos de Origem Animal', 56);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (293, 'Recursos Pesqueiros Marinhos', 57);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (294, 'Recursos Pesqueiros de Águas Interiores', 57);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (295, 'Aquicultura', 57);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (296, 'Engenharia de Pesca', 57);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (297, 'Ciência de Alimentos', 58);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (298, 'Tecnologia de Alimentos', 58);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (299, 'Engenharia de Alimentos', 58);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (300, 'Teoria do Direito', 59);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (301, 'Direito Público', 59);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (302, 'Direito Privado', 59);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (303, 'Direitos Especiais', 59);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (304, 'Administração de Empresas', 60);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (305, 'Administração Pública', 60);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (306, 'Administração de Setores Específicos', 60);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (307, 'Ciências Contábeis', 60);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (308, 'Teoria Econômica', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (309, 'Métodos Quantitativos em Economia', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (310, 'Economia Monetária e Fiscal', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (311, 'Crescimento, Flutuações e Planejamento Econômico', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (312, 'Economia Internacional', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (313, 'Economia dos Recursos Humanos', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (314, 'Economia Industrial', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (315, 'Economia do Bem-Estar Social', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (316, 'Economia Regional e Urbana', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (317, 'Economias Agrária e dos Recursos Naturais', 61);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (318, 'Fundamentos de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (319, 'Projeto de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (320, 'Tecnologia de Arquitetura e Urbanismo', 62);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (321, 'Paisagismo', 62);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (322, 'Fundamentos do Planejamento Urbano e Regional', 63);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (323, 'Métodos e Técnicas do Planejamento Urbano e Regional', 63);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (324, 'Serviços Urbanos e Regionais', 63);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (325, 'Distribuição Espacial', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (326, 'Tendência Populacional', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (327, 'Componentes da Dinâmica Demográfica', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (328, 'Nupcialidade e Família', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (329, 'Demografia Histórica', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (330, 'Política Pública e População', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (331, 'Fontes de Dados Demográficos', 64);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (332, 'Teoria da Informação', 65);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (333, 'Biblioteconomia', 65);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (334, 'Arquivologia', 65);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (335, 'Teoria da Comunicação', 67);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (336, 'Jornalismo e Editoração', 67);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (337, 'Rádio e Televisão', 67);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (338, 'Relações Públicas e Propaganda', 67);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (339, 'Comunicação Visual', 67);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (340, 'Fundamentos do Serviço Social', 68);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (341, 'Serviço Social Aplicado', 68);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (342, 'Programação Visual', 70);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (343, 'Desenho de Produto', 70);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (344, 'História da Filosofia', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (345, 'Metafísica', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (346, 'Lógica', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (347, 'Ética', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (348, 'Epistemologia', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (349, 'Filosofia Brasileira', 72);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (350, 'Fundamentos da Sociologia', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (351, 'Sociologia do Conhecimento', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (352, 'Sociologia do Desenvolvimento', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (353, 'Sociologia Urbana', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (354, 'Sociologia Rural', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (355, 'Sociologia da Saúde', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (356, 'Outras Sociologias Específicas', 73);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (357, 'Teoria Antropológica', 74);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (358, 'Etnologia Indígena', 74);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (359, 'Antropologia Urbana', 74);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (360, 'Antropologia Rural', 74);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (361, 'Antropologia das Populações Afro-Brasileiras', 74);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (362, 'Teoria e Método em Arqueologia', 75);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (363, 'Arqueologia Pré-Histórica', 75);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (364, 'Arqueologia Histórica', 75);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (365, 'Teoria e Filosofia da História', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (366, 'História Antiga e Medieval', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (367, 'História Moderna e Contemporânea', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (368, 'História da América', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (369, 'História do Brasil', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (370, 'História das Ciências', 76);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (371, 'Geografia Humana', 77);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (372, 'Geografia Regional', 77);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (373, 'Fundamentos e Medidas da Psicologia', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (374, 'Psicologia Experimental', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (375, 'Psicologia Fisiológica', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (376, 'Psicologia Comparativa', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (377, 'Psicologia Social', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (378, 'Psicologia Cognitiva', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (379, 'Psicologia do Desenvolvimento Humano', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (380, 'Psicologia do Ensino e da Aprendizagem', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (381, 'Psicologia do Trabalho e Organizacional', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (382, 'Tratamento e Prevenção Psicológica', 78);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (383, 'Fundamentos da Educação', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (384, 'Administração Educacional', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (385, 'Planejamento e Avaliação Educacional', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (386, 'Ensino-Aprendizagem', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (387, 'Currículo', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (388, 'Orientação e Aconselhamento', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (389, 'Tópicos Específicos de Educação', 79);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (390, 'Teoria Política', 80);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (391, 'Estado e Governo', 80);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (392, 'Comportamento Político', 80);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (393, 'Políticas Públicas', 80);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (394, 'Política Internacional', 80);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (395, 'História da Teologia', 81);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (396, 'Teologia Moral', 81);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (397, 'Teologia Sistemática', 81);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (398, 'Teologia Pastoral', 81);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (399, 'Teoria e Análise Linguística', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (400, 'Fisiologia da Linguagem', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (401, 'Linguística Histórica', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (402, 'Sociolinguística e Dialetologia', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (403, 'Psicolinguística', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (404, 'Linguística Aplicada', 82);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (405, 'Língua Portuguesa', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (406, 'Línguas Estrangeiras Modernas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (407, 'Línguas Clássicas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (408, 'Línguas Indígenas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (409, 'Teoria Literária', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (410, 'Literatura Brasileira', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (411, 'Outras Literaturas Vernáculas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (412, 'Literaturas Estrangeiras Modernas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (413, 'Literaturas Clássicas', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (414, 'Literatura Comparada', 83);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (415, 'Fundamentos e Crítica das Artes', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (416, 'Artes Plásticas', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (417, 'Música', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (418, 'Dança', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (419, 'Teatro', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (420, 'Ópera', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (421, 'Fotografia', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (422, 'Cinema', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (423, 'Artes do Vídeo', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (424, 'Educação Artística', 84);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (425, 'Conjuntos', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (426, 'Lógica Matemática', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (427, 'Teoria dos Números', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (428, 'Grupos de Algebra Não-Comutativa', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (429, 'Algebra Comutativa', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (430, 'Geometria Algébrica', 85);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (431, 'Análise Complexa', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (432, 'Análise Funcional', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (433, 'Análise Funcional Não-Linear', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (434, 'Equações Diferenciais Ordinárias', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (435, 'Equações Diferenciais Parciais', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (436, 'Equações Diferenciais Funcionais', 86);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (437, 'Geometria Diferencial', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (438, 'Topologia Algébrica', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (439, 'Topologia das Variedades', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (440, 'Sistemas Dinâmicos', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (441, 'Teoria das Singularidades e Teoria das Catástrofes', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (442, 'Teoria das Folheações', 87);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (443, 'Física Matemática', 88);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (444, 'Análise Numérica', 88);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (445, 'Matemática Discreta e Combinatória', 88);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (446, 'Teoria Geral e Fundamentos da Probabilidade', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (447, 'Teoria Geral e Processos Estocásticos', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (448, 'Teoremas de Limite', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (449, 'Processos Markovianos', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (450, 'Análise Estocástica', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (451, 'Processos Estocásticos Especiais', 89);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (452, 'Fundamentos da Estatística', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (453, 'Inferência Paramétrica', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (454, 'Inferência Nao-Paramétrica', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (455, 'Inferência em Processos Estocásticos', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (456, 'Análise Multivariada', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (457, 'Regressão e Correlação', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (458, 'Planejamento de Experimentos', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (459, 'Análise de Dados', 90);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (460, 'Computabilidade e Modelos de Computação', 92);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (461, 'Linguagem Formais e Autômatos', 92);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (462, 'Análise de Algoritmos e Complexidade de Computação', 92);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (463, 'Lógicas e Semântica de Programas', 92);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (464, 'Matemática Simbólica', 93);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (465, 'Modelos Analíticos e de Simulação', 93);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (466, 'Linguagens de Programação', 94);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (467, 'Engenharia de Software', 94);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (468, 'Banco de Dados', 94);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (469, 'Sistemas de Informação', 94);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (470, 'Processamento Gráfico (Graphics)', 94);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (471, 'Hardware', 95);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (472, 'Arquitetura de Sistemas de Computação', 95);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (473, 'Software Básico', 95);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (474, 'Teleinformática', 95);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (475, 'Astronomia Fundamental', 96);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (476, 'Astronomia Dinâmica', 96);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (477, 'Meio Interestelar', 98);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (478, 'Nebulosa', 98);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (479, 'Galáxias', 99);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (480, 'Aglomerados de Galáxias', 99);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (481, 'Quasares', 99);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (482, 'Cosmologia', 99);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (483, 'Física Solar', 100);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (484, 'Movimento da Terra', 100);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (485, 'Sistema Planetário', 100);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (486, 'Astronomia Ótica', 101);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (487, 'Radioastronomia', 101);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (488, 'Astronomia Espacial', 101);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (489, 'Processamento de Dados Astronômicos', 101);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (490, 'Métodos Matemáticos da Física', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (491, 'Física Clássica e Física Quântica; Mecânica e Campos', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (492, 'Relatividade e Gravitação', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (493, 'Física Estatística e Termodinâmica', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (494, 'Metrologia, Técnicas Gerais de Laboratório, Sistema de Instrumentação', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (495, 'Instrumentação Específica de Uso Geral em Física', 102);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (496, 'Eletricidade e Magnetismo; Campos e Partículas Carregadas', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (497, 'Ótica', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (498, 'Acústica', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (499, 'Transferência de Calor; Processos Térmicos e Termodinâmicos', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (500, 'Mecânica, Elasticidade e Reologia', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (501, 'Dinâmica dos Fluidos', 103);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (502, 'Teoria Geral de Partículas e Campos', 104);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (503, 'Teorias Específicas e Modelos de Interação; Sistemática de Partículas; Raios Cósmicos', 104);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (504, 'Reações Específicas e Fenomenologia de Partículas', 104);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (505, 'Propriedades de Partículas Específicas e Ressonâncias', 104);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (506, 'Estrutura Nuclear', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (507, 'Desintegração Nuclear e Radioatividade', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (508, 'Reações Nucleares e Espalhamento Geral', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (509, 'Reações Nucleares e Espalhamento (Reações Específicas)', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (510, 'Propriedades de Núcleos Específicos', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (511, 'Métodos Experimentais e Instrumentação para Partículas Elementares e Física Nuclear', 105);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (512, 'Estrutura Eletrônica de Átomos e Moléculas; Teoria', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (513, 'Espectros Atômicos e Integração de Fótons', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (514, 'Espectros Moleculares e Interações de Fótons com Moléculas', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (515, 'Processos de Colisão e Interações de Átomos e Moléculas', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (516, 'Inf.Sobre Átomos e Moléculas Obtidos Experimentalmente;Instrumentação e Técnicas', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (517, 'Estudos de Átomos e Moléculas Especiais', 106);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (518, 'Cinética e Teoria de Transporte de Fluidos; Propriedades Físicas de Gases', 107);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (519, 'Física de Plasmas e Descargas Elétricas', 107);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (520, 'Estrutura de Líquidos e Sólidos; Cristalografia', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (521, 'Propriedades Mecânicas e Acústicas da Matéria Condensada', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (522, 'Dinâmica da Rede e Estatística de Cristais', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (523, 'Equação de Estado, Equilíbrio de Fases e Transições de Fase', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (524, 'Propriedades Térmicas da Matéria Condensada', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (525, 'Propriedades de Transportes de Matéria Condensada (Não Eletrônicas)', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (526, 'Campos Quânticos e Sólidos, Hélio, Líquido, Sólido', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (527, 'Superfícies e Interfaces; Películas e Filamentos', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (528, 'Estados Eletrônicos', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (529, 'Transp.Eletrônicos e Prop. Elétricas de Superfícies; Interfaces e Películas', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (530, 'Estruturas Eletrônicas e Propriedades Elétricas de Superfícies Interfaces e Películas', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (531, 'Supercondutividade', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (532, 'Materiais Magnéticos e Propriedades Magnéticas', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (533, 'Ressonância Mag.e Relax.Na Mat.Condens;Efeitos Mosbauer;Corr.Ang.Pertubada', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (534, 'Materiais Dielétricos e Propriedades Dielétricas', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (535, 'Prop.Óticas e Espectrosc.da Mat.Condens;Outras Inter.da Mat.Com Rad.e Part.', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (536, 'Emissão Eletrônica e Iônica por Líquidos e Sólidos; Fenômenos de Impacto', 108);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (537, 'Estrutura, Conformação e Estereoquímica', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (538, 'Síntese Orgânica', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (539, 'Físico-Química Orgânica', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (540, 'Fotoquímica Orgânica', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (541, 'Química dos Produtos Naturais', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (542, 'Evolução, Sistemática e Ecologia Química', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (543, 'Polímeros e Coloides', 109);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (544, 'Campos de Coordenação', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (545, 'Não-Metais e Seus Compostos', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (546, 'Compostos Organo-Metálicos', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (547, 'Determinação de Estrutura de Compostos Inorgânicos', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (548, 'Foto-Química Inorgânica', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (549, 'Físico Química Inorgânica', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (550, 'Química Bio-Inorgânica', 110);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (551, 'Cinética Química e Catálise', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (552, 'Eletroquímica', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (553, 'Espectroscopia', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (554, 'Química de Interfaces', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (555, 'Química do Estado Condensado', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (556, 'Química Nuclear e Radioquímica', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (557, 'Química Teórica', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (558, 'Termodinâmica Química', 111);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (559, 'Separação', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (560, 'Métodos Óticos de Análise', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (561, 'Eletroanalítica', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (562, 'Gravimetria', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (563, 'Titimetria', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (564, 'Instrumentação Analítica', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (565, 'Análise de Traços e Química Ambiental', 112);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (566, 'Mineralogia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (567, 'Petrologia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (568, 'Geoquímica', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (569, 'Geologia Regional', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (570, 'Geotectônica', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (571, 'Geocronologia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (572, 'Cartografia Geológica', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (573, 'Metalogenia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (574, 'Hidrogeologia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (575, 'Prospecção Mineral', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (576, 'Sedimentologia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (577, 'Paleontologia Estratigráfica', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (578, 'Estratigrafia', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (579, 'Geologia Ambiental', 113);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (580, 'Geomagnetismo', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (581, 'Sismologia', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (582, 'Geotermia e Fluxo Térmico', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (583, 'Propriedades Físicas das Rochas', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (584, 'Geofísica Nuclear', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (585, 'Sensoriamento Remoto', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (586, 'Aeronomia', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (587, 'Desenvolvimento de Instrumentação Geofísica', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (588, 'Geofísica Aplicada', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (589, 'Gravimetria', 114);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (590, 'Meteorologia Dinâmica', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (591, 'Meteorologia Sinótica', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (592, 'Meteorologia Física', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (593, 'Química da Atmosfera', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (594, 'Instrumentação Meteorológica', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (595, 'Climatologia', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (596, 'Micrometeorologia', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (597, 'Sensoriamento Remoto da Atmosfera', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (598, 'Meteorologia Aplicada', 115);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (599, 'Geodesia Física', 116);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (600, 'Geodesia Geométrica', 116);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (601, 'Geodesia Celeste', 116);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (602, 'Fotogrametria', 116);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (603, 'Cartografia Básica', 116);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (604, 'Geomorfologia', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (605, 'Climatologia Geográfica', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (606, 'Pedologia', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (607, 'Hidrogeografia', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (608, 'Geoecologia', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (609, 'Fotogeografia (Físico-Ecológica)', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (610, 'Geocartografia', 117);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (611, 'Interação entre os Organismos Marinhos e os Parâmetros Ambientais', 118);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (612, 'Variáveis Físicas da Água do Mar', 119);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (613, 'Movimento da Água do Mar', 119);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (614, 'Origem das Massas de Água', 119);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (615, 'Interação do Oceano com o Leito do Mar', 119);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (616, 'Interação do Oceano com a Atmosfera', 119);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (617, 'Propriedades Químicas da Água do Mar', 120);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (618, 'Interações Químico-Biológicas/Geológicas das Substâncias Químicas da Água do Mar', 120);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (619, 'Geomorfologia Submarina', 121);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (620, 'Sedimentologia Marinha', 121);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (621, 'Geofísica Marinha', 121);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (622, 'Morfologia Externa', 129);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (623, 'Citologia Vegetal', 129);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (624, 'Anatomia Vegetal', 129);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (625, 'Palinologia', 129);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (626, 'Nutrição e Crescimento Vegetal', 130);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (627, 'Reprodução Vegetal', 130);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (628, 'Ecofisiologia Vegetal', 130);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (629, 'Taxonomia de Criptógamos', 131);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (630, 'Taxonomia de Fanerógamos', 131);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (631, 'Conservação das Espécies Animais', 139);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (632, 'Utilização dos Animais', 139);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (633, 'Controle Populacional de Animais', 139);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (634, 'Anatomia Humana', 146);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (635, 'Neurofisiologia', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (636, 'Fisiologia Cardiovascular', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (637, 'Fisiologia da Respiração', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (638, 'Fisiologia Renal', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (639, 'Fisiologia Endócrina', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (640, 'Fisiologia da Digestão', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (641, 'Cinesiologia', 148);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (642, 'Proteínas', 151);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (643, 'Lipídeos', 151);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (644, 'Glicídeos', 151);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (645, 'Farmacocinética', 160);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (646, 'Biodisponibilidade', 160);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (647, 'Virologia', 172);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (648, 'Bacteriologia', 172);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (649, 'Micologia', 172);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (650, 'Microbiologia Médica', 173);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (651, 'Microbiologia Industrial e de Fermentação', 173);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (652, 'Protozoologia Parasitária Humana', 174);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (653, 'Protozoologia Parasitária Animal', 174);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (654, 'Helmintologia Humana', 175);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (655, 'Helmintologia Animal', 175);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (656, 'Materiais e Componentes de Construção', 177);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (657, 'Processos Construtivos', 177);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (658, 'Instalações Prediais', 177);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (659, 'Estruturas de Concreto', 178);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (660, 'Estruturas de Madeiras', 178);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (661, 'Estruturas Metálicas', 178);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (662, 'Mecânica das Estruturas', 178);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (663, 'Fundações e Escavações', 179);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (664, 'Mecânicas das Rochas', 179);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (665, 'Mecânicas dos Solos', 179);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (666, 'Obras de Terra e Enrocamento', 179);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (667, 'Pavimentos', 179);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (668, 'Hidráulica', 180);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (669, 'Hidrologia', 180);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (670, 'Aeroportos; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (671, 'Ferrovias; Projetos e Construção', 181);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (672, 'Portos e Vias Navegáveis; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (673, 'Rodovias; Projeto e Construção', 181);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (674, 'Caracterização do Minério', 182);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (675, 'Dimensionamento de Jazidas', 182);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (676, 'Lavra a Céu Aberto', 183);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (677, 'Lavra de Mina Subterrânea', 183);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (678, 'Equipamentos de Lavra', 183);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (679, 'Métodos de Concentração e Enriquecimento de Minérios', 184);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (680, 'Equipamentos de Beneficiamento de Minérios', 184);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (681, 'Instalações Metalúrgicas', 185);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (682, 'Equipamentos Metalúrgicos', 185);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (683, 'Aglomeração', 186);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (684, 'Eletrometalurgia', 186);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (685, 'Hidrometalurgia', 186);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (686, 'Pirometalurgia', 186);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (687, 'Tratamento de Minérios', 186);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (688, 'Conformação Mecânica', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (689, 'Fundição', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (690, 'Metalurgia de Po', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (691, 'Recobrimentos', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (692, 'Soldagem', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (693, 'Tratamento Térmicos, Mecânicos e Químicos', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (694, 'Usinagem', 187);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (695, 'Estrutura dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (696, 'Propriedades Físicas dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (697, 'Propriedades Mecânicas dos Metais e Ligas', 188);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (698, 'Transformação de Fases', 188);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (699, 'Corrosão', 188);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (700, 'Extração e Transformação de Materiais', 189);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (701, 'Cerâmicos', 189);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (702, 'Materiais Conjugados não Metálicos', 189);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (703, 'Polímeros, Aplicações', 189);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (704, 'Materiais Condutores', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (705, 'Materiais e Componentes Semicondutores', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (706, 'Materiais e Dispositivos Supercondutores', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (707, 'Materiais Dielétricos, Piezoelétricos e Ferroelétricos', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (708, 'Materiais e Componentes Eletroóticos e Magnetoóticos, Materiais Fotoelétricos', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (709, 'Materiais e Dispositivos Magnéticos', 190);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (710, 'Medidas Elétricas', 191);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (711, 'Medidas Magnéticas', 191);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (712, 'Instrumentação Eletromecânica', 191);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (713, 'Instrumentação Eletrônica', 191);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (714, 'Sistemas Eletrônicos de Medida e de Controle', 191);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (715, 'Teoria Geral dos Circuitos Elétricos', 192);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (716, 'Circuitos Lineares e Não-Lineares', 192);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (717, 'Circuitos Eletrônicos', 192);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (718, 'Circuitos Magnéticos, Magnetismos, Eletromagnetismo', 192);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (719, 'Geração da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (720, 'Transmissão da Energia Elétrica, Distribuição da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (721, 'Conversão e Retificação da Energia Elétrica', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (722, 'Medição, Controle, Correção e Proteção de Sistemas Elétricos de Potência', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (723, 'Máquinas Elétricas e Dispositivos de Potência', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (724, 'Instalações Elétricas Prediais e Industriais', 193);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (725, 'Eletrônica Industrial', 194);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (726, 'Automação Eletrônica de Processos Elétricos e Industriais', 194);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (727, 'Controle de Processos Eletrônicos, Retroalimentação', 194);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (728, 'Teoria Eletromagnética, Micro-ondas, Propagação de Ondas, Antenas', 195);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (729, 'Radionavegação e Radioastronomia', 195);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (730, 'Sistemas de Telecomunicações', 195);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (731, 'Transferência de Calor', 196);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (732, 'Mecânica dos Fluidos', 196);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (733, 'Dinâmica dos Gases', 196);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (734, 'Princípios Variacionais e Métodos Numéricos', 196);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (735, 'Termodinâmica', 197);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (736, 'Controle Ambiental', 197);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (737, 'Aproveitamento da Energia', 197);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (738, 'Mecânica dos Corpos Sólidos, Elásticos e Plásticos', 198);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (739, 'Dinâmica dos Corpos Rígidos, Elásticos e Plásticos', 198);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (740, 'Análise de Tensões', 198);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (741, 'Termoelasticidade', 198);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (742, 'Teoria dos Mecanismos', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (743, 'Estática e Dinâmica Aplicada', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (744, 'Elementos de Máquinas', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (745, 'Fundamentos Gerais de Projetos das Máquinas', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (746, 'Máquinas, Motores e Equipamentos', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (747, 'Métodos de Síntese e Otimização Aplicados ao Projeto Mecânico', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (748, 'Controle de Sistemas Mecânicos', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (749, 'Aproveitamento de Energia', 199);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (750, 'Matrizes e Ferramentas', 200);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (751, 'Máquinas de Usinagem e Conformação', 200);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (752, 'Controle Numérico', 200);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (753, 'Robotização', 200);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (754, 'Processos de Fabricação, Seleção Econômica', 200);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (755, 'Processos Bioquímicos', 201);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (756, 'Processos Orgânicos', 201);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (757, 'Processos Inorgânicos', 201);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (758, 'Reatores Químicos', 202);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (759, 'Operações Características de Processos Bioquímicos', 202);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (760, 'Operações de Separação e Mistura', 202);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (761, 'Balancos Globais de Matéria e Energia', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (762, 'Água', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (763, 'Álcool', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (764, 'Alimentos', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (765, 'Borrachas', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (766, 'Carvão', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (767, 'Cerâmica', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (768, 'Cimento', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (769, 'Couro', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (770, 'Detergentes', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (771, 'Fertilizantes', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (772, 'Medicamentos', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (773, 'Metais não-Ferrosos', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (774, 'Óleos', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (775, 'Papel e Celulose', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (776, 'Petróleo e Petroquímica', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (777, 'Polímeros', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (778, 'Produtos Naturais', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (779, 'Têxteis', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (780, 'Tratamentos e Aproveitamento de Rejeitos', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (781, 'Xisto', 203);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (782, 'Planejamento Integrado dos Recursos Hídricos', 204);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (783, 'Tecnologia e Problemas Sanitários de Irrigação', 204);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (784, 'Águas Subterrâneas e Poços Profundos', 204);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (785, 'Controle de Enchentes e de Barragens', 204);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (786, 'Sedimentologia', 204);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (787, 'Química Sanitária', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (788, 'Processos Simplificados de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (789, 'Técnicas Convencionais de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (790, 'Técnicas Avançadas de Tratamento de Águas', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (791, 'Estudos e Caracterização de Efluentes Industriais', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (792, 'Lay Out de Processos Industriais', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (793, 'Resíduos Radioativos', 205);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (794, 'Técnicas de Abastecimento da Água', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (795, 'Drenagem de Águas Residuárias', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (796, 'Drenagem Urbana de Águas Pluviais', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (797, 'Resíduos Sólidos, Domésticos e Industriais', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (798, 'Limpeza Pública', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (799, 'Instalações Hidráulico-Sanitárias', 206);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (800, 'Ecologia Aplicada à Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (801, 'Microbiologia Aplicada e Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (802, 'Parasitologia Aplicada à Engenharia Sanitária', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (803, 'Qualidade do Ar, das Águas e do Solo', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (804, 'Controle da Poluição', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (805, 'Legislação Ambiental', 207);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (806, 'Planejamento de Instalações Industriais', 208);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (807, 'Planejamento, Projeto e Controle de Sistemas de Produção', 208);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (808, 'Higiene e Segurança do Trabalho', 208);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (809, 'Suprimentos', 208);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (810, 'Garantia de Controle de Qualidade', 208);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (811, 'Processos Estocásticos e Teorias da Filas', 209);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (812, 'Programação Linear, Não-Linear, Mista e Dinâmica', 209);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (813, 'Séries Temporais', 209);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (814, 'Teoria dos Grafos', 209);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (815, 'Teoria dos Jogos', 209);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (816, 'Ergonomia', 210);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (817, 'Metodologia de Projeto do Produto', 210);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (818, 'Processos de Trabalho', 210);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (819, 'Gerência do Projeto e do Produto', 210);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (820, 'Desenvolvimento de Produto', 210);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (821, 'Estudo de Mercado', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (822, 'Localização Industrial', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (823, 'Análise de Custos', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (824, 'Economia de Tecnologia', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (825, 'Vida Econômica dos Equipamentos', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (826, 'Avaliação de Projetos', 211);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (827, 'Produção de Radioisótopos', 212);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (828, 'Aplicações Industriais de Radioisótopos', 212);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (829, 'Instrumentação para Medida e Controle de Radiação', 212);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (830, 'Processos Industriais da Fusão Controlada', 213);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (831, 'Problemas Tecnológicos da Fusão Controlada', 213);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (832, 'Extração de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (833, 'Conversão, Enriquecimento e Fabricação de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (834, 'Reprocessamento de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (835, 'Rejeitos de Combustível Nuclear', 214);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (836, 'Núcleo do Reator', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (837, 'Materiais Nucleares e Blindagem de Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (838, 'Transferência de Calor em Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (839, 'Geração e Integração Com Sistemas Elétricos em Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (840, 'Instrumentação Para Operação e Controle de Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (841, 'Segurança, Localização e Licenciamento de Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (842, 'Aspectos Econômicos de Reatores', 215);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (843, 'Planejamento e Organização do Sistema de Transporte', 216);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (844, 'Economia dos Transportes', 216);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (845, 'Vias de Transporte', 217);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (846, 'Veículos de Transportes', 217);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (847, 'Estação de Transporte', 217);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (848, 'Equipamentos Auxiliares e Controles', 217);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (849, 'Engenharia de Tráfego', 218);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (850, 'Capacidade de Vias de Transporte', 218);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (851, 'Operação de Sistemas de Transporte', 218);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (852, 'Resistência Hidrodinâmica', 219);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (853, 'Propulsão de Navios', 219);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (854, 'Análise Teórica e Experimental de Estrutura', 220);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (855, 'Dinâmica Estrutural Naval e Oceânica', 220);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (856, 'Síntese Estrutural Naval e Oceânica', 220);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (857, 'Análise de Sistemas Propulsores', 221);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (858, 'Controle e Automação de Sistemas Propulsores', 221);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (859, 'Equipamentos Auxiliares do Sistema Propulsivo', 221);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (860, 'Motor de Propulsão', 221);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (861, 'Projetos de Navios', 222);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (862, 'Projetos de Sistemas Oceânicos Fixos e Semi-Fixos', 222);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (863, 'Projetos de Embarcações Não-Convencionais', 222);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (864, 'Métodos de Fabricação de Navios e Sistemas Oceânicos', 223);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (865, 'Soldagem de Estruturas Navais e Oceânicos', 223);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (866, 'Custos de Construção Naval', 223);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (867, 'Normatização e Certificação de Qualidade de Navios', 223);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (868, 'Aerodinâmica de Aeronaves Espaciais', 224);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (869, 'Aerodinâmica dos Processos Geofísicos e Interplanetários', 224);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (870, 'Trajetórias e Orbitas', 225);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (871, 'Estabilidade e Controle', 225);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (872, 'Aeroelasticidade', 226);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (873, 'Fadiga', 226);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (874, 'Projeto de Estruturas Aeroespaciais', 226);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (875, 'Combustão e Escoamento com Reações Químicas', 228);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (876, 'Propulsão de Foguetes', 228);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (877, 'Máquinas de Fluxo', 228);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (878, 'Motores Alternativos', 228);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (879, 'Aviões', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (880, 'Foguetes', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (881, 'Helicópteros', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (882, 'Hovercraft', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (883, 'Satélites e Outros Dispositivos Aeroespaciais', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (884, 'Normatização e Certificação de Qualidade de Aeronaves e Componentes', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (885, 'Manutenção de Sistemas Aeroespaciais', 229);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (886, 'Processamento de Sinais Biológicos', 230);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (887, 'Modelagem de Fenômenos Biológicos', 230);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (888, 'Modelagem de Sistemas Biológicos', 230);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (889, 'Biomateriais e Materiais Biocompatíveis', 231);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (890, 'Transdutores para Aplicações Biomédicas', 231);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (891, 'Instrumentação Odontológica e Médico-Hospitalar', 231);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (892, 'Tecnologia de Próteses', 231);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (893, 'Angiologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (894, 'Dermatologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (895, 'Alergologia e Imunologia Clínica', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (896, 'Cancerologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (897, 'Hematologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (898, 'Endocrinologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (899, 'Neurologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (900, 'Pediatria', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (901, 'Doenças Infecciosas e Parasitárias', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (902, 'Cardiologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (903, 'Gastroenterologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (904, 'Pneumologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (905, 'Nefrologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (906, 'Reumatologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (907, 'Ginecologia e Obstetrícia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (908, 'Fisiatria', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (909, 'Oftalmologia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (910, 'Ortopedia', 232);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (911, 'Cirurgia Plástica e Restauradora', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (912, 'Cirurgia Otorrinolaringológica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (913, 'Cirurgia Oftalmológica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (914, 'Cirurgia Cardiovascular', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (915, 'Cirurgia Torácica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (916, 'Cirurgia Gastroenterologia', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (917, 'Cirurgia Pediátrica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (918, 'Neurocirurgia', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (919, 'Cirurgia Urológica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (920, 'Cirurgia Proctológica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (921, 'Cirurgia Ortopédica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (922, 'Cirurgia Traumatológica', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (923, 'Anestesiologia', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (924, 'Cirurgia Experimental', 233);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (925, 'Gênese, Morfologia e Classificação dos Solos', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (926, 'Física do Solo', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (927, 'Química do Solo', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (928, 'Microbiologia e Bioquímica do Solo', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (929, 'Fertilidade do Solo e Adubação', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (930, 'Manejo e Conservação do Solo', 266);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (931, 'Fitopatologia', 267);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (932, 'Entomologia Agrícola', 267);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (933, 'Parasitologia Agrícola', 267);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (934, 'Microbiologia Agrícola', 267);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (935, 'Defesa Fitossanitária', 267);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (936, 'Manejo e Tratos Culturais', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (937, 'Mecanização Agrícola', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (938, 'Produção e Beneficiamento de Sementes', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (939, 'Produção de Mudas', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (940, 'Melhoramento Vegetal', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (941, 'Fisiologia de Plantas Cultivadas', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (942, 'Matologia', 268);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (943, 'Floricultura', 269);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (944, 'Parques e Jardins', 269);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (945, 'Arborização de Vias Públicas', 269);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (946, 'Dendrologia', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (947, 'Florestamento e Reflorestamento', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (948, 'Genética e Melhoramento Florestal', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (949, 'Sementes Florestais', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (950, 'Nutrição Florestal', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (951, 'Fisiologia Florestal', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (952, 'Solos Florestais', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (953, 'Proteção Florestal', 272);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (954, 'Economia Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (955, 'Politica e Legislação Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (956, 'Administração Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (957, 'Dendrometria e Inventário Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (958, 'Fotointerpretação Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (959, 'Ordenamento Florestal', 273);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (960, 'Exploração Florestal', 274);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (961, 'Mecanização Florestal', 274);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (962, 'Anatomia e Identificação de Produtos Florestais', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (963, 'Propriedades Físico-Mecânicas da Madeira', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (964, 'Relações Água-Madeira e Secagem', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (965, 'Tratamento da Madeira', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (966, 'Processamento Mecânico da Madeira', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (967, 'Química da Madeira', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (968, 'Resinas de Madeiras', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (969, 'Tecnologia de Celulose e Papel', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (970, 'Tecnologia de Chapas', 275);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (971, 'Hidrologia Florestal', 276);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (972, 'Conservação de Áreas Silvestres', 276);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (973, 'Conservação de Bacias Hidrográficas', 276);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (974, 'Recuperação de Áreas Degradadas', 276);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (975, 'Irrigação e Drenagem', 279);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (976, 'Conservação de Solo e Água', 279);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (977, 'Pré-Processamento de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (978, 'Armazenamento de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (979, 'Transferência de Produtos Agrícolas', 280);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (980, 'Assentamento Rural', 281);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (981, 'Engenharia de Construções Rurais', 281);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (982, 'Saneamento Rural', 281);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (983, 'Exigências Nutricionais dos Animais', 285);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (984, 'Avaliação de Alimentos para Animais', 285);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (985, 'Conservação de Alimentos para Animais', 285);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (986, 'Avaliação, Produção e Conservação de Forragens', 286);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (987, 'Manejo e Conservação de Pastagens', 286);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (988, 'Fisiologia de Plantas Forrageiras', 286);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (989, 'Melhoramento de Plantas Forrageiras e Produção de Sementes', 286);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (990, 'Toxicologia e Plantas Tóxicas', 286);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (991, 'Criação de Animais', 287);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (992, 'Manejo de Animais', 287);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (993, 'Instalações para Produção Animal', 287);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (994, 'Anestesiologia Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (995, 'Técnica Cirúrgica Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (996, 'Radiologia de Animais', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (997, 'Farmacologia e Terapêutica Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (998, 'Obstetrícia Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (999, 'Clínica Veterinária', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1000, 'Clínica Cirúrgica Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1001, 'Toxicologia Animal', 288);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1002, 'Epidemiologia Animal', 289);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1003, 'Saneamento Aplicado à Saúde do Homem', 289);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1004, 'Doenças Infecciosas de Animais', 289);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1005, 'Doenças Parasitárias de Animais', 289);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1006, 'Saúde Animal (Programas Sanitários)', 289);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1007, 'Patologia Aviária', 290);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1008, 'Anatomia Patologia Animal', 290);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1009, 'Patologia Clínica Animal', 290);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1010, 'Ginecologia e Andrologia Animal', 291);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1011, 'Inseminação Artificial Animal', 291);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1012, 'Fisiopatologia da Reprodução Animal', 291);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1013, 'Fatores Abióticos do Mar', 293);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1014, 'Avaliação de Estoques Pesqueiros Marinhos', 293);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1015, 'Exploração Pesqueira Marinha', 293);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1016, 'Manejo e Conservação de Recursos Pesqueiros Marinhos', 293);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1017, 'Fatores Abióticos de Águas Interiores', 294);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1018, 'Avaliação de Estoques Pesqueiros de Águas Interiores', 294);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1019, 'Explotação Pesqueira de Águas Interiores', 294);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1020, 'Manejo e Conservação de Recursos Pesqueiros de Águas Interiores', 294);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1021, 'Maricultura', 295);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1022, 'Carcinocultura', 295);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1023, 'Ostreicultura', 295);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1024, 'Piscicultura', 295);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1025, 'Valor Nutritivo de Alimentos', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1026, 'Química, Física, Físico-Química e Bioquímica dos Alim. e das Mat.-Primas Alimentares', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1027, 'Microbiologia de Alimentos', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1028, 'Fisiologia Pós-Colheita', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1029, 'Toxicidade e Resíduos de Pesticidas em Alimentos', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1030, 'Avaliação e Controle de Qualidade de Alimentos', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1031, 'Padrões, Legislação e Fiscalização de Alimentos', 297);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1032, 'Tecnologia de Produtos de Origem Animal', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1033, 'Tecnologia de Produtos de Origem Vegetal', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1034, 'Tecnologia das Bebidas', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1035, 'Tecnologia de Alimentos Dietéticos e Nutricionais', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1036, 'Aproveitamento de Subprodutos', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1037, 'Embalagens de Produtos Alimentares', 298);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1038, 'Instalações Industriais de Produção de Alimentos', 299);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1039, 'Armazenamento de Alimentos', 299);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1040, 'Teoria Geral do Direito', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1041, 'Teoria Geral do Processo', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1042, 'Teoria do Estado', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1043, 'História do Direito', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1044, 'Filosofia do Direito', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1045, 'Lógica Jurídica', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1046, 'Sociologia Jurídica', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1047, 'Antropologia Jurídica', 300);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1048, 'Direito Tributário', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1049, 'Direito Penal', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1050, 'Direito Processual Penal', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1051, 'Direito Processual Civil', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1052, 'Direito Constitucional', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1053, 'Direito Administrativo', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1054, 'Direito Internacional Público', 301);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1055, 'Direito Civil', 302);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1056, 'Direito Comercial', 302);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1057, 'Direito do Trabalho', 302);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1058, 'Direito Internacional Privado', 302);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1059, 'Administração da Produção', 304);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1060, 'Administração Financeira', 304);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1061, 'Mercadologia', 304);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1062, 'Negócios Internacionais', 304);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1063, 'Administração de Recursos Humanos', 304);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1064, 'Contabilidade e Finanças Públicas', 305);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1065, 'Organizações Públicas', 305);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1066, 'Política e Planejamento Governamentais', 305);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1067, 'Administração de Pessoal', 305);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1068, 'Economia Geral', 308);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1069, 'Teoria Geral da Economia', 308);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1070, 'História do Pensamento Econômico', 308);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1071, 'História Econômica', 308);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1072, 'Sistemas Econômicos', 308);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1073, 'Métodos e Modelos Matemáticos, Econométricos e Estatísticos', 309);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1074, 'Estatística Sócio-Econômica', 309);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1075, 'Contabilidade Nacional', 309);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1076, 'Economia Matemática', 309);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1077, 'Teoria Monetária e Financeira', 310);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1078, 'Instituições Monetárias e Financeiras do Brasil', 310);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1079, 'Finanças Públicas Internas', 310);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1080, 'Política Fiscal do Brasil', 310);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1081, 'Crescimento e Desenvolvimento Econômico', 311);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1082, 'Teoria e Política de Planejamento Econômico', 311);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1083, 'Flutuações Cíclicas e Projeções Econômicas', 311);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1084, 'Inflação', 311);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1085, 'Teoria do Comércio Internacional', 312);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1086, 'Relações do Comércio; Política Comercial; Integração Econômica', 312);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1087, 'Balanço de Pagamentos; Finanças Internacionais', 312);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1088, 'Investimentos Internacionais e Ajuda Externa', 312);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1089, 'Treinamento e Alocação de Mão-de-Obra; Oferta de Mão-de-Obra e Força de Trabalho', 313);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1090, 'Mercado de Trabalho; Política do Governo', 313);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1091, 'Sindicatos, Dissídios Coletivos, Relações de Emprego (Empregador/Empregado)', 313);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1092, 'Capital Humano', 313);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1093, 'Demografia Econômica', 313);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1094, 'Organização Industrial e Estudos Industriais', 314);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1095, 'Mudança Tecnológica', 314);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1096, 'Economia dos Programas de Bem-Estar Social', 315);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1097, 'Economia do Consumidor', 315);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1098, 'Economia Regional', 316);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1099, 'Economia Urbana', 316);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1100, 'Renda e Tributação', 316);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1101, 'Economia Agrária', 317);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1102, 'Economia dos Recursos Naturais', 317);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1103, 'História da Arquitetura e Urbanismo', 318);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1104, 'Teoria da Arquitetura', 318);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1105, 'História do Urbanismo', 318);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1106, 'Teoria do Urbanismo', 318);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1107, 'Planejamento e Projetos da Edificação', 319);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1108, 'Planejamento e Projeto do Espaço Urbano', 319);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1109, 'Planejamento e Projeto do Equipamento', 319);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1110, 'Adequação Ambiental', 320);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1111, 'Desenvolvimento Histórico do Paisagismo', 321);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1112, 'Conceituação de Paisagismo e Metodologia do Paisagismo', 321);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1113, 'Estudos de Organização do Espaço Exterior', 321);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1114, 'Projetos de Espaços Livres Urbanos', 321);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1115, 'Teoria do Planejamento Urbano e Regional', 322);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1116, 'Teoria da Urbanização', 322);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1117, 'Política Urbana', 322);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1118, 'História Urbana', 322);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1119, 'Informação, Cadastro e Mapeamento', 323);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1120, 'Técnica de Previsão Urbana e Regional', 323);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1121, 'Técnicas de Análise e Avaliação Urbana e Regional', 323);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1122, 'Técnicas de Planejamento e Projeto Urbanos e Regionais', 323);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1123, 'Administração Municipal e Urbana', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1124, 'Estudos da Habitação', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1125, 'Aspectos Sociais do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1126, 'Aspectos Econômicos do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1127, 'Aspectos Físico-Ambientais do Planejamento Urbano e Regional', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1128, 'Serviços Comunitários', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1129, 'Infra-Estruturas Urbanas e Regionais', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1130, 'Transporte e Tráfego Urbano e Regional', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1131, 'Legislação Urbana e Regional', 324);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1132, 'Distribuição Espacial Geral', 325);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1133, 'Distribuição Espacial Urbana', 325);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1134, 'Distribuição Espacial Rural', 325);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1135, 'Tendências Passadas', 326);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1136, 'Taxas e Estimativas Correntes', 326);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1137, 'Projeções', 326);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1138, 'Fecundidade', 327);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1139, 'Mortalidade', 327);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1140, 'Migração', 327);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1141, 'Casamento e Divórcio', 328);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1142, 'Família e Reprodução', 328);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1143, 'Distribuição Espacial', 329);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1144, 'Natalidade, Mortalidade, Migração', 329);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1145, 'Nupcialidade e Família', 329);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1146, 'Métodos e Técnicas de Demografia Histórica', 329);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1147, 'Política Populacional', 330);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1148, 'Políticas de Redistribuição de População', 330);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1149, 'Políticas de Planejamento Familiar', 330);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1150, 'Teoria Geral da Informação', 332);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1151, 'Processos da Comunicação', 332);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1152, 'Representação da Informação', 332);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1153, 'Teoria da Classificação', 333);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1154, 'Métodos Quantitativos. Bibliometria', 333);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1155, 'Técnicas de Recuperação de Informação', 333);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1156, 'Processos de Disseminação da Informação', 333);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1157, 'Organização de Arquivos', 334);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1158, 'Teoria e Ética do Jornalismo', 336);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1159, 'Organização Editorial de Jornais', 336);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1160, 'Organização Comercial de Jornais', 336);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1161, 'Jornalismo Especializado (Comunitário, Rural, Empresarial, Científico)', 336);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1162, 'Radiodifusão', 337);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1163, 'Videodifusão', 337);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1164, 'Serviço Social do Trabalho', 341);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1165, 'Serviço Social da Educação', 341);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1166, 'Serviço Social do Menor', 341);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1167, 'Serviço Social da Saúde', 341);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1168, 'Serviço Social da Habitação', 341);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1169, 'Teoria Sociológica', 350);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1170, 'História da Sociologia', 350);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1171, 'História dos Estados Unidos', 368);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1172, 'História Latino-Americana', 368);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1173, 'História do Brasil Colônia', 369);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1174, 'História do Brasil Império', 369);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1175, 'História do Brasil República', 369);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1176, 'História Regional do Brasil', 369);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1177, 'Geografia da População', 371);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1178, 'Geografia Agrária', 371);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1179, 'Geografia Urbana', 371);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1180, 'Geografia Econômica', 371);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1181, 'Geografia Política', 371);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1182, 'Teoria do Desenvolvimento Regional', 372);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1183, 'Regionalização', 372);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1184, 'Análise Regional', 372);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1185, 'História, Teorias e Sistemas em Psicologia', 373);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1186, 'Metodologia, Instrumentação e Equipamento em Psicologia', 373);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1187, 'Construção e Validade de Testes, Escalas e Outras Medidas Psicológicas', 373);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1188, 'Técnicas de Processamento Estatístico, Matemático e Computacional em Psicologia', 373);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1189, 'Processos Perceptuais e Motores', 374);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1190, 'Processos de Aprendizagem, Memória e Motivação', 374);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1191, 'Processos Cognitivos e Atencionais', 374);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1192, 'Estados Subjetivos e Emoção', 374);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1193, 'Neurologia, Eletrofisiologia e Comportamento', 375);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1194, 'Processos Psico-Fisiológicos', 375);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1195, 'Estimulação Elétrica e com Drogas; Comportamento', 375);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1196, 'Psicobiologia', 375);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1197, 'Estudos Naturalísticos do Comportamento Animal', 376);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1198, 'Mecanismos Instintivos e Processos Sociais em Animais', 376);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1199, 'Relações Interpessoais', 377);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1200, 'Processos Grupais e de Comunicação', 377);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1201, 'Papéis e Estruturas Sociais; Indivíduo', 377);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1202, 'Processos Perceptuais e Cognitivos; Desenvolvimento', 379);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1203, 'Desenvolvimento Social e da Personalidade', 379);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1204, 'Planejamento Institucional', 380);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1205, 'Programação de Condições de Ensino', 380);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1206, 'Treinamento de Pessoal', 380);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1207, 'Aprendizagem e Desempenho Acadêmicos', 380);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1208, 'Ensino e Aprendizagem na Sala de Aula', 380);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1209, 'Análise Institucional', 381);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1210, 'Recrutamento e Seleção de Pessoal', 381);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1211, 'Treinamento e Avaliação', 381);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1212, 'Fatores Humanos no Trabalho', 381);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1213, 'Planejamento Ambiental e Comportamento Humano', 381);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1214, 'Intervenção Terapêutica', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1215, 'Programas de Atendimento Comunitário', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1216, 'Treinamento e Reabilitação', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1217, 'Desvios da Conduta', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1218, 'Distúrbios da Linguagem', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1219, 'Distúrbios Psicossomáticos', 382);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1220, 'Filosofia da Educação', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1221, 'História da Educação', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1222, 'Sociologia da Educação', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1223, 'Antropologia Educacional', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1224, 'Economia da Educação', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1225, 'Psicologia Educacional', 383);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1226, 'Administração de Sistemas Educacionais', 384);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1227, 'Administração de Unidades Educativas', 384);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1228, 'Política Educacional', 385);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1229, 'Planejamento Educacional', 385);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1230, 'Avaliação de Sistemas, Instituições, Planos e Programas Educacionais', 385);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1231, 'Teorias da Instrução', 386);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1232, 'Métodos e Técnicas de Ensino', 386);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1233, 'Tecnologia Educacional', 386);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1234, 'Avaliação da Aprendizagem', 386);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1235, 'Teoria Geral de Planejamento e Desenvolvimento Curricular', 387);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1236, 'Currículos Específicos para Níveis e Tipos de Educação', 387);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1237, 'Orientação Educacional', 388);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1238, 'Orientação Vocacional', 388);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1239, 'Educação de Adultos', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1240, 'Educação Permanente', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1241, 'Educação Rural', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1242, 'Educação em Periferias Urbanas', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1243, 'Educação Especial', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1244, 'Educação Pré-Escolar', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1245, 'Ensino Profissionalizante', 389);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1246, 'Teoria Política Clássica', 390);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1247, 'Teoria Política Medieval', 390);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1248, 'Teoria Política Moderna', 390);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1249, 'Teoria Política Contemporânea', 390);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1250, 'Estrutura e Transformação do Estado', 391);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1251, 'Sistemas Governamentais Comparados', 391);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1252, 'Relações Intergovernamentais', 391);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1253, 'Estudos do Poder Local', 391);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1254, 'Instituições Governamentais Específicas', 391);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1255, 'Estudos Eleitorais e Partidos Políticos', 392);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1256, 'Atitude e Ideologias Políticas', 392);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1257, 'Conflitos e Coalizões Políticas', 392);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1258, 'Comportamento Legislativo', 392);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1259, 'Classes Sociais e Grupos de Interesse', 392);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1260, 'Análise do Processo Decisório', 393);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1261, 'Análise Institucional', 393);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1262, 'Técnicas de Antecipação', 393);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1263, 'Política Externa do Brasil', 394);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1264, 'Organizações Internacionais', 394);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1265, 'Integração Internacional, Conflito, Guerra e Paz', 394);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1266, 'Relações Internacionais, Bilaterais e Multilaterais', 394);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1267, 'Teoria da Arte', 415);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1268, 'História da Arte', 415);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1269, 'Crítica da Arte', 415);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1270, 'Pintura', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1271, 'Desenho', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1272, 'Gravura', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1273, 'Escultura', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1274, 'Cerâmica', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1275, 'Tecelagem', 416);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1276, 'Regência', 417);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1277, 'Instrumentação Musical', 417);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1278, 'Composição Musical', 417);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1279, 'Canto', 417);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1280, 'Execução da Dança', 418);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1281, 'Coreografia', 418);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1282, 'Dramaturgia', 419);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1283, 'Direção Teatral', 419);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1284, 'Cenografia', 419);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1285, 'Interpretação Teatral', 419);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1286, 'Administração e Produção de Filmes', 422);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1287, 'Roteiro e Direção Cinematográficos', 422);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1288, 'Técnicas de Registro e Processamento de Filmes', 422);
INSERT INTO public.area_conhecimento (id, nome, id_pai) VALUES (1289, 'Interpretação Cinematográfica', 422);


--
-- TOC entry 4429 (class 0 OID 84047)
-- Dependencies: 221
-- Data for Name: artigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artigo (id, data_publicacao, titulo, url, questao_id) VALUES (3, '2023-05-14', 'Técnicas de Criação de Questões Aleatórias', 'https://www.linkedin.com/in/leandro-rocha-musser-carneiro/', 54);


--
-- TOC entry 4430 (class 0 OID 84060)
-- Dependencies: 222
-- Data for Name: autor_artigo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autor_artigo (artigo_id, autor) VALUES (3, 'Leandro Musser');


--
-- TOC entry 4427 (class 0 OID 84033)
-- Dependencies: 219
-- Data for Name: figura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.figura (id, atributo, descricao, questao_id) VALUES (2, 'https:\/\/iili.io\/HUkgmw7.png', 'Foto Leandro Musser', 53);


--
-- TOC entry 4425 (class 0 OID 84019)
-- Dependencies: 217
-- Data for Name: opcao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.opcao (id, texto, questao_id) VALUES (113, 'Uma constante é um determinado valor fixo que não se modifica ao longo do tempo, durante a execução de um programa.', 50);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (114, 'Uma variável corresponde a uma posição de memória, cujo conteúdo pode variar ao longo do tempo durante a execução de um programa.', 50);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (115, 'Um valor lógico é utilizado em proposições lógicas e só pode assumir os valores Falso ou Verdadeiro.', 50);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (116, 'Um valor do tipo literal pode assumir sequência de caracteres, como letras e números, exceto símbolos especiais.', 50);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (117, 'Nada', 51);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (118, 'Opção aleatória', 51);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (119, 'Tudo', 51);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (120, 'Teste', 51);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (121, '1', 52);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (122, 'Óbvio que é 2', 52);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (123, '3', 52);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (124, '4', 52);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (125, '128', 53);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (126, '256', 53);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (127, '1023', 53);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (128, '49501', 53);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (129, 'Teste', 54);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (130, 'Random', 54);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (131, 'Abc', 54);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (132, 'Olá, mundo!', 54);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (133, 'Saindo codificando ideias que aparecem na mente em tempo real', 55);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (134, 'Construindo primeiro o banco de dados com entidades com atributos aleatórios que eu acho que podem ser úteis, mas sem certeza de nada', 55);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (135, 'Criando o máximo de recursos possíveis no menor tempo sem se importar com os efeitos disso, pois o importante é o agora', 55);
INSERT INTO public.opcao (id, texto, questao_id) VALUES (136, 'Planejando tudo antes', 55);


--
-- TOC entry 4434 (class 0 OID 92163)
-- Dependencies: 226
-- Data for Name: questao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (50, 'Analise', 'Com relação a Algoritmos e Estrutura de Dados, segundo Farrer (1999), assinale a alternativa INCORRETA:', 13, 116);
INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (51, 'Aplicação', 'O que faz o algoritmo XYZ?', 13, 118);
INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (52, 'Analise', 'Diga qual vai ser o valor de a no final da execução.

int a = 1;
a++;', 9, 122);
INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (53, 'Aplicação', 'Usando Python, calcule a quantidade de Pixels na seguinte imagem', 11, 128);
INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (54, 'Analise', 'Questão aleatória para criar volume', 10, 132);
INSERT INTO public.questao (id, categoria_bloom, texto, temas_areas_id, opcao_correta) VALUES (55, 'Conhecimento', 'Como construir um sistema do jeito certo?', 14, 136);


--
-- TOC entry 4422 (class 0 OID 83966)
-- Dependencies: 214
-- Data for Name: questionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questionario (id, titulo, qtd_questoes, tempo_duracao, tempo_disponivel, nivel_dificuldade) VALUES (13, 'Prova de Programação', 2, 60, 60, 'Mediano');
INSERT INTO public.questionario (id, titulo, qtd_questoes, tempo_duracao, tempo_disponivel, nivel_dificuldade) VALUES (14, 'Prova de Teste', 2, 999, 999, 'Difícil');


--
-- TOC entry 4423 (class 0 OID 84003)
-- Dependencies: 215
-- Data for Name: questoes_questionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questoes_questionario (questao_id, questionario_id) VALUES (52, 13);
INSERT INTO public.questoes_questionario (questao_id, questionario_id) VALUES (51, 13);
INSERT INTO public.questoes_questionario (questao_id, questionario_id) VALUES (54, 14);
INSERT INTO public.questoes_questionario (questao_id, questionario_id) VALUES (53, 14);


--
-- TOC entry 4420 (class 0 OID 83944)
-- Dependencies: 212
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tema (id, nome) VALUES (1, 'Java');
INSERT INTO public.tema (id, nome) VALUES (2, 'C#');
INSERT INTO public.tema (id, nome) VALUES (3, 'Python');
INSERT INTO public.tema (id, nome) VALUES (4, 'Ruby');
INSERT INTO public.tema (id, nome) VALUES (5, 'Algoritmos e Estrutura de Dados');
INSERT INTO public.tema (id, nome) VALUES (6, 'Tipos de linguagem');
INSERT INTO public.tema (id, nome) VALUES (7, 'Teste');


--
-- TOC entry 4432 (class 0 OID 92142)
-- Dependencies: 224
-- Data for Name: temas_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (2, 1, 3);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (5, 2, 3);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (6, 2, 2);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (7, 2, 1);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (9, 1, 466);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (10, 2, 466);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (11, 3, 466);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (12, 4, 466);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (13, 5, 466);
INSERT INTO public.temas_areas (id, tema_id, area_conhecimento_id) VALUES (14, 6, 466);


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 209
-- Name: area_conhecimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.area_conhecimento_id_seq', 1289, true);


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 220
-- Name: artigo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artigo_id_seq', 3, true);


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 218
-- Name: figura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.figura_id_seq', 2, true);


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 216
-- Name: opcao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opcao_id_seq', 136, true);


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 225
-- Name: questao2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questao2_id_seq', 55, true);


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 213
-- Name: questionario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionario_id_seq', 14, true);


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 211
-- Name: tema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tema_id_seq', 7, true);


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 223
-- Name: temas_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_areas_id_seq', 14, true);


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 227
-- Name: temas_areas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_areas_seq', 1, false);


--
-- TOC entry 4248 (class 2606 OID 83937)
-- Name: area_conhecimento area_conhecimento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento
    ADD CONSTRAINT area_conhecimento_pkey PRIMARY KEY (id);


--
-- TOC entry 4260 (class 2606 OID 84054)
-- Name: artigo artigo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo
    ADD CONSTRAINT artigo_pkey PRIMARY KEY (id);


--
-- TOC entry 4258 (class 2606 OID 84040)
-- Name: figura figura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura
    ADD CONSTRAINT figura_pkey PRIMARY KEY (id);


--
-- TOC entry 4256 (class 2606 OID 84026)
-- Name: opcao opcao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao
    ADD CONSTRAINT opcao_pkey PRIMARY KEY (id);


--
-- TOC entry 4266 (class 2606 OID 92170)
-- Name: questao questao2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT questao2_pkey PRIMARY KEY (id);


--
-- TOC entry 4252 (class 2606 OID 83971)
-- Name: questionario questionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionario
    ADD CONSTRAINT questionario_pkey PRIMARY KEY (id);


--
-- TOC entry 4254 (class 2606 OID 84007)
-- Name: questoes_questionario questoes_questionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questoes_questionario_pkey PRIMARY KEY (questao_id, questionario_id);


--
-- TOC entry 4250 (class 2606 OID 83949)
-- Name: tema tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema
    ADD CONSTRAINT tema_pkey PRIMARY KEY (id);


--
-- TOC entry 4262 (class 2606 OID 92147)
-- Name: temas_areas temas_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT temas_areas_pkey PRIMARY KEY (id);


--
-- TOC entry 4264 (class 2606 OID 92149)
-- Name: temas_areas unique_temas_areas_tema_area; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT unique_temas_areas_tema_area UNIQUE (tema_id, area_conhecimento_id);


--
-- TOC entry 4274 (class 2606 OID 92155)
-- Name: temas_areas area_conhecimento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT area_conhecimento_id_fkey FOREIGN KEY (area_conhecimento_id) REFERENCES public.area_conhecimento(id);


--
-- TOC entry 4267 (class 2606 OID 83938)
-- Name: area_conhecimento area_conhecimento_pai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area_conhecimento
    ADD CONSTRAINT area_conhecimento_pai FOREIGN KEY (id_pai) REFERENCES public.area_conhecimento(id);


--
-- TOC entry 4273 (class 2606 OID 84063)
-- Name: autor_artigo artigo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor_artigo
    ADD CONSTRAINT artigo_id_fkey FOREIGN KEY (artigo_id) REFERENCES public.artigo(id);


--
-- TOC entry 4276 (class 2606 OID 92173)
-- Name: questao opcao_correta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT opcao_correta_fkey FOREIGN KEY (opcao_correta) REFERENCES public.opcao(id);


--
-- TOC entry 4270 (class 2606 OID 100295)
-- Name: opcao questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opcao
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4268 (class 2606 OID 108467)
-- Name: questoes_questionario questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 4272 (class 2606 OID 108472)
-- Name: artigo questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artigo
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 4271 (class 2606 OID 108477)
-- Name: figura questao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.figura
    ADD CONSTRAINT questao_id_fkey FOREIGN KEY (questao_id) REFERENCES public.questao(id);


--
-- TOC entry 4269 (class 2606 OID 84013)
-- Name: questoes_questionario questionario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes_questionario
    ADD CONSTRAINT questionario_id_fkey FOREIGN KEY (questionario_id) REFERENCES public.questionario(id);


--
-- TOC entry 4275 (class 2606 OID 92150)
-- Name: temas_areas tema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_areas
    ADD CONSTRAINT tema_id_fkey FOREIGN KEY (tema_id) REFERENCES public.tema(id);


--
-- TOC entry 4277 (class 2606 OID 92178)
-- Name: questao temas_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questao
    ADD CONSTRAINT temas_areas_id_fkey FOREIGN KEY (temas_areas_id) REFERENCES public.temas_areas(id);


-- Completed on 2023-05-15 20:21:47 -03

--
-- PostgreSQL database dump complete
--

