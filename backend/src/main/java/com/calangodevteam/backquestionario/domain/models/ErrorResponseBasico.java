package com.calangodevteam.backquestionario.domain.models;

import java.time.LocalDateTime;

public class ErrorResponseBasico {
    
    private String mensagemDeErro;
    private LocalDateTime dataHora;

    public ErrorResponseBasico(String mensagemDeErro, LocalDateTime dataHora) {
        this.mensagemDeErro = mensagemDeErro;
        this.dataHora = dataHora;
    }

    public ErrorResponseBasico(){}

    public String getMensagemDeErro() {
        return mensagemDeErro;
    }

    public void setMensagemDeErro(String mensagemDeErro) {
        this.mensagemDeErro = mensagemDeErro;
    }

    public LocalDateTime getDataHora() {
        return dataHora;
    }

    public void setDataHora(LocalDateTime dataHora) {
        this.dataHora = dataHora;
    }
    
}