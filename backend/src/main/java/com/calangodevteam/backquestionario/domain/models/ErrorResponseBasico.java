package com.calangodevteam.backquestionario.domain.models;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ErrorResponseBasico {
    
	private LocalDateTime timestamp;
	private Integer status;
	private String error;
	private String message;
	private String path;
    private List<Campo> campos;
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Campo{

        private String nome;
        private String mensagem;

    }
    
}