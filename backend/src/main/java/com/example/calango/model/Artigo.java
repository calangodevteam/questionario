package com.example.calango.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Artigo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String url;
	private String titulo;
	
	@Column(name = "data_publicacao")
	private Date dataPublicacao;
	
	@ElementCollection
	@CollectionTable(name="autor_artigo")
	private Set<String> autor = new HashSet<>();
	
	public Artigo() {
		
	}

	public Artigo(Integer id, String url, String titulo, Date dataPublicacao, Set<String> autor) {
		this.id = id;
		this.url = url;
		this.titulo = titulo;
		this.dataPublicacao = dataPublicacao;
		this.autor = autor;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Date getDataPublicacao() {
		return dataPublicacao;
	}

	public void setDataPublicacao(Date dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public Set<String> getAutor() {
		return autor;
	}

	public void setAutor(Set<String> autor) {
		this.autor = autor;
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
		Artigo other = (Artigo) obj;
		return Objects.equals(id, other.id);
	}
	
}
