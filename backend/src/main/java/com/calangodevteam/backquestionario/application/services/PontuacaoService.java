package com.calangodevteam.backquestionario.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.InsertPontuacaoDTO;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.Pontuacao;
import com.calangodevteam.backquestionario.domain.repositories.PontuacaoRepository;

@Service
public class PontuacaoService {
	
	@Autowired
	private PontuacaoRepository pontuacaoRepository;

	public Pontuacao findByAluno(Integer id){
	
		Pontuacao pontuacao = pontuacaoRepository.findByAlunoId(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Pontuação do aluno não encontrada! Id: " + id));

		return pontuacao;
	}

	public Page<Pontuacao> findAll(Pageable pageable) {
		return pontuacaoRepository.findAll(pageable);
	}
	
	public Integer update(InsertPontuacaoDTO pontDto) {
		
		if(pontDto.getEstrelas() == null)
			pontDto.setEstrelas(0);
		if(pontDto.getExperiencia() == null)
			pontDto.setExperiencia(0);
		
		return pontuacaoRepository.updateByAlunoId(pontDto.getEstrelas(), pontDto.getExperiencia(), pontDto.getAluno_id());
		
	}

}
