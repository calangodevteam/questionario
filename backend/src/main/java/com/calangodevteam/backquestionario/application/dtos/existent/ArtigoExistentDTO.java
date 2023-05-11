package com.calangodevteam.backquestionario.application.dtos.existent;

import java.time.LocalDate;
import java.util.List;

public class ArtigoExistentDTO {

	private String url;
	private String titulo;
	private LocalDate dataPublicacao;
	private List<String> autor;

	public ArtigoExistentDTO(String url, String titulo, LocalDate dataPublicacao, List<String> autor) {
		this.url = url;
		this.titulo = titulo;
		this.dataPublicacao = dataPublicacao;
		this.autor = autor;
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

	public LocalDate getDataPublicacao() {
		return dataPublicacao;
	}

	public void setDataPublicacao(LocalDate dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public List<String> getAutor() {
		return autor;
	}

	public void setAutor(List<String> autor) {
		this.autor = autor;
	}
	
}