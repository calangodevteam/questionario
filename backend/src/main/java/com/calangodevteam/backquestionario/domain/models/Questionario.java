package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.calangodevteam.backquestionario.domain.models.enums.Dificuldade;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Questionario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String titulo;
	private Integer qtdQuestoes;
	
	private Integer tempoDuracao;
	private Integer tempoDisponivel;
	
	@Column(name = "nivel_dificuldade")
	@Enumerated(EnumType.STRING)
	private Dificuldade dificuldade;
	
	@ManyToMany
	@JoinTable(name = "questoes_questionario",
	joinColumns = @JoinColumn(name = "questionario_id"),
	inverseJoinColumns = @JoinColumn(name = "questao_id")
	)
	private List<Questao2> questoes = new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name="temas_areas_id")
	private TemasAreas temasAreas;
	
	@Column(name = "data_criacao")
	private Date dataCriacao;

}
