package com.example.calango.model.dto;

import java.util.ArrayList;
import java.util.List;

public class AreasDTO {

	private Integer id;
	private String nome;
	private Integer paiId;
	private List<AreasDTO> subAreas = new ArrayList<>();
	private List<TemaDTO> temas = new ArrayList<>();

	public Integer getPaiId() {
		return paiId;
	}

	public void setPaiId(Integer paiId) {
		this.paiId = paiId;
	}

	
	public AreasDTO() {
		
	}
	
	public AreasDTO(Integer id, String nome, Integer paiId, List<AreasDTO> subAreas, List<TemaDTO> temas) {
		super();
		this.id = id;
		this.nome = nome;
		this.paiId = paiId;
		this.subAreas = subAreas;
		this.temas = temas;
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

	public List<AreasDTO> getSubAreas() {
		return subAreas;
	}

	public void setSubAreas(List<AreasDTO> subAreas) {
		this.subAreas = subAreas;
	}

	public List<TemaDTO> getTemas() {
		return temas;
	}

	public void setTemas(List<TemaDTO> temas) {
		this.temas = temas;
	}
}
