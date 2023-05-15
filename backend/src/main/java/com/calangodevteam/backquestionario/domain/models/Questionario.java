package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.calangodevteam.backquestionario.domain.models.enums.Dificuldade;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Questionario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String titulo;
	private Integer qtdQuestoes;
	
	private Integer tempoDuracao;
	private Integer tempoDisponivel;
	
	@Column(name = "nivel_dificuldade")
	@Enumerated(EnumType.STRING)
	private Dificuldade dificuldade;
	
	@ManyToMany
	@JoinTable(name = "questoes_questionario",
	joinColumns = @JoinColumn(name = "questionario_id"),
	inverseJoinColumns = @JoinColumn(name = "questao_id")
	)
	private List<Questao2> questoes = new ArrayList<>();

	public Questionario(){};

	public Questionario(Integer id, String titulo, Integer qtdQuestoes, Integer tempoDuracao, Integer tempoDisponivel,
			Dificuldade dificuldade, List<Questao2> questoes) {
		this.id = id;
		this.titulo = titulo;
		this.qtdQuestoes = qtdQuestoes;
		this.tempoDuracao = tempoDuracao;
		this.tempoDisponivel = tempoDisponivel;
		this.dificuldade = dificuldade;
		this.questoes = questoes;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getQtdQuestoes() {
		return qtdQuestoes;
	}

	public void setQtdQuestoes(Integer qtdQuestoes) {
		this.qtdQuestoes = qtdQuestoes;
	}

	public Integer getTempoDuracao() {
		return tempoDuracao;
	}

	public void setTempoDuracao(Integer tempoDuracao) {
		this.tempoDuracao = tempoDuracao;
	}

	public Integer getTempoDisponivel() {
		return tempoDisponivel;
	}

	public void setTempoDisponivel(Integer tempoDisponivel) {
		this.tempoDisponivel = tempoDisponivel;
	}

	public Dificuldade getDificuldade() {
		return dificuldade;
	}

	public void setDificuldade(Dificuldade dificuldade) {
		this.dificuldade = dificuldade;
	}

	public List<Questao2> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<Questao2> questoes) {
		this.questoes = questoes;
	}

}
