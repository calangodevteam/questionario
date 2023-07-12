package com.calangodevteam.backquestionario.domain.models;

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
public class Resposta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
    @JoinColumn(name = "aluno_id")
	private Aluno aluno;
	
	@ManyToOne
    @JoinColumn(name = "questionario_id")
	private Questionario questionario;
	
	@ManyToOne
    @JoinColumn(name = "questao_id")
    private Questao2 questao;
	
	@ManyToOne
    @JoinColumn(name = "opcao_id")
    private Opcao opcao;

}
