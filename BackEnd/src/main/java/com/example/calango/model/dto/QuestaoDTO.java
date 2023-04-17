package com.example.calango.model.dto;

import java.util.List;

import com.example.calango.model.Artigo;
import com.example.calango.model.Opcao;
import com.example.calango.model.Tema;
import com.example.calango.model.enums.Bloom;

public class QuestaoDTO {

	private Integer id;
	private String texto;
	private Bloom categoriaBloom;
	private List<Artigo> artigos;
	private List<FigurasDTO> figuras;
	private List<Opcao> opcoes;
    private Opcao opcao_correta;
	private Tema tema;
    private Integer questionarioId;
    
	public QuestaoDTO() {
		
	}
	
	public QuestaoDTO(Integer id, String texto, Bloom categoriaBloom, List<Artigo> artigos, List<FigurasDTO> figuras,
			List<Opcao> opcoes, Opcao opcao_correta, Tema tema, Integer questionarioId) {
		this.id = id;
		this.texto = texto;
		this.categoriaBloom = categoriaBloom;
		this.artigos = artigos;
		this.figuras = figuras;
		this.opcoes = opcoes;
		this.opcao_correta = opcao_correta;
		this.tema = tema;
		this.questionarioId = questionarioId;
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

	public List<FigurasDTO> getFiguras() {
		return figuras;
	}

	public void setFiguras(List<FigurasDTO> figuras) {
		this.figuras = figuras;
	}

	public List<Opcao> getOpcoes() {
		return opcoes;
	}

	public void setOpcoes(List<Opcao> opcoes) {
		this.opcoes = opcoes;
	}

	public Opcao getOpcao_correta() {
		return opcao_correta;
	}

	public void setOpcao_correta(Opcao opcao_correta) {
		this.opcao_correta = opcao_correta;
	}

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}

	public Integer getQuestionarioId() {
		return questionarioId;
	}

	public void setQuestionarioId(Integer questionarioId) {
		this.questionarioId = questionarioId;
	}
    
}
