package com.calangodevteam.backquestionario.domain.exceptions;

public class ObjectNotFoundException extends RuntimeException {
	
    private static final long serialVersionUID = 1L;

	public ObjectNotFoundException(String mensagem){
        super(mensagem);
    }
}
