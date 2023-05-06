package com.calangodevteam.backquestionario.application.dtos.existent;

import java.util.List;

public class TemaExistentDTO {
	
	private final Integer id;
	private final String nome;
	private final List<AreaConhecimentoExistentDTO> areasConhecimento;
	
	public TemaExistentDTO(Integer id, String nome, List<AreaConhecimentoExistentDTO> areasConhecimento) {
		this.id = id;
		this.nome = nome;
		this.areasConhecimento = areasConhecimento;
	}

	public Integer getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public List<AreaConhecimentoExistentDTO> getAreasConhecimento() {
		return areasConhecimento;
	}
	
}
