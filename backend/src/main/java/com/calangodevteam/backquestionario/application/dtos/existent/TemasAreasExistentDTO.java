package com.calangodevteam.backquestionario.application.dtos.existent;

public class TemasAreasExistentDTO {
	
	private Long id;
    private TemaExistentDTO tema;
    private AreaConhecimentoExistentDTO areaConhecimento;

	public TemasAreasExistentDTO(){}

	public TemasAreasExistentDTO(Long id, TemaExistentDTO tema, AreaConhecimentoExistentDTO areaConhecimento) {
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

	public TemaExistentDTO getTema() {
		return tema;
	}

	public void setTema(TemaExistentDTO tema) {
		this.tema = tema;
	}

	public AreaConhecimentoExistentDTO getAreaConhecimento() {
		return areaConhecimento;
	}

	public void setAreaConhecimento(AreaConhecimentoExistentDTO areaConhecimento) {
		this.areaConhecimento = areaConhecimento;
	}

}
