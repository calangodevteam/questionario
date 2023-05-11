package com.calangodevteam.backquestionario.domain.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "temas_areas")
public class TemasAreas {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "tema_id")
    private Tema tema;

    @ManyToOne
    @JoinColumn(name = "area_conhecimento_id")
    private AreaConhecimento areaConhecimento;

    public TemasAreas() {
    }

    public TemasAreas(Long id, Tema tema, AreaConhecimento areaConhecimento) {
        this.id = id;
        this.tema = tema;
        this.areaConhecimento = areaConhecimento;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Tema getTema() {
        return tema;
    }

    public void setTema(Tema tema) {
        this.tema = tema;
    }

    public AreaConhecimento getAreaConhecimento() {
        return areaConhecimento;
    }

    public void setAreaConhecimento(AreaConhecimento areaConhecimento) {
        this.areaConhecimento = areaConhecimento;
    }

}