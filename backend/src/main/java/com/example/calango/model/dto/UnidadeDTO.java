package com.example.calango.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.example.calango.model.Endereco;
import com.example.calango.model.Instituicao;

public class UnidadeDTO {

	private Integer id;
	private String nome;
	private Endereco endereco;
	private Instituicao instituicao;
	private List<CursoDTO> cursos = new ArrayList<>();
	
	public UnidadeDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UnidadeDTO(Integer id, String nome, Endereco endereco, Instituicao instituicao, List<CursoDTO> cursos) {
		this.id = id;
		this.nome = nome;
		this.endereco = endereco;
		this.instituicao = instituicao;
		this.cursos = cursos;
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


	public Endereco getEndereco() {
		return endereco;
	}


	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Instituicao getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(Instituicao instituicao) {
		this.instituicao = instituicao;
	}

	public List<CursoDTO> getCursos() {
		return cursos;
	}


	public void setCursos(List<CursoDTO> cursos) {
		this.cursos = cursos;
	}

}
