package com.calangodevteam.backquestionario.application.handler;

import java.time.LocalDateTime;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.exceptions.ResourceNotFoundException;
import com.calangodevteam.backquestionario.domain.models.ErrorResponseBasico;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(ObjectNotFoundException.class)
    public ResponseEntity<ErrorResponseBasico> handleObjectNotFoundException(ObjectNotFoundException exception, HttpServletRequest request){

    	ErrorResponseBasico err = new ErrorResponseBasico();
        err.setTimestamp(LocalDateTime.now());
        err.setStatus(HttpStatus.NOT_FOUND.value());
        err.setError(HttpStatus.NOT_FOUND.getReasonPhrase());
        err.setMessage(exception.getMessage());
        err.setPath(request.getRequestURI());
        
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(err);
    }
    
    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<ErrorResponseBasico> handleResourceNotFoundException(ResourceNotFoundException exception, HttpServletRequest request){
    	
    	ErrorResponseBasico err = new ErrorResponseBasico();
        err.setTimestamp(LocalDateTime.now());
        err.setStatus(HttpStatus.NOT_FOUND.value());
        err.setError(HttpStatus.NOT_FOUND.getReasonPhrase());
        err.setMessage(exception.getMessage());
        err.setPath(request.getRequestURI());
        
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(err);
    }

    @ExceptionHandler(BadRequestException.class)
    public ResponseEntity<ErrorResponseBasico> handleBadRequestException(BadRequestException exception, HttpServletRequest request){

        ErrorResponseBasico err = new ErrorResponseBasico();
        err.setTimestamp(LocalDateTime.now());
        err.setStatus(HttpStatus.BAD_REQUEST.value());
        err.setError(HttpStatus.BAD_REQUEST.getReasonPhrase());
        err.setMessage(exception.getMessage());
        err.setPath(request.getRequestURI());
        
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(err);
    }
}
