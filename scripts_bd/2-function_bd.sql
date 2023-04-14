DROP PROCEDURE IF EXISTS insert_area;
DROP FUNCTION IF EXISTS idArea;
DROP FUNCTION IF EXISTS idTema;
DROP FUNCTION IF EXISTS idQuestao;
DROP FUNCTION IF EXISTS idTemaQuestao;
DROP FUNCTION IF EXISTS idOpcao;
DROP FUNCTION IF EXISTS idArtigo;

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