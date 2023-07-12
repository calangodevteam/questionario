package com.calangodevteam.backquestionario.application.dtos;

import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.Questao2;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespostaDTO {
	
	private Integer id;

	private Aluno aluno;

	private Questionario questionario;

    private Questao2 questao;

    private Opcao opcao;
    
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public
	static class Aluno {
		
		private Integer id;
		private String nome;
	}
    
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Questionario {
		
		private Integer id;
		private String titulo;
	}
    
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Questao {
		private Integer id;
		private String texto;
	}

}
