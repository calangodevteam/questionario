package com.calangodevteam.backquestionario.application.dtos.existent;

import java.util.List;

public class TemaExistentDTO {
	
	private Integer id;
	private String nome;

	public TemaExistentDTO(){}
	
	public TemaExistentDTO(Integer id, String nome) {
		this.id = id;
		this.nome = nome;
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

}
