package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Unidade;

public interface UnidadeRepository extends JpaRepository<Unidade, Integer>{

	Page<Unidade> findAll(Pageable pageable);
	Page<Unidade> findAllByInstituicaoId(Pageable pageable, int instId);

}