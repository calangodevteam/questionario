package com.calangodevteam.backquestionario.application.dtos;

import com.calangodevteam.backquestionario.domain.models.Questao;

public class CadastroQuestaoDTO{
	
	private Questao questao;
	private String opcao_correta;
	
	public CadastroQuestaoDTO(){
		
	}
	
	public CadastroQuestaoDTO(Questao questao, String opcao_correta){
		this.questao = questao;
		this.opcao_correta = opcao_correta;
	}

	public Questao getQuestao() {
		return questao;
	}

	public void setQuestao(Questao questao) {
		this.questao = questao;
	}

	public String getOpcao_correta() {
		return opcao_correta;
	}

	public void setOpcao_correta(String opcao_correta) {
		this.opcao_correta = opcao_correta;
	}
}
