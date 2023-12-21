package com.calangodevteam.backquestionario.domain.models;

import java.time.LocalDateTime;

import com.calangodevteam.backquestionario.domain.models.users.Aluno;

import jakarta.persistence.Column;
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
public class Resultado {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
    @JoinColumn(name = "aluno_id")
	private Aluno aluno;
	
	@ManyToOne
    @JoinColumn(name = "questionario_id")
	private Questionario questionario;
	
	private LocalDateTime inicio;
	private LocalDateTime termino;
	
	@Column(name = "qtd_acertos")
	private Integer acertos;

}
