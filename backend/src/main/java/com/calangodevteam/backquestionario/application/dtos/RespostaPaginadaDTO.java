package com.calangodevteam.backquestionario.application.dtos;

import java.util.List;

public class RespostaPaginadaDTO<T> {

    private List<T> elementos;
    private boolean temMaisElementos;

    public List<T> getElementos() {
        return elementos;
    }
    public void setElementos(List<T> elementos) {
        this.elementos = elementos;
    }
    public boolean isTemMaisElementos() {
        return temMaisElementos;
    }
    public void setTemMaisElementos(boolean temMaisElementos) {
        this.temMaisElementos = temMaisElementos;
    }

    public RespostaPaginadaDTO(List<T> elementos, boolean temMaisElementos) {
        this.elementos = elementos;
        this.temMaisElementos = temMaisElementos;
    }

    public RespostaPaginadaDTO() {}

}
