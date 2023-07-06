package com.calangodevteam.backquestionario.application.dtos;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.calangodevteam.backquestionario.domain.models.AreaConhecimento;
import com.calangodevteam.backquestionario.domain.models.Artigo;
import com.calangodevteam.backquestionario.domain.models.Figura;
import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.Tema;
import com.calangodevteam.backquestionario.domain.models.enums.Bloom;
import com.calangodevteam.backquestionario.domain.models.enums.Dificuldade;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuestionarioDTO {

	private Integer id;
	
	private String titulo;
	private Integer qtdQuestoes;
	private Integer tempoDuracao;
	private Integer tempoDisponivel;
	private Dificuldade dificuldade;
	private LocalDateTime dataCriacao;
	private List<Questao> questoes = new ArrayList<>();
	private TemasAreasDTO temasAreas;
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	private static class Questao {

		private Integer id;
		private String texto;
		private Bloom categoriaBloom;
		private List<Artigo> artigos;
		private List<Figura> figuras;
		private List<Opcao> opcoes;
	    private Opcao opcaoCorreta;
		private TemasAreasDTO temasAreas;

	}
	
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	private static class TemasAreasDTO {
		
	    private Integer id;
	    private Tema tema;
	    private AreaConhecimento areaConhecimento;
	}

}
