package com.calangodevteam.backquestionario.domain.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class AreaConhecimento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String nome;

	@ManyToOne
	@JoinColumn(name = "id_pai")
	private AreaConhecimento pai;
	
	public AreaConhecimento() {
		
	}

	public AreaConhecimento(Integer id, String nome, AreaConhecimento pai) {
		this.id = id;
		this.nome = nome;
		this.pai = pai;
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

	public AreaConhecimento getPai() {
		return pai;
	}

	public void setPai(AreaConhecimento pai) {
		this.pai = pai;
	}
	
}
