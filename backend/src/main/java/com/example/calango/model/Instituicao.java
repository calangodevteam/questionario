package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Instituicao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
    
	private String nome;
    private String cnpj;
    
    @JsonIgnore
    @OneToMany(mappedBy = "instituicao", cascade = CascadeType.ALL)
    private List<Unidade> unidades = new ArrayList<>();
    
    public Instituicao() {
		// TODO Auto-generated constructor stub
	}

	public Instituicao(Integer id, String nome, String cnpj, List<Unidade> unidades) {
		this.id = id;
		this.nome = nome;
		this.cnpj = cnpj;
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

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public List<Unidade> getUnidades() {
		return unidades;
	}

	public void setUnidades(List<Unidade> unidades) {
		this.unidades = unidades;
	}

}
