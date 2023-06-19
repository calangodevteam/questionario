package com.calangodevteam.backquestionario.domain.models;

import com.calangodevteam.backquestionario.domain.models.enums.Modalidade;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "cursos_unidade")
public class CursosUnidade {

    @Id
    @GeneratedValue
    private Long id;
    
	@Column(name = "modalidade_curso")
	@Enumerated(EnumType.STRING)
	private Modalidade modalidade;

    @ManyToOne
    @JoinColumn(name = "curso_id")
    private Curso curso;

    @ManyToOne
    @JoinColumn(name = "unidade_id")
    private Unidade unidade;

}