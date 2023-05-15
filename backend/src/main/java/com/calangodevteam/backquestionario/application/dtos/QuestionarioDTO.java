package com.calangodevteam.backquestionario.application.dtos;

import java.util.ArrayList;
import java.util.List;

import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.domain.models.enums.Dificuldade;

public class QuestionarioDTO {
	
	private Integer id;
	private String titulo;
	private Integer qtdQuestoes;
	private Integer tempoDuracao;
	private Integer tempoDisponivel;
	private Dificuldade dificuldade;
	private List<QuestaoExistentDTO> questoes = new ArrayList<>();
	
	public QuestionarioDTO() {
		
	}

	public QuestionarioDTO(Integer id, String titulo, Integer qtdQuestoes, Integer tempoDuracao,
			Integer tempoDisponivel, Dificuldade dificuldade, List<QuestaoExistentDTO> questoes) {
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

	public List<QuestaoExistentDTO> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<QuestaoExistentDTO> questoes) {
		this.questoes = questoes;
	}
}
