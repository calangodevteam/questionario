package com.calangodevteam.backquestionario.domain.exceptions;

public class ResourceNotFoundException extends RuntimeException {
    public ResourceNotFoundException(String mensagemDeErro){
        super(mensagemDeErro);
    }
}
