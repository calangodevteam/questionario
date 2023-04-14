---- Inserts em tabelas ----

---- Areas de Conhecimentos ----

----- Grandes Areas ------

INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências Exatas e da Terra', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências Biológicas', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Engenharias', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências da Saúde', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências Agrárias', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências Sociais Aplicadas', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Ciências Humanas', NULL);
INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES ('Linguística, Letras e Artes', NULL);


---- Area Basica ----


    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências Exatas e da Terra';
            areas VARCHAR []:= ARRAY['Matemática','Probabilidade e Estatística','Ciência da Computação','Astronomia','Física','Química','GeoCiências','Oceanografia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências Biológicas';
            areas VARCHAR []:= ARRAY['Biologia Geral','Genética','Botânica','Zoologia','Ecologia','Morfologia','Fisiologia','Bioquímica','Biofísica','Farmacologia','Imunologia','Microbiologia','Parasitologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharias';
            areas VARCHAR []:= ARRAY['Engenharia Civil','Engenharia de Minas','Engenharia de Materiais e Metalúrgica','Engenharia Elétrica','Engenharia Mecânica','Engenharia Química','Engenharia Sanitária','Engenharia de Produção','Engenharia Nuclear','Engenharia de Transportes','Engenharia Naval e Oceânica','Engenharia Aeroespacial','Engenharia Biomédica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências da Saúde';
            areas VARCHAR []:= ARRAY['Medicina','Odontologia','Farmácia','Enfermagem','Nutrição','Saúde Coletiva','Fonoaudiologia','Fisioterapia e Terapia Ocupacional','Educação Física'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências Agrárias';
            areas VARCHAR []:= ARRAY['Agronomia','Recursos Florestais e Engenharia Florestal','Engenharia Agrícola','Zootecnia','Medicina Veterinária','Recursos Pesqueiros e Engenharia de Pesca','Ciência e Tecnologia de Alimentos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências Sociais Aplicadas';
            areas VARCHAR []:= ARRAY['Direito','Administração','Economia','Arquitetura e Urbanismo','Planejamento Urbano e Regional','Demografia','Ciência da Informação','Museologia','Comunicação','Serviço Social','Economia Doméstica','Desenho Industrial','Turismo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciências Humanas';
            areas VARCHAR []:= ARRAY['Filosofia','Sociologia','Antropologia','Arqueologia','História','Geografia','Psicologia','Educação','Ciência Política','Teologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Linguística, Letras e Artes';
            areas VARCHAR []:= ARRAY['Linguística','Letras','Artes'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;


--- Subarea ---


    DO $$
        DECLARE
            area_pai VARCHAR := 'Matemática';
            areas VARCHAR []:= ARRAY['Álgebra','Análise','Geometria e Topologia','Matemática Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Probabilidade e Estatística';
            areas VARCHAR []:= ARRAY['Probabilidade','Estatística','Probabilidade e Estatística Aplicadas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência da Computação';
            areas VARCHAR []:= ARRAY['Teoria da Computação','Matemática da Computação','Metodologia e Técnicas da Computação','Sistemas de Computação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Astronomia';
            areas VARCHAR []:= ARRAY['Astronomia de Posição e Mecânica Celeste','Astrofísica Estelar','Astrofísica do Meio Interestelar','Astrofísica Extragaláctica','Astrofísica do Sistema Solar','Instrumentação Astronômica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física';
            areas VARCHAR []:= ARRAY['Física Geral','Áreas Clássicas de Fenomenologia e suas Aplicações','Física das Partículas Elementares e Campos','Física Nuclear','Física Atômica e Molecular','Física dos Fluidos, Física de Plasmas e Descargas Elétricas','Física da Matéria Condensada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Química';
            areas VARCHAR []:= ARRAY['Química Orgânica','Química Inorgânica','Físico-Química','Química Analítica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'GeoCiências';
            areas VARCHAR []:= ARRAY['Geologia','Geofísica','Meteorologia','Geodesia','Geografia Física'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Oceanografia';
            areas VARCHAR []:= ARRAY['Oceanografia Biológica','Oceanografia Física','Oceanografia Química','Oceanografia Geológica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Genética';
            areas VARCHAR []:= ARRAY['Genética Quantitativa','Genética Molecular e de Micro-organismos','Genética Vegetal','Genética Animal','Genética Humana e Médica','Mutagênese'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Botânica';
            areas VARCHAR []:= ARRAY['Paleobotânica','Morfologia Vegetal','Fisiologia Vegetal','Taxonomia Vegetal','Fitogeografia','Botânica Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Zoologia';
            areas VARCHAR []:= ARRAY['Paleozoologia','Morfologia dos Grupos Recentes','Fisiologia dos Grupos Recentes','Comportamento Animal','Taxonomia dos Grupos Recentes','Zoologia Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ecologia';
            areas VARCHAR []:= ARRAY['Ecologia Teórica','Ecologia de Ecossistemas','Ecologia Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Morfologia';
            areas VARCHAR []:= ARRAY['Citologia e Biologia Celular','Embriologia','Histologia','Anatomia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fisiologia';
            areas VARCHAR []:= ARRAY['Fisiologia Geral','Fisiologia de Órgãos e Sistemas','Fisiologia do Esforço','Fisiologia Comparada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Bioquímica';
            areas VARCHAR []:= ARRAY['Química de Macromoléculas','Bioquímica dos Micro-organismos','Metabolismo e Bioenergética','Biologia Molecular','Enzimologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Biofísica';
            areas VARCHAR []:= ARRAY['Biofísica Molecular','Biofísica Celular','Biofísica de Processos e Sistemas','Radiologia e Fotobiologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Farmacologia';
            areas VARCHAR []:= ARRAY['Farmacologia Geral','Farmacologia Autonômica','Neuropsicofarmacologia','Farmacologia Cardiorrenal','Farmacologia Bioquímica e Molecular','Etnofarmacologia','Toxicologia','Farmacologia Clínica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Imunologia';
            areas VARCHAR []:= ARRAY['Imunoquímica','Imunologia Celular','Imunogenética','Imunologia Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Microbiologia';
            areas VARCHAR []:= ARRAY['Biologia e Fisiologia dos Micro-organismos','Microbiologia Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Parasitologia';
            areas VARCHAR []:= ARRAY['Protozoologia de Parasitos','Helmintologia de Parasitos','Entomologia e Malacologia de Parasitos e Vetores'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Civil';
            areas VARCHAR []:= ARRAY['Construção Civil','Estruturas','Geotécnica','Engenharia Hidráulica','Infra-Estrutura de Transportes'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Minas';
            areas VARCHAR []:= ARRAY['Pesquisa Mineral','Lavra','Tratamento de Minérios'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Materiais e Metalúrgica';
            areas VARCHAR []:= ARRAY['Instalações e Equipamentos Metalúrgicos','Metalurgia Extrativa','Metalurgia de Transformação','Metalurgia Física','Materiais não Metálicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Elétrica';
            areas VARCHAR []:= ARRAY['Materiais Elétricos','Medidas Elétricas, Magnéticas e Eletrônicas; Instrumentação','Circuitos Elétricos, Magnéticos e Eletrônicos','Sistemas Elétricos de Potência','Eletrônica Industrial, Sistemas e Controles Eletrônicos','Telecomunicações'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Mecânica';
            areas VARCHAR []:= ARRAY['Fenômenos de Transporte','Engenharia Térmica','Mecânica dos Sólidos','Projetos de Máquinas','Processos de Fabricação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Química';
            areas VARCHAR []:= ARRAY['Processos Industriais de Engenharia Química','Operações Industriais e Equipamentos para Engenharia Química','Tecnologia Química'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Sanitária';
            areas VARCHAR []:= ARRAY['Recursos Hídricos','Tratamento de Águas de Abastecimento e Residuárias','Saneamento Básico','Saneamento Ambiental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Produção';
            areas VARCHAR []:= ARRAY['Gerência de Produção','Pesquisa Operacional','Engenharia do Produto','Engenharia Econômica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Nuclear';
            areas VARCHAR []:= ARRAY['Aplicações de Radioisótopos','Fusão Controlada','Combustível Nuclear','Tecnologia dos Reatores'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Transportes';
            areas VARCHAR []:= ARRAY['Planejamento de Transportes','Veículos e Equipamentos de Controle','Operações de Transportes'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Naval e Oceânica';
            areas VARCHAR []:= ARRAY['Hidrodinâmica de Navios e Sistemas Oceânicos','Estruturas Navais e Oceânicas','Máquinas Marítimas','Projeto de Navios e de Sistemas Oceânicos','Tecnologia de Construção Naval e de Sistemas Oceânicas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Aeroespacial';
            areas VARCHAR []:= ARRAY['Aerodinâmica','Dinâmica de Vôo','Estruturas Aeroespaciais','Materiais e Processos para Engenharia Aeronáutica e Aeroespacial','Propulsão Aeroespacial','Sistemas Aeroespaciais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Biomédica';
            areas VARCHAR []:= ARRAY['Bioengenharia','Engenharia Médica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Medicina';
            areas VARCHAR []:= ARRAY['Clínica Médica','Cirurgia','Saúde Materno-Infantil','Psiquiatria','Anatomia Patológica e Patologia Clínica','Radiologia Médica','Medicina Legal e Deontologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Odontologia';
            areas VARCHAR []:= ARRAY['Clínica Odontológica','Cirurgia Buco-Maxilo-Facial','Ortodontia','Odontopediatria','Periodontia','Endodontia','Radiologia Odontológica','Odontologia Social e Preventiva','Materiais Odontológicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Farmácia';
            areas VARCHAR []:= ARRAY['Farmacotecnia','Farmacognosia','Análise Toxicológica','Análise e Controle e Medicamentos','Bromatologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Enfermagem';
            areas VARCHAR []:= ARRAY['Enfermagem Médico-Cirúrgica','Enfermagem Obstétrica','Enfermagem Pediátrica','Enfermagem Psiquiátrica','Enfermagem de Doenças Contagiosas','Enfermagem de Saúde Pública'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Nutrição';
            areas VARCHAR []:= ARRAY['Bioquímica da Nutrição','Dietética','Análise Nutricional de População','Desnutrição e Desenvolvimento Fisiológico'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Saúde Coletiva';
            areas VARCHAR []:= ARRAY['Epidemiologia','Saúde Publica','Medicina Preventiva'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Agronomia';
            areas VARCHAR []:= ARRAY['Ciência do Solo','Fitossanidade','Fitotecnia','Floricultura, Parques e Jardins','Agrometeorologia','Extensão Rural'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Recursos Florestais e Engenharia Florestal';
            areas VARCHAR []:= ARRAY['Silvicultura','Manejo Florestal','Técnicas e Operações Florestais','Tecnologia e Utilização de Produtos Florestais','Conservação da Natureza','Energia de Biomassa Florestal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Agrícola';
            areas VARCHAR []:= ARRAY['Máquinas e Implementos Agrícolas','Engenharia de Água e Solo','Engenharia de Processamento de Produtos Agrícolas','Construções Rurais e Ambiência','Energização Rural'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Zootecnia';
            areas VARCHAR []:= ARRAY['Ecologia dos Animais Domésticos e Etologia','Genética e Melhoramento dos Animais Domésticos','Nutrição e Alimentação Animal','Pastagem e Forragicultura','Produção Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Medicina Veterinária';
            areas VARCHAR []:= ARRAY['Clínica e Cirurgia Animal','Medicina Veterinária Preventiva','Patologia Animal','Reprodução Animal','Inspeção de Produtos de Origem Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Recursos Pesqueiros e Engenharia de Pesca';
            areas VARCHAR []:= ARRAY['Recursos Pesqueiros Marinhos','Recursos Pesqueiros de Águas Interiores','Aquicultura','Engenharia de Pesca'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência e Tecnologia de Alimentos';
            areas VARCHAR []:= ARRAY['Ciência de Alimentos','Tecnologia de Alimentos','Engenharia de Alimentos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Direito';
            areas VARCHAR []:= ARRAY['Teoria do Direito','Direito Público','Direito Privado','Direitos Especiais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Administração';
            areas VARCHAR []:= ARRAY['Administração de Empresas','Administração Pública','Administração de Setores Específicos','Ciências Contábeis'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia';
            areas VARCHAR []:= ARRAY['Teoria Econômica','Métodos Quantitativos em Economia','Economia Monetária e Fiscal','Crescimento, Flutuações e Planejamento Econômico','Economia Internacional','Economia dos Recursos Humanos','Economia Industrial','Economia do Bem-Estar Social','Economia Regional e Urbana','Economias Agrária e dos Recursos Naturais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Arquitetura e Urbanismo';
            areas VARCHAR []:= ARRAY['Fundamentos de Arquitetura e Urbanismo','Projeto de Arquitetura e Urbanismo','Tecnologia de Arquitetura e Urbanismo','Paisagismo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Planejamento Urbano e Regional';
            areas VARCHAR []:= ARRAY['Fundamentos do Planejamento Urbano e Regional','Métodos e Técnicas do Planejamento Urbano e Regional','Serviços Urbanos e Regionais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Demografia';
            areas VARCHAR []:= ARRAY['Distribuição Espacial','Tendência Populacional','Componentes da Dinâmica Demográfica','Nupcialidade e Família','Demografia Histórica','Política Pública e População','Fontes de Dados Demográficos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência da Informação';
            areas VARCHAR []:= ARRAY['Teoria da Informação','Biblioteconomia','Arquivologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Comunicação';
            areas VARCHAR []:= ARRAY['Teoria da Comunicação','Jornalismo e Editoração','Rádio e Televisão','Relações Públicas e Propaganda','Comunicação Visual'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Serviço Social';
            areas VARCHAR []:= ARRAY['Fundamentos do Serviço Social','Serviço Social Aplicado'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Desenho Industrial';
            areas VARCHAR []:= ARRAY['Programação Visual','Desenho de Produto'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Filosofia';
            areas VARCHAR []:= ARRAY['História da Filosofia','Metafísica','Lógica','Ética','Epistemologia','Filosofia Brasileira'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Sociologia';
            areas VARCHAR []:= ARRAY['Fundamentos da Sociologia','Sociologia do Conhecimento','Sociologia do Desenvolvimento','Sociologia Urbana','Sociologia Rural','Sociologia da Saúde','Outras Sociologias Específicas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Antropologia';
            areas VARCHAR []:= ARRAY['Teoria Antropológica','Etnologia Indígena','Antropologia Urbana','Antropologia Rural','Antropologia das Populações Afro-Brasileiras'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Arqueologia';
            areas VARCHAR []:= ARRAY['Teoria e Método em Arqueologia','Arqueologia Pré-Histórica','Arqueologia Histórica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'História';
            areas VARCHAR []:= ARRAY['Teoria e Filosofia da História','História Antiga e Medieval','História Moderna e Contemporânea','História da América','História do Brasil','História das Ciências'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geografia';
            areas VARCHAR []:= ARRAY['Geografia Humana','Geografia Regional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia';
            areas VARCHAR []:= ARRAY['Fundamentos e Medidas da Psicologia','Psicologia Experimental','Psicologia Fisiológica','Psicologia Comparativa','Psicologia Social','Psicologia Cognitiva','Psicologia do Desenvolvimento Humano','Psicologia do Ensino e da Aprendizagem','Psicologia do Trabalho e Organizacional','Tratamento e Prevenção Psicológica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Educação';
            areas VARCHAR []:= ARRAY['Fundamentos da Educação','Administração Educacional','Planejamento e Avaliação Educacional','Ensino-Aprendizagem','Currículo','Orientação e Aconselhamento','Tópicos Específicos de Educação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência Política';
            areas VARCHAR []:= ARRAY['Teoria Política','Estado e Governo','Comportamento Político','Políticas Públicas','Política Internacional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teologia';
            areas VARCHAR []:= ARRAY['História da Teologia','Teologia Moral','Teologia Sistemática','Teologia Pastoral'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Linguística';
            areas VARCHAR []:= ARRAY['Teoria e Análise Linguística','Fisiologia da Linguagem','Linguística Histórica','Sociolinguística e Dialetologia','Psicolinguística','Linguística Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Letras';
            areas VARCHAR []:= ARRAY['Língua Portuguesa','Línguas Estrangeiras Modernas','Línguas Clássicas','Línguas Indígenas','Teoria Literária','Literatura Brasileira','Outras Literaturas Vernáculas','Literaturas Estrangeiras Modernas','Literaturas Clássicas','Literatura Comparada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Artes';
            areas VARCHAR []:= ARRAY['Fundamentos e Crítica das Artes','Artes Plásticas','Música','Dança','Teatro','Ópera','Fotografia','Cinema','Artes do Vídeo','Educação Artística'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;


---- Especialidade ----


    DO $$
        DECLARE
            area_pai VARCHAR := 'Álgebra';
            areas VARCHAR []:= ARRAY['Conjuntos','Lógica Matemática','Teoria dos Números','Grupos de Algebra Não-Comutativa','Algebra Comutativa','Geometria Algébrica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Análise';
            areas VARCHAR []:= ARRAY['Análise Complexa','Análise Funcional','Análise Funcional Não-Linear','Equações Diferenciais Ordinárias','Equações Diferenciais Parciais','Equações Diferenciais Funcionais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geometria e Topologia';
            areas VARCHAR []:= ARRAY['Geometria Diferencial','Topologia Algébrica','Topologia das Variedades','Sistemas Dinâmicos','Teoria das Singularidades e Teoria das Catástrofes','Teoria das Folheações'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Matemática Aplicada';
            areas VARCHAR []:= ARRAY['Física Matemática','Análise Numérica','Matemática Discreta e Combinatória'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Probabilidade';
            areas VARCHAR []:= ARRAY['Teoria Geral e Fundamentos da Probabilidade','Teoria Geral e Processos Estocásticos','Teoremas de Limite','Processos Markovianos','Análise Estocástica','Processos Estocásticos Especiais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Estatística';
            areas VARCHAR []:= ARRAY['Fundamentos da Estatística','Inferência Paramétrica','Inferência Nao-Paramétrica','Inferência em Processos Estocásticos','Análise Multivariada','Regressão e Correlação','Planejamento de Experimentos','Análise de Dados'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teoria da Computação';
            areas VARCHAR []:= ARRAY['Computabilidade e Modelos de Computação','Linguagem Formais e Autômatos','Análise de Algoritmos e Complexidade de Computação','Lógicas e Semântica de Programas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Matemática da Computação';
            areas VARCHAR []:= ARRAY['Matemática Simbólica','Modelos Analíticos e de Simulação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Metodologia e Técnicas da Computação';
            areas VARCHAR []:= ARRAY['Linguagens de Programação','Engenharia de Software','Banco de Dados','Sistemas de Informação','Processamento Gráfico (Graphics)'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Sistemas de Computação';
            areas VARCHAR []:= ARRAY['Hardware','Arquitetura de Sistemas de Computação','Software Básico','Teleinformática'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Astronomia de Posição e Mecânica Celeste';
            areas VARCHAR []:= ARRAY['Astronomia Fundamental','Astronomia Dinâmica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Astrofísica do Meio Interestelar';
            areas VARCHAR []:= ARRAY['Meio Interestelar','Nebulosa'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Astrofísica Extragaláctica';
            areas VARCHAR []:= ARRAY['Galáxias','Aglomerados de Galáxias','Quasares','Cosmologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Astrofísica do Sistema Solar';
            areas VARCHAR []:= ARRAY['Física Solar','Movimento da Terra','Sistema Planetário'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Instrumentação Astronômica';
            areas VARCHAR []:= ARRAY['Astronomia Ótica','Radioastronomia','Astronomia Espacial','Processamento de Dados Astronômicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física Geral';
            areas VARCHAR []:= ARRAY['Métodos Matemáticos da Física','Física Clássica e Física Quântica; Mecânica e Campos','Relatividade e Gravitação','Física Estatística e Termodinâmica','Metrologia, Técnicas Gerais de Laboratório, Sistema de Instrumentação','Instrumentação Específica de Uso Geral em Física'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Áreas Clássicas de Fenomenologia e suas Aplicações';
            areas VARCHAR []:= ARRAY['Eletricidade e Magnetismo; Campos e Partículas Carregadas','Ótica','Acústica','Transferência de Calor; Processos Térmicos e Termodinâmicos','Mecânica, Elasticidade e Reologia','Dinâmica dos Fluidos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física das Partículas Elementares e Campos';
            areas VARCHAR []:= ARRAY['Teoria Geral de Partículas e Campos','Teorias Específicas e Modelos de Interação; Sistemática de Partículas; Raios Cósmicos','Reações Específicas e Fenomenologia de Partículas','Propriedades de Partículas Específicas e Ressonâncias'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física Nuclear';
            areas VARCHAR []:= ARRAY['Estrutura Nuclear','Desintegração Nuclear e Radioatividade','Reações Nucleares e Espalhamento Geral','Reações Nucleares e Espalhamento (Reações Específicas)','Propriedades de Núcleos Específicos','Métodos Experimentais e Instrumentação para Partículas Elementares e Física Nuclear'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física Atômica e Molecular';
            areas VARCHAR []:= ARRAY['Estrutura Eletrônica de Átomos e Moléculas; Teoria','Espectros Atômicos e Integração de Fótons','Espectros Moleculares e Interações de Fótons com Moléculas','Processos de Colisão e Interações de Átomos e Moléculas','Inf.Sobre Átomos e Moléculas Obtidos Experimentalmente;Instrumentação e Técnicas','Estudos de Átomos e Moléculas Especiais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física dos Fluidos, Física de Plasmas e Descargas Elétricas';
            areas VARCHAR []:= ARRAY['Cinética e Teoria de Transporte de Fluidos; Propriedades Físicas de Gases','Física de Plasmas e Descargas Elétricas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Física da Matéria Condensada';
            areas VARCHAR []:= ARRAY['Estrutura de Líquidos e Sólidos; Cristalografia','Propriedades Mecânicas e Acústicas da Matéria Condensada','Dinâmica da Rede e Estatística de Cristais','Equação de Estado, Equilíbrio de Fases e Transições de Fase','Propriedades Térmicas da Matéria Condensada','Propriedades de Transportes de Matéria Condensada (Não Eletrônicas)','Campos Quânticos e Sólidos, Hélio, Líquido, Sólido','Superfícies e Interfaces; Películas e Filamentos','Estados Eletrônicos','Transp.Eletrônicos e Prop. Elétricas de Superfícies; Interfaces e Películas','Estruturas Eletrônicas e Propriedades Elétricas de Superfícies Interfaces e Películas','Supercondutividade','Materiais Magnéticos e Propriedades Magnéticas','Ressonância Mag.e Relax.Na Mat.Condens;Efeitos Mosbauer;Corr.Ang.Pertubada','Materiais Dielétricos e Propriedades Dielétricas','Prop.Óticas e Espectrosc.da Mat.Condens;Outras Inter.da Mat.Com Rad.e Part.','Emissão Eletrônica e Iônica por Líquidos e Sólidos; Fenômenos de Impacto'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Química Orgânica';
            areas VARCHAR []:= ARRAY['Estrutura, Conformação e Estereoquímica','Síntese Orgânica','Físico-Química Orgânica','Fotoquímica Orgânica','Química dos Produtos Naturais','Evolução, Sistemática e Ecologia Química','Polímeros e Coloides'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Química Inorgânica';
            areas VARCHAR []:= ARRAY['Campos de Coordenação','Não-Metais e Seus Compostos','Compostos Organo-Metálicos','Determinação de Estrutura de Compostos Inorgânicos','Foto-Química Inorgânica','Físico Química Inorgânica','Química Bio-Inorgânica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Físico-Química';
            areas VARCHAR []:= ARRAY['Cinética Química e Catálise','Eletroquímica','Espectroscopia','Química de Interfaces','Química do Estado Condensado','Química Nuclear e Radioquímica','Química Teórica','Termodinâmica Química'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Química Analítica';
            areas VARCHAR []:= ARRAY['Separação','Métodos Óticos de Análise','Eletroanalítica','Gravimetria','Titimetria','Instrumentação Analítica','Análise de Traços e Química Ambiental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geologia';
            areas VARCHAR []:= ARRAY['Mineralogia','Petrologia','Geoquímica','Geologia Regional','Geotectônica','Geocronologia','Cartografia Geológica','Metalogenia','Hidrogeologia','Prospecção Mineral','Sedimentologia','Paleontologia Estratigráfica','Estratigrafia','Geologia Ambiental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geofísica';
            areas VARCHAR []:= ARRAY['Geomagnetismo','Sismologia','Geotermia e Fluxo Térmico','Propriedades Físicas das Rochas','Geofísica Nuclear','Sensoriamento Remoto','Aeronomia','Desenvolvimento de Instrumentação Geofísica','Geofísica Aplicada','Gravimetria'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Meteorologia';
            areas VARCHAR []:= ARRAY['Meteorologia Dinâmica','Meteorologia Sinótica','Meteorologia Física','Química da Atmosfera','Instrumentação Meteorológica','Climatologia','Micrometeorologia','Sensoriamento Remoto da Atmosfera','Meteorologia Aplicada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geodesia';
            areas VARCHAR []:= ARRAY['Geodesia Física','Geodesia Geométrica','Geodesia Celeste','Fotogrametria','Cartografia Básica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geografia Física';
            areas VARCHAR []:= ARRAY['Geomorfologia','Climatologia Geográfica','Pedologia','Hidrogeografia','Geoecologia','Fotogeografia (Físico-Ecológica)','Geocartografia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Oceanografia Biológica';
            areas VARCHAR []:= ARRAY['Interação entre os Organismos Marinhos e os Parâmetros Ambientais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Oceanografia Física';
            areas VARCHAR []:= ARRAY['Variáveis Físicas da Água do Mar','Movimento da Água do Mar','Origem das Massas de Água','Interação do Oceano com o Leito do Mar','Interação do Oceano com a Atmosfera'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Oceanografia Química';
            areas VARCHAR []:= ARRAY['Propriedades Químicas da Água do Mar','Interações Químico-Biológicas/Geológicas das Substâncias Químicas da Água do Mar'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Oceanografia Geológica';
            areas VARCHAR []:= ARRAY['Geomorfologia Submarina','Sedimentologia Marinha','Geofísica Marinha'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Morfologia Vegetal';
            areas VARCHAR []:= ARRAY['Morfologia Externa','Citologia Vegetal','Anatomia Vegetal','Palinologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fisiologia Vegetal';
            areas VARCHAR []:= ARRAY['Nutrição e Crescimento Vegetal','Reprodução Vegetal','Ecofisiologia Vegetal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Taxonomia Vegetal';
            areas VARCHAR []:= ARRAY['Taxonomia de Criptógamos','Taxonomia de Fanerógamos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Zoologia Aplicada';
            areas VARCHAR []:= ARRAY['Conservação das Espécies Animais','Utilização dos Animais','Controle Populacional de Animais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Anatomia';
            areas VARCHAR []:= ARRAY['Anatomia Humana'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fisiologia de Órgãos e Sistemas';
            areas VARCHAR []:= ARRAY['Neurofisiologia','Fisiologia Cardiovascular','Fisiologia da Respiração','Fisiologia Renal','Fisiologia Endócrina','Fisiologia da Digestão','Cinesiologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Química de Macromoléculas';
            areas VARCHAR []:= ARRAY['Proteínas','Lipídeos','Glicídeos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Farmacologia Geral';
            areas VARCHAR []:= ARRAY['Farmacocinética','Biodisponibilidade'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Biologia e Fisiologia dos Micro-organismos';
            areas VARCHAR []:= ARRAY['Virologia','Bacteriologia','Micologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Microbiologia Aplicada';
            areas VARCHAR []:= ARRAY['Microbiologia Médica','Microbiologia Industrial e de Fermentação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Protozoologia de Parasitos';
            areas VARCHAR []:= ARRAY['Protozoologia Parasitária Humana','Protozoologia Parasitária Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Helmintologia de Parasitos';
            areas VARCHAR []:= ARRAY['Helmintologia Humana','Helmintologia Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Construção Civil';
            areas VARCHAR []:= ARRAY['Materiais e Componentes de Construção','Processos Construtivos','Instalações Prediais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Estruturas';
            areas VARCHAR []:= ARRAY['Estruturas de Concreto','Estruturas de Madeiras','Estruturas Metálicas','Mecânica das Estruturas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geotécnica';
            areas VARCHAR []:= ARRAY['Fundações e Escavações','Mecânicas das Rochas','Mecânicas dos Solos','Obras de Terra e Enrocamento','Pavimentos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Hidráulica';
            areas VARCHAR []:= ARRAY['Hidráulica','Hidrologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Infra-Estrutura de Transportes';
            areas VARCHAR []:= ARRAY['Aeroportos; Projeto e Construção','Ferrovias; Projetos e Construção','Portos e Vias Navegáveis; Projeto e Construção','Rodovias; Projeto e Construção'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Pesquisa Mineral';
            areas VARCHAR []:= ARRAY['Caracterização do Minério','Dimensionamento de Jazidas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Lavra';
            areas VARCHAR []:= ARRAY['Lavra a Céu Aberto','Lavra de Mina Subterrânea','Equipamentos de Lavra'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tratamento de Minérios';
            areas VARCHAR []:= ARRAY['Métodos de Concentração e Enriquecimento de Minérios','Equipamentos de Beneficiamento de Minérios'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Instalações e Equipamentos Metalúrgicos';
            areas VARCHAR []:= ARRAY['Instalações Metalúrgicas','Equipamentos Metalúrgicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Metalurgia Extrativa';
            areas VARCHAR []:= ARRAY['Aglomeração','Eletrometalurgia','Hidrometalurgia','Pirometalurgia','Tratamento de Minérios'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Metalurgia de Transformação';
            areas VARCHAR []:= ARRAY['Conformação Mecânica','Fundição','Metalurgia de Po','Recobrimentos','Soldagem','Tratamento Térmicos, Mecânicos e Químicos','Usinagem'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Metalurgia Física';
            areas VARCHAR []:= ARRAY['Estrutura dos Metais e Ligas','Propriedades Físicas dos Metais e Ligas','Propriedades Mecânicas dos Metais e Ligas','Transformação de Fases','Corrosão'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Materiais não Metálicos';
            areas VARCHAR []:= ARRAY['Extração e Transformação de Materiais','Cerâmicos','Materiais Conjugados não Metálicos','Polímeros, Aplicações'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Materiais Elétricos';
            areas VARCHAR []:= ARRAY['Materiais Condutores','Materiais e Componentes Semicondutores','Materiais e Dispositivos Supercondutores','Materiais Dielétricos, Piezoelétricos e Ferroelétricos','Materiais e Componentes Eletroóticos e Magnetoóticos, Materiais Fotoelétricos','Materiais e Dispositivos Magnéticos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Medidas Elétricas, Magnéticas e Eletrônicas; Instrumentação';
            areas VARCHAR []:= ARRAY['Medidas Elétricas','Medidas Magnéticas','Instrumentação Eletromecânica','Instrumentação Eletrônica','Sistemas Eletrônicos de Medida e de Controle'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Circuitos Elétricos, Magnéticos e Eletrônicos';
            areas VARCHAR []:= ARRAY['Teoria Geral dos Circuitos Elétricos','Circuitos Lineares e Não-Lineares','Circuitos Eletrônicos','Circuitos Magnéticos, Magnetismos, Eletromagnetismo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Sistemas Elétricos de Potência';
            areas VARCHAR []:= ARRAY['Geração da Energia Elétrica','Transmissão da Energia Elétrica, Distribuição da Energia Elétrica','Conversão e Retificação da Energia Elétrica','Medição, Controle, Correção e Proteção de Sistemas Elétricos de Potência','Máquinas Elétricas e Dispositivos de Potência','Instalações Elétricas Prediais e Industriais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Eletrônica Industrial, Sistemas e Controles Eletrônicos';
            areas VARCHAR []:= ARRAY['Eletrônica Industrial','Automação Eletrônica de Processos Elétricos e Industriais','Controle de Processos Eletrônicos, Retroalimentação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Telecomunicações';
            areas VARCHAR []:= ARRAY['Teoria Eletromagnética, Micro-ondas, Propagação de Ondas, Antenas','Radionavegação e Radioastronomia','Sistemas de Telecomunicações'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fenômenos de Transporte';
            areas VARCHAR []:= ARRAY['Transferência de Calor','Mecânica dos Fluidos','Dinâmica dos Gases','Princípios Variacionais e Métodos Numéricos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Térmica';
            areas VARCHAR []:= ARRAY['Termodinâmica','Controle Ambiental','Aproveitamento da Energia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Mecânica dos Sólidos';
            areas VARCHAR []:= ARRAY['Mecânica dos Corpos Sólidos, Elásticos e Plásticos','Dinâmica dos Corpos Rígidos, Elásticos e Plásticos','Análise de Tensões','Termoelasticidade'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Projetos de Máquinas';
            areas VARCHAR []:= ARRAY['Teoria dos Mecanismos','Estática e Dinâmica Aplicada','Elementos de Máquinas','Fundamentos Gerais de Projetos das Máquinas','Máquinas, Motores e Equipamentos','Métodos de Síntese e Otimização Aplicados ao Projeto Mecânico','Controle de Sistemas Mecânicos','Aproveitamento de Energia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Processos de Fabricação';
            areas VARCHAR []:= ARRAY['Matrizes e Ferramentas','Máquinas de Usinagem e Conformação','Controle Numérico','Robotização','Processos de Fabricação, Seleção Econômica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Processos Industriais de Engenharia Química';
            areas VARCHAR []:= ARRAY['Processos Bioquímicos','Processos Orgânicos','Processos Inorgânicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Operações Industriais e Equipamentos para Engenharia Química';
            areas VARCHAR []:= ARRAY['Reatores Químicos','Operações Características de Processos Bioquímicos','Operações de Separação e Mistura'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia Química';
            areas VARCHAR []:= ARRAY['Balancos Globais de Matéria e Energia','Água','Álcool','Alimentos','Borrachas','Carvão','Cerâmica','Cimento','Couro','Detergentes','Fertilizantes','Medicamentos','Metais não-Ferrosos','Óleos','Papel e Celulose','Petróleo e Petroquímica','Polímeros','Produtos Naturais','Têxteis','Tratamentos e Aproveitamento de Rejeitos','Xisto'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Recursos Hídricos';
            areas VARCHAR []:= ARRAY['Planejamento Integrado dos Recursos Hídricos','Tecnologia e Problemas Sanitários de Irrigação','Águas Subterrâneas e Poços Profundos','Controle de Enchentes e de Barragens','Sedimentologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tratamento de Águas de Abastecimento e Residuárias';
            areas VARCHAR []:= ARRAY['Química Sanitária','Processos Simplificados de Tratamento de Águas','Técnicas Convencionais de Tratamento de Águas','Técnicas Avançadas de Tratamento de Águas','Estudos e Caracterização de Efluentes Industriais','Lay Out de Processos Industriais','Resíduos Radioativos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Saneamento Básico';
            areas VARCHAR []:= ARRAY['Técnicas de Abastecimento da Água','Drenagem de Águas Residuárias','Drenagem Urbana de Águas Pluviais','Resíduos Sólidos, Domésticos e Industriais','Limpeza Pública','Instalações Hidráulico-Sanitárias'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Saneamento Ambiental';
            areas VARCHAR []:= ARRAY['Ecologia Aplicada à Engenharia Sanitária','Microbiologia Aplicada e Engenharia Sanitária','Parasitologia Aplicada à Engenharia Sanitária','Qualidade do Ar, das Águas e do Solo','Controle da Poluição','Legislação Ambiental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Gerência de Produção';
            areas VARCHAR []:= ARRAY['Planejamento de Instalações Industriais','Planejamento, Projeto e Controle de Sistemas de Produção','Higiene e Segurança do Trabalho','Suprimentos','Garantia de Controle de Qualidade'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Pesquisa Operacional';
            areas VARCHAR []:= ARRAY['Processos Estocásticos e Teorias da Filas','Programação Linear, Não-Linear, Mista e Dinâmica','Séries Temporais','Teoria dos Grafos','Teoria dos Jogos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia do Produto';
            areas VARCHAR []:= ARRAY['Ergonomia','Metodologia de Projeto do Produto','Processos de Trabalho','Gerência do Projeto e do Produto','Desenvolvimento de Produto'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Econômica';
            areas VARCHAR []:= ARRAY['Estudo de Mercado','Localização Industrial','Análise de Custos','Economia de Tecnologia','Vida Econômica dos Equipamentos','Avaliação de Projetos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Aplicações de Radioisótopos';
            areas VARCHAR []:= ARRAY['Produção de Radioisótopos','Aplicações Industriais de Radioisótopos','Instrumentação para Medida e Controle de Radiação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fusão Controlada';
            areas VARCHAR []:= ARRAY['Processos Industriais da Fusão Controlada','Problemas Tecnológicos da Fusão Controlada'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Combustível Nuclear';
            areas VARCHAR []:= ARRAY['Extração de Combustível Nuclear','Conversão, Enriquecimento e Fabricação de Combustível Nuclear','Reprocessamento de Combustível Nuclear','Rejeitos de Combustível Nuclear'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia dos Reatores';
            areas VARCHAR []:= ARRAY['Núcleo do Reator','Materiais Nucleares e Blindagem de Reatores','Transferência de Calor em Reatores','Geração e Integração Com Sistemas Elétricos em Reatores','Instrumentação Para Operação e Controle de Reatores','Segurança, Localização e Licenciamento de Reatores','Aspectos Econômicos de Reatores'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Planejamento de Transportes';
            areas VARCHAR []:= ARRAY['Planejamento e Organização do Sistema de Transporte','Economia dos Transportes'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Veículos e Equipamentos de Controle';
            areas VARCHAR []:= ARRAY['Vias de Transporte','Veículos de Transportes','Estação de Transporte','Equipamentos Auxiliares e Controles'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Operações de Transportes';
            areas VARCHAR []:= ARRAY['Engenharia de Tráfego','Capacidade de Vias de Transporte','Operação de Sistemas de Transporte'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Hidrodinâmica de Navios e Sistemas Oceânicos';
            areas VARCHAR []:= ARRAY['Resistência Hidrodinâmica','Propulsão de Navios'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Estruturas Navais e Oceânicas';
            areas VARCHAR []:= ARRAY['Análise Teórica e Experimental de Estrutura','Dinâmica Estrutural Naval e Oceânica','Síntese Estrutural Naval e Oceânica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Máquinas Marítimas';
            areas VARCHAR []:= ARRAY['Análise de Sistemas Propulsores','Controle e Automação de Sistemas Propulsores','Equipamentos Auxiliares do Sistema Propulsivo','Motor de Propulsão'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Projeto de Navios e de Sistemas Oceânicos';
            areas VARCHAR []:= ARRAY['Projetos de Navios','Projetos de Sistemas Oceânicos Fixos e Semi-Fixos','Projetos de Embarcações Não-Convencionais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia de Construção Naval e de Sistemas Oceânicas';
            areas VARCHAR []:= ARRAY['Métodos de Fabricação de Navios e Sistemas Oceânicos','Soldagem de Estruturas Navais e Oceânicos','Custos de Construção Naval','Normatização e Certificação de Qualidade de Navios'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Aerodinâmica';
            areas VARCHAR []:= ARRAY['Aerodinâmica de Aeronaves Espaciais','Aerodinâmica dos Processos Geofísicos e Interplanetários'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Dinâmica de Vôo';
            areas VARCHAR []:= ARRAY['Trajetórias e Orbitas','Estabilidade e Controle'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Estruturas Aeroespaciais';
            areas VARCHAR []:= ARRAY['Aeroelasticidade','Fadiga','Projeto de Estruturas Aeroespaciais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Propulsão Aeroespacial';
            areas VARCHAR []:= ARRAY['Combustão e Escoamento com Reações Químicas','Propulsão de Foguetes','Máquinas de Fluxo','Motores Alternativos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Sistemas Aeroespaciais';
            areas VARCHAR []:= ARRAY['Aviões','Foguetes','Helicópteros','Hovercraft','Satélites e Outros Dispositivos Aeroespaciais','Normatização e Certificação de Qualidade de Aeronaves e Componentes','Manutenção de Sistemas Aeroespaciais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Bioengenharia';
            areas VARCHAR []:= ARRAY['Processamento de Sinais Biológicos','Modelagem de Fenômenos Biológicos','Modelagem de Sistemas Biológicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia Médica';
            areas VARCHAR []:= ARRAY['Biomateriais e Materiais Biocompatíveis','Transdutores para Aplicações Biomédicas','Instrumentação Odontológica e Médico-Hospitalar','Tecnologia de Próteses'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Clínica Médica';
            areas VARCHAR []:= ARRAY['Angiologia','Dermatologia','Alergologia e Imunologia Clínica','Cancerologia','Hematologia','Endocrinologia','Neurologia','Pediatria','Doenças Infecciosas e Parasitárias','Cardiologia','Gastroenterologia','Pneumologia','Nefrologia','Reumatologia','Ginecologia e Obstetrícia','Fisiatria','Oftalmologia','Ortopedia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Cirurgia';
            areas VARCHAR []:= ARRAY['Cirurgia Plástica e Restauradora','Cirurgia Otorrinolaringológica','Cirurgia Oftalmológica','Cirurgia Cardiovascular','Cirurgia Torácica','Cirurgia Gastroenterologia','Cirurgia Pediátrica','Neurocirurgia','Cirurgia Urológica','Cirurgia Proctológica','Cirurgia Ortopédica','Cirurgia Traumatológica','Anestesiologia','Cirurgia Experimental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência do Solo';
            areas VARCHAR []:= ARRAY['Gênese, Morfologia e Classificação dos Solos','Física do Solo','Química do Solo','Microbiologia e Bioquímica do Solo','Fertilidade do Solo e Adubação','Manejo e Conservação do Solo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fitossanidade';
            areas VARCHAR []:= ARRAY['Fitopatologia','Entomologia Agrícola','Parasitologia Agrícola','Microbiologia Agrícola','Defesa Fitossanitária'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fitotecnia';
            areas VARCHAR []:= ARRAY['Manejo e Tratos Culturais','Mecanização Agrícola','Produção e Beneficiamento de Sementes','Produção de Mudas','Melhoramento Vegetal','Fisiologia de Plantas Cultivadas','Matologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Floricultura, Parques e Jardins';
            areas VARCHAR []:= ARRAY['Floricultura','Parques e Jardins','Arborização de Vias Públicas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Silvicultura';
            areas VARCHAR []:= ARRAY['Dendrologia','Florestamento e Reflorestamento','Genética e Melhoramento Florestal','Sementes Florestais','Nutrição Florestal','Fisiologia Florestal','Solos Florestais','Proteção Florestal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Manejo Florestal';
            areas VARCHAR []:= ARRAY['Economia Florestal','Politica e Legislação Florestal','Administração Florestal','Dendrometria e Inventário Florestal','Fotointerpretação Florestal','Ordenamento Florestal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Técnicas e Operações Florestais';
            areas VARCHAR []:= ARRAY['Exploração Florestal','Mecanização Florestal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia e Utilização de Produtos Florestais';
            areas VARCHAR []:= ARRAY['Anatomia e Identificação de Produtos Florestais','Propriedades Físico-Mecânicas da Madeira','Relações Água-Madeira e Secagem','Tratamento da Madeira','Processamento Mecânico da Madeira','Química da Madeira','Resinas de Madeiras','Tecnologia de Celulose e Papel','Tecnologia de Chapas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Conservação da Natureza';
            areas VARCHAR []:= ARRAY['Hidrologia Florestal','Conservação de Áreas Silvestres','Conservação de Bacias Hidrográficas','Recuperação de Áreas Degradadas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Água e Solo';
            areas VARCHAR []:= ARRAY['Irrigação e Drenagem','Conservação de Solo e Água'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Processamento de Produtos Agrícolas';
            areas VARCHAR []:= ARRAY['Pré-Processamento de Produtos Agrícolas','Armazenamento de Produtos Agrícolas','Transferência de Produtos Agrícolas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Construções Rurais e Ambiência';
            areas VARCHAR []:= ARRAY['Assentamento Rural','Engenharia de Construções Rurais','Saneamento Rural'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Nutrição e Alimentação Animal';
            areas VARCHAR []:= ARRAY['Exigências Nutricionais dos Animais','Avaliação de Alimentos para Animais','Conservação de Alimentos para Animais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Pastagem e Forragicultura';
            areas VARCHAR []:= ARRAY['Avaliação, Produção e Conservação de Forragens','Manejo e Conservação de Pastagens','Fisiologia de Plantas Forrageiras','Melhoramento de Plantas Forrageiras e Produção de Sementes','Toxicologia e Plantas Tóxicas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Produção Animal';
            areas VARCHAR []:= ARRAY['Criação de Animais','Manejo de Animais','Instalações para Produção Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Clínica e Cirurgia Animal';
            areas VARCHAR []:= ARRAY['Anestesiologia Animal','Técnica Cirúrgica Animal','Radiologia de Animais','Farmacologia e Terapêutica Animal','Obstetrícia Animal','Clínica Veterinária','Clínica Cirúrgica Animal','Toxicologia Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Medicina Veterinária Preventiva';
            areas VARCHAR []:= ARRAY['Epidemiologia Animal','Saneamento Aplicado à Saúde do Homem','Doenças Infecciosas de Animais','Doenças Parasitárias de Animais','Saúde Animal (Programas Sanitários)'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Patologia Animal';
            areas VARCHAR []:= ARRAY['Patologia Aviária','Anatomia Patologia Animal','Patologia Clínica Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Reprodução Animal';
            areas VARCHAR []:= ARRAY['Ginecologia e Andrologia Animal','Inseminação Artificial Animal','Fisiopatologia da Reprodução Animal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Recursos Pesqueiros Marinhos';
            areas VARCHAR []:= ARRAY['Fatores Abióticos do Mar','Avaliação de Estoques Pesqueiros Marinhos','Exploração Pesqueira Marinha','Manejo e Conservação de Recursos Pesqueiros Marinhos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Recursos Pesqueiros de Águas Interiores';
            areas VARCHAR []:= ARRAY['Fatores Abióticos de Águas Interiores','Avaliação de Estoques Pesqueiros de Águas Interiores','Explotação Pesqueira de Águas Interiores','Manejo e Conservação de Recursos Pesqueiros de Águas Interiores'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Aquicultura';
            areas VARCHAR []:= ARRAY['Maricultura','Carcinocultura','Ostreicultura','Piscicultura'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ciência de Alimentos';
            areas VARCHAR []:= ARRAY['Valor Nutritivo de Alimentos','Química, Física, Físico-Química e Bioquímica dos Alim. e das Mat.-Primas Alimentares','Microbiologia de Alimentos','Fisiologia Pós-Colheita','Toxicidade e Resíduos de Pesticidas em Alimentos','Avaliação e Controle de Qualidade de Alimentos','Padrões, Legislação e Fiscalização de Alimentos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia de Alimentos';
            areas VARCHAR []:= ARRAY['Tecnologia de Produtos de Origem Animal','Tecnologia de Produtos de Origem Vegetal','Tecnologia das Bebidas','Tecnologia de Alimentos Dietéticos e Nutricionais','Aproveitamento de Subprodutos','Embalagens de Produtos Alimentares'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Engenharia de Alimentos';
            areas VARCHAR []:= ARRAY['Instalações Industriais de Produção de Alimentos','Armazenamento de Alimentos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teoria do Direito';
            areas VARCHAR []:= ARRAY['Teoria Geral do Direito','Teoria Geral do Processo','Teoria do Estado','História do Direito','Filosofia do Direito','Lógica Jurídica','Sociologia Jurídica','Antropologia Jurídica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Direito Público';
            areas VARCHAR []:= ARRAY['Direito Tributário','Direito Penal','Direito Processual Penal','Direito Processual Civil','Direito Constitucional','Direito Administrativo','Direito Internacional Público'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Direito Privado';
            areas VARCHAR []:= ARRAY['Direito Civil','Direito Comercial','Direito do Trabalho','Direito Internacional Privado'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Administração de Empresas';
            areas VARCHAR []:= ARRAY['Administração da Produção','Administração Financeira','Mercadologia','Negócios Internacionais','Administração de Recursos Humanos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Administração Pública';
            areas VARCHAR []:= ARRAY['Contabilidade e Finanças Públicas','Organizações Públicas','Política e Planejamento Governamentais','Administração de Pessoal'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teoria Econômica';
            areas VARCHAR []:= ARRAY['Economia Geral','Teoria Geral da Economia','História do Pensamento Econômico','História Econômica','Sistemas Econômicos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Métodos Quantitativos em Economia';
            areas VARCHAR []:= ARRAY['Métodos e Modelos Matemáticos, Econométricos e Estatísticos','Estatística Sócio-Econômica','Contabilidade Nacional','Economia Matemática'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia Monetária e Fiscal';
            areas VARCHAR []:= ARRAY['Teoria Monetária e Financeira','Instituições Monetárias e Financeiras do Brasil','Finanças Públicas Internas','Política Fiscal do Brasil'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Crescimento, Flutuações e Planejamento Econômico';
            areas VARCHAR []:= ARRAY['Crescimento e Desenvolvimento Econômico','Teoria e Política de Planejamento Econômico','Flutuações Cíclicas e Projeções Econômicas','Inflação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia Internacional';
            areas VARCHAR []:= ARRAY['Teoria do Comércio Internacional','Relações do Comércio; Política Comercial; Integração Econômica','Balanço de Pagamentos; Finanças Internacionais','Investimentos Internacionais e Ajuda Externa'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia dos Recursos Humanos';
            areas VARCHAR []:= ARRAY['Treinamento e Alocação de Mão-de-Obra; Oferta de Mão-de-Obra e Força de Trabalho','Mercado de Trabalho; Política do Governo','Sindicatos, Dissídios Coletivos, Relações de Emprego (Empregador/Empregado)','Capital Humano','Demografia Econômica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia Industrial';
            areas VARCHAR []:= ARRAY['Organização Industrial e Estudos Industriais','Mudança Tecnológica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia do Bem-Estar Social';
            areas VARCHAR []:= ARRAY['Economia dos Programas de Bem-Estar Social','Economia do Consumidor'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economia Regional e Urbana';
            areas VARCHAR []:= ARRAY['Economia Regional','Economia Urbana','Renda e Tributação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Economias Agrária e dos Recursos Naturais';
            areas VARCHAR []:= ARRAY['Economia Agrária','Economia dos Recursos Naturais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos de Arquitetura e Urbanismo';
            areas VARCHAR []:= ARRAY['História da Arquitetura e Urbanismo','Teoria da Arquitetura','História do Urbanismo','Teoria do Urbanismo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Projeto de Arquitetura e Urbanismo';
            areas VARCHAR []:= ARRAY['Planejamento e Projetos da Edificação','Planejamento e Projeto do Espaço Urbano','Planejamento e Projeto do Equipamento'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tecnologia de Arquitetura e Urbanismo';
            areas VARCHAR []:= ARRAY['Adequação Ambiental'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Paisagismo';
            areas VARCHAR []:= ARRAY['Desenvolvimento Histórico do Paisagismo','Conceituação de Paisagismo e Metodologia do Paisagismo','Estudos de Organização do Espaço Exterior','Projetos de Espaços Livres Urbanos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos do Planejamento Urbano e Regional';
            areas VARCHAR []:= ARRAY['Teoria do Planejamento Urbano e Regional','Teoria da Urbanização','Política Urbana','História Urbana'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Métodos e Técnicas do Planejamento Urbano e Regional';
            areas VARCHAR []:= ARRAY['Informação, Cadastro e Mapeamento','Técnica de Previsão Urbana e Regional','Técnicas de Análise e Avaliação Urbana e Regional','Técnicas de Planejamento e Projeto Urbanos e Regionais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Serviços Urbanos e Regionais';
            areas VARCHAR []:= ARRAY['Administração Municipal e Urbana','Estudos da Habitação','Aspectos Sociais do Planejamento Urbano e Regional','Aspectos Econômicos do Planejamento Urbano e Regional','Aspectos Físico-Ambientais do Planejamento Urbano e Regional','Serviços Comunitários','Infra-Estruturas Urbanas e Regionais','Transporte e Tráfego Urbano e Regional','Legislação Urbana e Regional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Distribuição Espacial';
            areas VARCHAR []:= ARRAY['Distribuição Espacial Geral','Distribuição Espacial Urbana','Distribuição Espacial Rural'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tendência Populacional';
            areas VARCHAR []:= ARRAY['Tendências Passadas','Taxas e Estimativas Correntes','Projeções'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Componentes da Dinâmica Demográfica';
            areas VARCHAR []:= ARRAY['Fecundidade','Mortalidade','Migração'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Nupcialidade e Família';
            areas VARCHAR []:= ARRAY['Casamento e Divórcio','Família e Reprodução'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Demografia Histórica';
            areas VARCHAR []:= ARRAY['Distribuição Espacial','Natalidade, Mortalidade, Migração','Nupcialidade e Família','Métodos e Técnicas de Demografia Histórica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Política Pública e População';
            areas VARCHAR []:= ARRAY['Política Populacional','Políticas de Redistribuição de População','Políticas de Planejamento Familiar'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teoria da Informação';
            areas VARCHAR []:= ARRAY['Teoria Geral da Informação','Processos da Comunicação','Representação da Informação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Biblioteconomia';
            areas VARCHAR []:= ARRAY['Teoria da Classificação','Métodos Quantitativos. Bibliometria','Técnicas de Recuperação de Informação','Processos de Disseminação da Informação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Arquivologia';
            areas VARCHAR []:= ARRAY['Organização de Arquivos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Jornalismo e Editoração';
            areas VARCHAR []:= ARRAY['Teoria e Ética do Jornalismo','Organização Editorial de Jornais','Organização Comercial de Jornais','Jornalismo Especializado (Comunitário, Rural, Empresarial, Científico)'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Rádio e Televisão';
            areas VARCHAR []:= ARRAY['Radiodifusão','Videodifusão'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Serviço Social Aplicado';
            areas VARCHAR []:= ARRAY['Serviço Social do Trabalho','Serviço Social da Educação','Serviço Social do Menor','Serviço Social da Saúde','Serviço Social da Habitação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos da Sociologia';
            areas VARCHAR []:= ARRAY['Teoria Sociológica','História da Sociologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'História da América';
            areas VARCHAR []:= ARRAY['História dos Estados Unidos','História Latino-Americana'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'História do Brasil';
            areas VARCHAR []:= ARRAY['História do Brasil Colônia','História do Brasil Império','História do Brasil República','História Regional do Brasil'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geografia Humana';
            areas VARCHAR []:= ARRAY['Geografia da População','Geografia Agrária','Geografia Urbana','Geografia Econômica','Geografia Política'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Geografia Regional';
            areas VARCHAR []:= ARRAY['Teoria do Desenvolvimento Regional','Regionalização','Análise Regional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos e Medidas da Psicologia';
            areas VARCHAR []:= ARRAY['História, Teorias e Sistemas em Psicologia','Metodologia, Instrumentação e Equipamento em Psicologia','Construção e Validade de Testes, Escalas e Outras Medidas Psicológicas','Técnicas de Processamento Estatístico, Matemático e Computacional em Psicologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia Experimental';
            areas VARCHAR []:= ARRAY['Processos Perceptuais e Motores','Processos de Aprendizagem, Memória e Motivação','Processos Cognitivos e Atencionais','Estados Subjetivos e Emoção'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia Fisiológica';
            areas VARCHAR []:= ARRAY['Neurologia, Eletrofisiologia e Comportamento','Processos Psico-Fisiológicos','Estimulação Elétrica e com Drogas; Comportamento','Psicobiologia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia Comparativa';
            areas VARCHAR []:= ARRAY['Estudos Naturalísticos do Comportamento Animal','Mecanismos Instintivos e Processos Sociais em Animais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia Social';
            areas VARCHAR []:= ARRAY['Relações Interpessoais','Processos Grupais e de Comunicação','Papéis e Estruturas Sociais; Indivíduo'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia do Desenvolvimento Humano';
            areas VARCHAR []:= ARRAY['Processos Perceptuais e Cognitivos; Desenvolvimento','Desenvolvimento Social e da Personalidade'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia do Ensino e da Aprendizagem';
            areas VARCHAR []:= ARRAY['Planejamento Institucional','Programação de Condições de Ensino','Treinamento de Pessoal','Aprendizagem e Desempenho Acadêmicos','Ensino e Aprendizagem na Sala de Aula'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Psicologia do Trabalho e Organizacional';
            areas VARCHAR []:= ARRAY['Análise Institucional','Recrutamento e Seleção de Pessoal','Treinamento e Avaliação','Fatores Humanos no Trabalho','Planejamento Ambiental e Comportamento Humano'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tratamento e Prevenção Psicológica';
            areas VARCHAR []:= ARRAY['Intervenção Terapêutica','Programas de Atendimento Comunitário','Treinamento e Reabilitação','Desvios da Conduta','Distúrbios da Linguagem','Distúrbios Psicossomáticos'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos da Educação';
            areas VARCHAR []:= ARRAY['Filosofia da Educação','História da Educação','Sociologia da Educação','Antropologia Educacional','Economia da Educação','Psicologia Educacional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Administração Educacional';
            areas VARCHAR []:= ARRAY['Administração de Sistemas Educacionais','Administração de Unidades Educativas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Planejamento e Avaliação Educacional';
            areas VARCHAR []:= ARRAY['Política Educacional','Planejamento Educacional','Avaliação de Sistemas, Instituições, Planos e Programas Educacionais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Ensino-Aprendizagem';
            areas VARCHAR []:= ARRAY['Teorias da Instrução','Métodos e Técnicas de Ensino','Tecnologia Educacional','Avaliação da Aprendizagem'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Currículo';
            areas VARCHAR []:= ARRAY['Teoria Geral de Planejamento e Desenvolvimento Curricular','Currículos Específicos para Níveis e Tipos de Educação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Orientação e Aconselhamento';
            areas VARCHAR []:= ARRAY['Orientação Educacional','Orientação Vocacional'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Tópicos Específicos de Educação';
            areas VARCHAR []:= ARRAY['Educação de Adultos','Educação Permanente','Educação Rural','Educação em Periferias Urbanas','Educação Especial','Educação Pré-Escolar','Ensino Profissionalizante'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teoria Política';
            areas VARCHAR []:= ARRAY['Teoria Política Clássica','Teoria Política Medieval','Teoria Política Moderna','Teoria Política Contemporânea'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Estado e Governo';
            areas VARCHAR []:= ARRAY['Estrutura e Transformação do Estado','Sistemas Governamentais Comparados','Relações Intergovernamentais','Estudos do Poder Local','Instituições Governamentais Específicas'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Comportamento Político';
            areas VARCHAR []:= ARRAY['Estudos Eleitorais e Partidos Políticos','Atitude e Ideologias Políticas','Conflitos e Coalizões Políticas','Comportamento Legislativo','Classes Sociais e Grupos de Interesse'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Políticas Públicas';
            areas VARCHAR []:= ARRAY['Análise do Processo Decisório','Análise Institucional','Técnicas de Antecipação'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Política Internacional';
            areas VARCHAR []:= ARRAY['Política Externa do Brasil','Organizações Internacionais','Integração Internacional, Conflito, Guerra e Paz','Relações Internacionais, Bilaterais e Multilaterais'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Fundamentos e Crítica das Artes';
            areas VARCHAR []:= ARRAY['Teoria da Arte','História da Arte','Crítica da Arte'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Artes Plásticas';
            areas VARCHAR []:= ARRAY['Pintura','Desenho','Gravura','Escultura','Cerâmica','Tecelagem'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Música';
            areas VARCHAR []:= ARRAY['Regência','Instrumentação Musical','Composição Musical','Canto'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Dança';
            areas VARCHAR []:= ARRAY['Execução da Dança','Coreografia'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Teatro';
            areas VARCHAR []:= ARRAY['Dramaturgia','Direção Teatral','Cenografia','Interpretação Teatral'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;

    DO $$
        DECLARE
            area_pai VARCHAR := 'Cinema';
            areas VARCHAR []:= ARRAY['Administração e Produção de Filmes','Roteiro e Direção Cinematográficos','Técnicas de Registro e Processamento de Filmes','Interpretação Cinematográfica'];
        BEGIN
            CALL insert_area(area_pai, areas);
    END 
    $$;