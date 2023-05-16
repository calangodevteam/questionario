package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.List;

import com.calangodevteam.backquestionario.domain.models.enums.Bloom;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "questao")
public class Questao2 {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition="TEXT")
	private String texto;
	
	@Column(name = "categoria_bloom")
	@Enumerated(EnumType.STRING)
	private Bloom categoriaBloom;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Artigo> artigos;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Figura> figuras;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Opcao> opcoes;

    @OneToOne
    @JoinColumn(name = "opcao_correta")
    private Opcao opcaoCorreta;
    
    @ManyToOne
	@JoinColumn(name="temas_areas_id")
	private TemasAreas temasAreas;
    
    @JsonIgnore
    @ManyToMany(mappedBy = "questoes")
    private List<Questionario> questionarios = new ArrayList<>();

	public Questao2(){

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Bloom getCategoriaBloom() {
		return categoriaBloom;
	}

	public void setCategoriaBloom(Bloom categoriaBloom) {
		this.categoriaBloom = categoriaBloom;
	}

	public List<Artigo> getArtigos() {
		return artigos;
	}

	public void setArtigos(List<Artigo> artigos) {
		this.artigos = artigos;
	}

	public List<Figura> getFiguras() {
		return figuras;
	}

	public void setFiguras(List<Figura> figuras) {
		this.figuras = figuras;
	}

	public List<Opcao> getOpcoes() {
		return opcoes;
	}

	public void setOpcoes(List<Opcao> opcoes) {
		this.opcoes = opcoes;
	}

	public Opcao getOpcaoCorreta() {
		return opcaoCorreta;
	}

	public void setOpcaoCorreta(Opcao opcaoCorreta) {
		this.opcaoCorreta = opcaoCorreta;
	}

	public TemasAreas getTemasAreas() {
		return temasAreas;
	}

	public void setTemasAreas(TemasAreas temasAreas) {
		this.temasAreas = temasAreas;
	}

	public List<Questionario> getQuestionarios() {
		return questionarios;
	}

	public void setQuestionarios(List<Questionario> questionarios) {
		this.questionarios = questionarios;
	}

}