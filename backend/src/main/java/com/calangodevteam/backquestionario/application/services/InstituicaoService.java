package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.Instituicao;
import com.calangodevteam.backquestionario.domain.repositories.InstituicaoRepository;

@Service
public class InstituicaoService {
	
	@Autowired
	private InstituicaoRepository instituicaoRepository;

	public Instituicao findById(Integer id){
	
		Instituicao instituicao = instituicaoRepository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Pontuação do aluno não encontrada! Id: " + id));

		return instituicao;
	}

	public Page<Instituicao> findAll(Pageable pageable) {
		return instituicaoRepository.findAll(pageable);
	}
	
	public List<Instituicao> findAll() {
		return instituicaoRepository.findAll();
	}

}
