package com.calangodevteam.backquestionario.domain.models.users;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.calangodevteam.backquestionario.domain.models.Curso;
import com.calangodevteam.backquestionario.domain.models.Endereco;

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
public class Professor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String nome;
	private String email;
	
	@Column(name = "foto_perfil")
	private String fotoPerfil;
	
	@Embedded
	private Endereco endereco;
	
	private String senha;
    
	@ManyToOne
	@JoinColumn(name="curso_id")
	private Curso curso;

    @CreationTimestamp
    private LocalDateTime dtCriacao;
	
}
