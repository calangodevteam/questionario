package com.calangodevteam.backquestionario.domain.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Pontuacao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer estrelas;
	private Integer nivel;
	private Integer experiencia;
	
	@Column(name = "prox_nivel")
	private Integer proxNivel;

    @OneToOne
    @JoinColumn(name = "aluno_id")
    private Aluno aluno;
}