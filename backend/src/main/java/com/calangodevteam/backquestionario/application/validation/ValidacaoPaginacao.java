package com.calangodevteam.backquestionario.application.validation;
import java.util.List;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;

public class ValidacaoPaginacao {

	private int pageSizeMaximoPermitido;
    private List<String> sortsPermitidos;

    public ValidacaoPaginacao(int pageSizeMaximoPermitido, List<String> sortsPermitidos) {
        this.pageSizeMaximoPermitido = pageSizeMaximoPermitido;
        this.sortsPermitidos = sortsPermitidos;
    }

    public void validar(int size, String sort){
        if(size > this.pageSizeMaximoPermitido){
            throw new BadRequestException("Size não pode exceder " + pageSizeMaximoPermitido);
        }

        if(!this.sortsPermitidos.contains(sort)){
            throw new BadRequestException("Sort inválido!");
        }
    }
}