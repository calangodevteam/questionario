package com.calangodevteam.backquestionario.domain.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Questao2;

public interface Questao2Repository extends JpaRepository<Questao2, Integer>{

	Page<Questao2> findAll(Pageable pageable);
	Page<Questao2> findAllByTemasAreasId(Pageable pageable, int temasAreasId);
	
	//List<Questao2> findByOrderByTemaNomeAsc();
	
	//List<Questao2> findByTema(Integer temaId);

}