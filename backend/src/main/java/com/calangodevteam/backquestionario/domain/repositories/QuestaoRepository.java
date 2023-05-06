package com.calangodevteam.backquestionario.domain.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Questao;

public interface QuestaoRepository extends JpaRepository<Questao, Integer>{
	
	List<Questao> findByOrderByTemaNomeAsc();
	
	List<Questao> findByTema(Integer temaId);

}
