package com.calangodevteam.backquestionario.application.dtos;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertPontuacaoDTO {
	
	Integer estrelas;
	Integer experiencia;
	
	@NotBlank(message="Insira o Id do Aluno!")
	Integer aluno_id;
}
