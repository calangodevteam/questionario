package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;

@Entity
public class Unidade {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    
	private String nome;
	
	@Embedded
	private Endereco endereco;
	
	@ManyToOne
	@JoinColumn(name = "instituicao_id")
	private Instituicao instituicao;
	
	@ManyToMany
	@JoinTable(name = "cursos_unidade",
	joinColumns = @JoinColumn(name = "unidade_id"),
	inverseJoinColumns = @JoinColumn(name = "curso_id")
	)
	private List<Curso> cursos = new ArrayList<>();
	
	public Unidade() {
		// TODO Auto-generated constructor stub
	}

	public Unidade(Integer id, String nome, Endereco endereco, Instituicao instituicao, List<Curso> cursos) {
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
	public List<Curso> getCursos() {
		return cursos;
	}

	public void setCursos(List<Curso> cursos) {
		this.cursos = cursos;
	}
	

}
