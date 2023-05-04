package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;

import com.example.calango.model.enums.Modalidade;
import com.fasterxml.jackson.annotation.JsonIgnore;

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

@Entity
public class Curso {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    
	private String nome;
	
	@Column(name = "modalidade_curso")
	@Enumerated(EnumType.STRING)
	private Modalidade modalidade;
	
	@ManyToMany
	@JoinTable(name = "ementa",
	joinColumns = @JoinColumn(name = "curso_id"),
	inverseJoinColumns = @JoinColumn(name = "tema_id")
	)
	private List<Tema> temas = new ArrayList<>(); 
	
	@JsonIgnore
	@ManyToMany(mappedBy = "cursos")
	private List<Unidade> unidades = new ArrayList<>();

	public Curso() {
		// TODO Auto-generated constructor stub
	}

	public Curso(Integer id, String nome, Modalidade modalidade, List<Tema> temas, List<Unidade> unidades) {
		this.id = id;
		this.nome = nome;
		this.modalidade = modalidade;
		this.temas = temas;
		this.unidades = unidades;
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

	public Modalidade getModalidade() {
		return modalidade;
	}

	public void setModalidade(Modalidade modalidade) {
		this.modalidade = modalidade;
	}

	public List<Tema> getTemas() {
		return temas;
	}

	public void setTemas(List<Tema> temas) {
		this.temas = temas;
	}

	public List<Unidade> getUnidades() {
		return unidades;
	}

	public void setUnidades(List<Unidade> unidades) {
		this.unidades = unidades;
	}
	
}
