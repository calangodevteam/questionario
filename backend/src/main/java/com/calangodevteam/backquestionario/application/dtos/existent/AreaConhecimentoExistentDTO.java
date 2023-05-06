package com.calangodevteam.backquestionario.application.dtos.existent;

public class AreaConhecimentoExistentDTO {

    private final Integer id;
	private final String nome;
    private final AreaConhecimentoExistentDTO areaConhecimentoPai;
    
    public AreaConhecimentoExistentDTO(Integer id, String nome, AreaConhecimentoExistentDTO areaConhecimentoPai) {
        this.id = id;
        this.nome = nome;
        this.areaConhecimentoPai = areaConhecimentoPai;
    }

    public Integer getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public AreaConhecimentoExistentDTO getAreaConhecimentoPai() {
        return areaConhecimentoPai;
    }
    
}