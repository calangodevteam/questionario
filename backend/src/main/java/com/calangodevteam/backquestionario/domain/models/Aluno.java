package com.calangodevteam.backquestionario.domain.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embedded;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Aluno {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String nome;
	private String email;
	
	@Column(name = "foto_perfil")
	private String fotoPerfil;
	
	@Embedded
	private Endereco endereco;
	
	@ManyToOne
	@JoinColumn(name="cursos_unidade_id")
	private CursosUnidade cursosUnidade;
	
}
