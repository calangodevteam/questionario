package com.calangodevteam.backquestionario.application.dtos;

import java.util.ArrayList;
import java.util.List;

import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.domain.models.enums.Dificuldade;

public class QuestionarioDTO {
	
	private Integer id;
	private String titulo;
	private Integer qtd_questoes;
	private Integer tempo_duracao;
	private Integer tempo_disponivel;
	private Dificuldade dificuldade;
	private List<TemaQuest> temas= new ArrayList<>();
	private List<QuestaoExistentDTO> questoes = new ArrayList<>();
	
	public QuestionarioDTO() {
		
	}

	public QuestionarioDTO(Integer id, String titulo, Integer qtd_questoes, Integer tempo_duracao,
			Integer tempo_disponivel, Dificuldade dificuldade, List<TemaQuest> temas, List<QuestaoExistentDTO> questoes) {
		this.id = id;
		this.titulo = titulo;
		this.qtd_questoes = qtd_questoes;
		this.tempo_duracao = tempo_duracao;
		this.tempo_disponivel = tempo_disponivel;
		this.dificuldade = dificuldade;
		this.temas = temas;
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

	public Integer getQtd_questoes() {
		return qtd_questoes;
	}

	public void setQtd_questoes(Integer qtd_questoes) {
		this.qtd_questoes = qtd_questoes;
	}

	public Integer getTempo_duracao() {
		return tempo_duracao;
	}

	public void setTempo_duracao(Integer tempo_duracao) {
		this.tempo_duracao = tempo_duracao;
	}

	public Integer getTempo_disponivel() {
		return tempo_disponivel;
	}

	public void setTempo_disponivel(Integer tempo_disponivel) {
		this.tempo_disponivel = tempo_disponivel;
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
	
	public List<TemaQuest> getTemas() {
		return temas;
	}

	public void setTemas(List<TemaQuest> temas) {
		this.temas = temas;
	}

	private static class TemaQuest {
		
		private Integer id;
		private String nome;
		
		public TemaQuest() {
			
		}
		
		public TemaQuest(Integer id, String nome) {
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

}