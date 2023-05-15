package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class AreaConhecimento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String nome;

	@ManyToOne
	@JoinColumn(name = "id_pai")
	private AreaConhecimento pai;

	@JsonIgnore
	@OneToMany(mappedBy = "pai", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<AreaConhecimento> subAreas = new ArrayList<>();
	
	public AreaConhecimento() {
		
	}

	public AreaConhecimento(Integer id, String nome, AreaConhecimento pai, List<AreaConhecimento> subAreas) {
		this.id = id;
		this.nome = nome;
		this.pai = pai;
		this.subAreas = subAreas;
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

	public AreaConhecimento getPai() {
		return pai;
	}

	public void setPai(AreaConhecimento pai) {
		this.pai = pai;
	}

	public List<AreaConhecimento> getSubAreas() {
		return subAreas;
	}


	public void setSubAreas(List<AreaConhecimento> subAreas) {
		this.subAreas = subAreas;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AreaConhecimento other = (AreaConhecimento) obj;
		return Objects.equals(id, other.id);
	}
	
}
