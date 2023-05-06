package com.calangodevteam.backquestionario.domain.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Tema;

public interface TemaRepository extends JpaRepository<Tema, Integer>{
	
	List<Tema> findByAreasConhecimentoId(Integer id);
	
	List<Tema> findAllByOrderByNomeAsc();

}
