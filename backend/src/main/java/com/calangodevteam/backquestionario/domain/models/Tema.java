package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Tema{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToMany
	@JoinTable(name = "areas_tema",
	joinColumns = @JoinColumn(name = "tema_id"),
	inverseJoinColumns = @JoinColumn(name = "area_conhecimento_id")
	)
	private List<AreaConhecimento> areasConhecimento = new ArrayList<>();

	@JsonIgnore
	@ManyToMany(mappedBy = "temas")
	private List<Questionario> questionarios = new ArrayList<>();
	
	private String nome;

	public Tema() {

	}

	public Tema(Integer id, List<AreaConhecimento> areasConhecimento,
			List<Questionario> questionarios, String nome) {
		this.id = id;
		this.areasConhecimento = areasConhecimento;
		this.questionarios = questionarios;
		this.nome = nome;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<AreaConhecimento> getAreasConhecimento() {
		return areasConhecimento;
	}

	public void setAreasConhecimento(List<AreaConhecimento> areasConhecimento) {
		this.areasConhecimento = areasConhecimento;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Questionario> getQuestionarios() {
		return questionarios;
	}

	public void setQuestionarios(List<Questionario> questionarios) {
		this.questionarios = questionarios;
	}
	
}
