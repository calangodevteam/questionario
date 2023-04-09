package com.example.calango.model;

import java.util.List;
import java.util.Objects;

import com.example.calango.model.enums.Bloom;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Questao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition="TEXT")
	private String texto;
	
	@Column(name = "categoria_bloom")
	@Enumerated(EnumType.STRING)
	private Bloom categoriaBloom;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Artigo> artigos;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Figura> figuras;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Opcao> opcoes;
    
    @ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="tema_id")
	private Tema tema;

    public Questao() {
    	
    }
    
	public Questao(Integer id, String texto, Bloom categoriaBloom, List<Artigo> artigos, List<Figura> figuras,
			List<Opcao> opcoes, Tema tema) {
		this.id = id;
		this.texto = texto;
		this.categoriaBloom = categoriaBloom;
		this.artigos = artigos;
		this.figuras = figuras;
		this.opcoes = opcoes;
		this.tema = tema;
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

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
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
		Questao other = (Questao) obj;
		return Objects.equals(id, other.id);
	}

}
