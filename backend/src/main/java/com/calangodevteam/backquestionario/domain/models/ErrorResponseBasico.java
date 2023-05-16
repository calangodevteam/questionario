package com.calangodevteam.backquestionario.domain.models;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ErrorResponseBasico {
    
    private String mensagemDeErro;
    private LocalDateTime dataHora;
    
}