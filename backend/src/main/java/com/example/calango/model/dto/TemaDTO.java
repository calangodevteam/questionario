package com.example.calango.model.dto;

public class TemaDTO {
	
	private Integer id;
	private String nome;
	private Integer areaConhecimentoId;
	
	public TemaDTO() {
		
	}

	public TemaDTO(Integer id, String nome, Integer areaConhecimentoId) {
		this.id = id;
		this.nome = nome;
		this.areaConhecimentoId = areaConhecimentoId;
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

	public Integer getAreaConhecimentoId() {
		return areaConhecimentoId;
	}

	public void setAreaConhecimentoId(Integer areaConhecimentoId) {
		this.areaConhecimentoId = areaConhecimentoId;
	}

}
