package com.calangodevteam.backquestionario.application.handler;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ResourceNotFoundException;
import com.calangodevteam.backquestionario.domain.models.ErrorResponseBasico;

@ControllerAdvice
public class RestExceptionHandler {
    
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponseBasico> handleResourceNotFoundException(ResourceNotFoundException exception){
        ErrorResponseBasico errorResponseBasico = new ErrorResponseBasico(exception.getMessage(), LocalDateTime.now());
        return new ResponseEntity<>(errorResponseBasico, HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ErrorResponseBasico> handleBadRequestException(BadRequestException exception){
        ErrorResponseBasico errorResponseBasico = new ErrorResponseBasico(exception.getMessage(), LocalDateTime.now());
        return new ResponseEntity<>(errorResponseBasico, HttpStatus.BAD_REQUEST);
    }
}
