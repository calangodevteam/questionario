package com.calangodevteam.backquestionario.domain.exceptions;

public class BadRequestException extends RuntimeException{
    public BadRequestException(String mensagemDeErro){
        super(mensagemDeErro);
    }
}
