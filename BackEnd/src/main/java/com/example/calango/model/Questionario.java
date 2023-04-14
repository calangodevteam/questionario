package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.example.calango.model.enums.Dificuldade;

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
import jakarta.persistence.ManyToOne;

@Entity
public class Questionario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String titulo;
	private Integer qtd_questoes;
	
	private Integer tempo_duracao;
	private Integer tempo_disponivel;
	
	@Column(name = "nivel_dificuldade")
	@Enumerated(EnumType.STRING)
	private Dificuldade dificuldade;
	
    @ManyToOne
	@JoinColumn(name="area_Conhecimento_id")
	private AreaConhecimento areaConhecimento;
    
    @ManyToMany
	@JoinTable(name = "temas_questionario",
	joinColumns = @JoinColumn(name = "questionario_id"),
	inverseJoinColumns = @JoinColumn(name = "tema_id")
	)
	private List<Tema> temas = new ArrayList<>();
	
	@ManyToMany
	@JoinTable(name = "questoes_questionario",
	joinColumns = @JoinColumn(name = "questionario_id"),
	inverseJoinColumns = @JoinColumn(name = "questao_id")
	)
	private List<Questao> questoes = new ArrayList<>();

	public Questionario() {
		
	}
	
	public Questionario(Integer id, String titulo, Integer qtd_questoes, Integer tempo_duracao,
			Integer tempo_disponivel, Dificuldade dificuldade, AreaConhecimento areaConhecimento, List<Tema> temas,
			List<Questao> questoes) {
		
		this.id = id;
		this.titulo = titulo;
		this.qtd_questoes = qtd_questoes;
		this.tempo_duracao = tempo_duracao;
		this.tempo_disponivel = tempo_disponivel;
		this.dificuldade = dificuldade;
		this.areaConhecimento = areaConhecimento;
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

	public AreaConhecimento getAreaConhecimento() {
		return areaConhecimento;
	}

	public void setAreaConhecimento(AreaConhecimento areaConhecimento) {
		this.areaConhecimento = areaConhecimento;
	}

	public List<Questao> getQuestoes() {
		return questoes;
	}

	public void setQuestoes(List<Questao> questoes) {
		this.questoes = questoes;
	}

	public List<Tema> getTemas() {
		return temas;
	}

	public void setTemas(List<Tema> temas) {
		this.temas = temas;
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
		Questionario other = (Questionario) obj;
		return Objects.equals(id, other.id);
	}
	
}
