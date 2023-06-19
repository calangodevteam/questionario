package com.calangodevteam.backquestionario.domain.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.CursosUnidade;

public interface CursosUnidadeRepository extends JpaRepository<CursosUnidade, Integer>{

	Page<CursosUnidade> findAll(Pageable pageable);
	Page<CursosUnidade> findAllByUnidadeId(Pageable pageable, int uniId);
	List<CursosUnidade> findAllByUnidadeId(int uniId);

}