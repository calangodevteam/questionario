package com.calangodevteam.backquestionario.application.dtos.existent;

import java.util.List;

import com.calangodevteam.backquestionario.domain.models.Artigo;
import com.calangodevteam.backquestionario.domain.models.Figura;
import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.enums.Bloom;

public class QuestaoExistentDTO {
	
	private Integer id;
	private String texto;
	private Bloom categoriaBloom;
	private List<Artigo> artigos;
	private List<Figura> figuras;
	private List<Opcao> opcoes;
    private Integer opcaoCorretaId;
	private TemasAreasExistentDTO temasAreas;

	public QuestaoExistentDTO(){}

	public QuestaoExistentDTO(Integer id, String texto, Bloom categoriaBloom, List<Artigo> artigos,
			List<Figura> figuras, List<Opcao> opcoes, Integer opcaoCorretaId,
			TemasAreasExistentDTO temasAreas) {
		this.id = id;
		this.texto = texto;
		this.categoriaBloom = categoriaBloom;
		this.artigos = artigos;
		this.figuras = figuras;
		this.opcoes = opcoes;
		this.opcaoCorretaId = opcaoCorretaId;
		this.temasAreas = temasAreas;
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

	public Integer getOpcaoCorretaId() {
		return opcaoCorretaId;
	}

	public void setOpcaoCorretaId(Integer opcaoCorretaId) {
		this.opcaoCorretaId = opcaoCorretaId;
	}

	public TemasAreasExistentDTO getTemasAreas() {
		return temasAreas;
	}

	public void setTemasAreas(TemasAreasExistentDTO temasAreas) {
		this.temasAreas = temasAreas;
	}
	
}
