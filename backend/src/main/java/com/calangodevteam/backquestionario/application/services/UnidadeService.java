package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.calangodevteam.backquestionario.domain.models.Unidade;
import com.calangodevteam.backquestionario.domain.repositories.UnidadeRepository;

@Service
public class UnidadeService {
	
	@Autowired
	private UnidadeRepository unidadeRepository;

	public Page<Unidade> findAllByInstituicao(Pageable pageable, Integer id){
	
		return unidadeRepository.findAllByInstituicaoId(pageable,id);
	}
	
	public List<Unidade> findAllByInstituicao(Integer id){
		
		return unidadeRepository.findAllByInstituicaoId(id);
	}

	public Page<Unidade> findAll(Pageable pageable) {
		return unidadeRepository.findAll(pageable);
	}

}
