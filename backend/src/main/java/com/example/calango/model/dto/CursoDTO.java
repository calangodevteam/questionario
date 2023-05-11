package com.example.calango.model.dto;

import com.example.calango.model.enums.Modalidade;

public class CursoDTO {

	private Integer id;
	private String nome;
	private Modalidade modalidade;
	
	public CursoDTO() {
		// TODO Auto-generated constructor stub
	}

	public CursoDTO(Integer id, String nome, Modalidade modalidade) {
		this.id = id;
		this.nome = nome;
		this.modalidade = modalidade;
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

	public Modalidade getModalidade() {
		return modalidade;
	}

	public void setModalidade(Modalidade modalidade) {
		this.modalidade = modalidade;
	}
	
}
