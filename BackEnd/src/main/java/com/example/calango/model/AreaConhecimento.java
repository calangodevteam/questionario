package com.example.calango.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;

@Entity
public class AreaConhecimento {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String nome;
	
	@OneToMany
	@JoinColumn(name="id_pai")
    private List<AreaConhecimento> children = new ArrayList<>();
	
	@OneToMany
	@JoinColumn(name="area_conhecimento_id")
	private List<Tema> temas = new ArrayList<>();
	
    public AreaConhecimento() {
	}
    
    public AreaConhecimento(String nome, List<Tema> temas, List<AreaConhecimento> children) {
		this.nome = nome;
		this.temas = temas;
		this.children = children;
	}

	public void setChild(List<AreaConhecimento> children) {
        this.children = children;
    }

    public List<AreaConhecimento> getChildren() {
        return children;
    }
    
    public void setTema(List<Tema> temas) {
    	this.temas = temas;
    }

    public List<Tema> getTema() {
        return temas;
    }

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
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
