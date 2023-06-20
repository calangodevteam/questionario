package com.calangodevteam.backquestionario.application.dtos;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class InsertPontuacaoDTO {

	Integer estrelas;
	Integer experiencia;
	
	@NotNull
	Integer aluno_id;
}
