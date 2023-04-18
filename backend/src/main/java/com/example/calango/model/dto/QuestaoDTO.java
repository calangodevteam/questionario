package com.example.calango.model.dto;

import java.util.List;

import com.example.calango.model.Artigo;
import com.example.calango.model.Figura;
import com.example.calango.model.Opcao;
import com.example.calango.model.enums.Bloom;

public class QuestaoDTO {
	
	private Integer id;
	private Bloom categoriaBloom;
	private List<Artigo> artigos;
	private List<Figura> figuras;
	private List<Opcao> opcoes;
    private Integer opcao_corretaId;
	private TemaDTO tema;
	
	public QuestaoDTO() {
		
	}
	
	public QuestaoDTO(Integer id, Bloom categoriaBloom, List<Artigo> artigos, List<Figura> figuras, List<Opcao> opcoes,
			Integer opcao_corretaId, TemaDTO tema) {
		this.id = id;
		this.categoriaBloom = categoriaBloom;
		this.artigos = artigos;
		this.figuras = figuras;
		this.opcoes = opcoes;
		this.opcao_corretaId = opcao_corretaId;
		this.tema = tema;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getOpcao_corretaId() {
		return opcao_corretaId;
	}

	public void setOpcao_corretaId(Integer opcao_corretaId) {
		this.opcao_corretaId = opcao_corretaId;
	}

	public TemaDTO getTema() {
		return tema;
	}

	public void setTema(TemaDTO tema) {
		this.tema = tema;
	}
	
}
