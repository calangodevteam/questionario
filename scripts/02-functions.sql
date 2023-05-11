
DROP PROCEDURE IF EXISTS insert_area;
DROP FUNCTION IF EXISTS idArea;
DROP FUNCTION IF EXISTS idTema;
DROP FUNCTION IF EXISTS idQuestao;
DROP FUNCTION IF EXISTS idTemaQuestao;
DROP FUNCTION IF EXISTS idOpcao;
DROP FUNCTION IF EXISTS idArtigo;
DROP FUNCTION IF EXISTS idQuestionario;
DROP FUNCTION IF EXISTS idInst;
DROP FUNCTION IF EXISTS idUnidade;
DROP FUNCTION IF EXISTS idCurso;

---- Criação de Funções/ Procedures ----

CREATE PROCEDURE insert_area(area_pai VARCHAR, areas VARCHAR [])
AS  $$
DECLARE
 	area_pai_id Integer;
	i Integer := 1;
BEGIN
	SELECT ID INTO area_pai_id FROM area_conhecimento WHERE NOME = area_pai;
	LOOP
		INSERT INTO area_conhecimento(NOME, ID_PAI) VALUES (areas[i], area_pai_id);
		i:= i+1;
		EXIT WHEN areas[i] is null or areas[i] like ' ';
	END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idArea(nomeArea Varchar) RETURNS integer AS $$
		DECLARE 
			areaId integer:= 0;
        BEGIN
        	SELECT ID INTO areaId FROM area_conhecimento WHERE NOME = nomeArea;
			RETURN areaId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idTema(nomeTema Varchar) RETURNS integer AS $$
		DECLARE 
			temaId integer:= 0;
        BEGIN
        	SELECT ID INTO temaId FROM tema WHERE NOME = nomeTema;
			RETURN temaId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idQuestao(texto_questao varchar) RETURNS integer AS $$
		DECLARE 
			questaoId integer:= 0;
        BEGIN
			SELECT ID INTO questaoId FROM questao WHERE TEXTO = texto_questao;
			RETURN questaoId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idTemaQuestao(questao_id integer) RETURNS integer AS $$
		DECLARE 
			id_tema integer:= 0;
        BEGIN
			SELECT TEMA_ID INTO id_tema FROM questao WHERE ID = questao_id;
			RETURN id_tema;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idOpcao(texto_opcao varchar, id_questao integer) RETURNS integer AS $$
		DECLARE 
			opcaoId integer:= 0;
        BEGIN
			SELECT ID INTO opcaoId FROM opcao WHERE TEXTO = texto_opcao AND QUESTAO_ID = id_questao;
			RETURN opcaoId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idArtigo(titulo_artigo varchar, id_questao integer) RETURNS integer AS $$
		DECLARE 
			artigoId integer:= 0;
        BEGIN
			SELECT ID INTO artigoId FROM artigo WHERE TITULO = titulo_artigo AND QUESTAO_ID = id_questao;
			RETURN artigoId;
        END;
$$ LANGUAGE plpgsql;

-- Function de teste que precisa de atenção ao usar, já que pode retornar mais de um resultado que irá gerar um erro!
CREATE FUNCTION idQuestionario(titulo_quest varchar) RETURNS integer AS $$
		DECLARE 
			questId integer:= 0;
        BEGIN
			SELECT ID INTO questId FROM questionario WHERE TITULO = titulo_quest;
			RETURN questId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idInst(nome_inst varchar) RETURNS integer AS $$
		DECLARE 
			instId integer:= 0;
        BEGIN
			SELECT ID INTO instId FROM instituicao WHERE NOME = nome_inst;
			RETURN instId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idUnidade(nome_uni varchar) RETURNS integer AS $$
		DECLARE 
			uniId integer:= 0;
        BEGIN
			SELECT ID INTO uniId FROM unidade WHERE NOME = nome_uni;
			RETURN uniId;
        END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION idCurso(nome_curso varchar, modalidade_cur modalidade) RETURNS integer AS $$
		DECLARE 
			cursoId integer:= 0;
        BEGIN
			SELECT ID INTO cursoId FROM curso WHERE NOME = nome_curso AND MODALIDADE_CURSO = modalidade_cur;
			RETURN cursoId;
        END;
$$ LANGUAGE plpgsql;