package com.calangodevteam.backquestionario.application.dtos.existent;

import java.time.LocalDate;
import java.util.List;

public class ArtigoExistentDTO {

	private final String url;
	private final String titulo;
	private final LocalDate dataPublicacao;
	private final List<String> autor;

	public ArtigoExistentDTO(String url, String titulo, LocalDate dataPublicacao, List<String> autor) {
		this.url = url;
		this.titulo = titulo;
		this.dataPublicacao = dataPublicacao;
		this.autor = autor;
	}

	public String getUrl() {
		return url;
	}
	public String getTitulo() {
		return titulo;
	}
	public LocalDate getDataPublicacao() {
		return dataPublicacao;
	}
	public List<String> getAutor() {
		return autor;
	}
	
}