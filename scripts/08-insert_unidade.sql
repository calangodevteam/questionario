---- Insert Unidades -----

DO $$
    DECLARE
	   id_inst integer;
    BEGIN
		id_inst:= idInst('UERJ');
		INSERT INTO unidade(NOME, ENDERECO_CEP, ENDERECO_ESTADO, ENDERECO_CIDADE, ENDERECO_RUA, ENDERECO_BAIRRO, ENDERECO_NUMERO, INSTITUICAO_ID) VALUES('UERJ-ZO', '23070-200', 'RJ', 'Rio de Janeiro', 'Av. Manuel Caldeira de Alvarenga', 'Campo Grande', 1203, id_inst);
END 
$$;