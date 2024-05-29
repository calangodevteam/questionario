package com.calangodevteam.backquestionario.domain.models;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Artigo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String url;
	private String titulo;
	
	@Column(name = "data_publicacao")
	private LocalDateTime dataPublicacao;
	
	@ElementCollection
	@CollectionTable(name="autor_artigo")
	private Set<String> autor = new HashSet<>();
	
	@Column(columnDefinition="TEXT")
	private String conteudo;
	
}
