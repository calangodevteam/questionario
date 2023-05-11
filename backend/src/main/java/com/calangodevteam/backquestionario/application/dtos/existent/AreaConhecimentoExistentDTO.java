package com.calangodevteam.backquestionario.application.dtos.existent;

public class AreaConhecimentoExistentDTO {

    private Integer id;
	private String nome;
    private AreaConhecimentoExistentDTO areaConhecimentoPai;
    
    public AreaConhecimentoExistentDTO(){}

    public AreaConhecimentoExistentDTO(Integer id, String nome, AreaConhecimentoExistentDTO areaConhecimentoPai) {
        this.id = id;
        this.nome = nome;
        this.areaConhecimentoPai = areaConhecimentoPai;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public AreaConhecimentoExistentDTO getAreaConhecimentoPai() {
        return areaConhecimentoPai;
    }

    public void setAreaConhecimentoPai(AreaConhecimentoExistentDTO areaConhecimentoPai) {
        this.areaConhecimentoPai = areaConhecimentoPai;
    }

}