package com.example.calango.model.dto;

import java.util.ArrayList;
import java.util.List;

public class TemaDTO {
	
	private Integer id;
	private String nome;
	private List<AreasConhecimentoTem> areasConhecimento = new ArrayList<>();
	
	public TemaDTO() {
		
	}

	public TemaDTO(Integer id, String nome, List<AreasConhecimentoTem> areasConhecimento) {
		this.id = id;
		this.nome = nome;
		this.areasConhecimento = areasConhecimento;
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
	
	public List<AreasConhecimentoTem> getAreasConhecimento() {
		return areasConhecimento;
	}

	public void setAreasConhecimento(List<AreasConhecimentoTem> areasConhecimento) {
		this.areasConhecimento = areasConhecimento;
	}

	private static class AreasConhecimentoTem {
		
		private Integer id;

		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		
	}

}
