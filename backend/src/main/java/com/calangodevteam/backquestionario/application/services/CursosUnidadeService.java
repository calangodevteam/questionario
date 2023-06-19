package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.calangodevteam.backquestionario.domain.models.CursosUnidade;
import com.calangodevteam.backquestionario.domain.repositories.CursosUnidadeRepository;

@Service
public class CursosUnidadeService {
	
	@Autowired
	private CursosUnidadeRepository cursosUnidadeRepository;

	public Page<CursosUnidade> findAllByUnidade(Pageable pageable, Integer id){
	
		return cursosUnidadeRepository.findAllByUnidadeId(pageable,id);
	}
	
	public List<CursosUnidade> findAllByUnidade(Integer id){
		
		return cursosUnidadeRepository.findAllByUnidadeId(id);
	}

	public Page<CursosUnidade> findAll(Pageable pageable) {
		return cursosUnidadeRepository.findAll(pageable);
	}

}
