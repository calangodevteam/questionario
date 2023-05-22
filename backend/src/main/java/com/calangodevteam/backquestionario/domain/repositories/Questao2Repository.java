package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Questao2;

public interface Questao2Repository extends JpaRepository<Questao2, Integer>{

	Page<Questao2> findAll(Pageable pageable);
	Page<Questao2> findAllByTemasAreasId(Pageable pageable, int temasAreasId);

}