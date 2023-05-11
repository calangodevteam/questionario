package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

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
	@OneToMany(mappedBy = "tema", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Questao> questoes = new ArrayList<>();

	@JsonIgnore
	@OneToMany(mappedBy = "tema", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Questionario> questionarios = new ArrayList<>();
	
	private String nome;

	public Tema() {

	}

	public Tema(Integer id, List<AreaConhecimento> areasConhecimento, List<Questao> questoes,
			List<Questionario> questionarios, String nome) {
		this.id = id;
		this.areasConhecimento = areasConhecimento;
		this.questoes = questoes;
		this.questionarios = questionarios;
		this.nome = nome;
	}

	public List<Questao> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<Questao> questoes) {
		this.questoes = questoes;
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

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tema other = (Tema) obj;
		return Objects.equals(id, other.id);
	}
	
}
