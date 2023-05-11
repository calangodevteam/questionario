package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.TemasAreas;

public interface TemasAreasRepository extends JpaRepository<TemasAreas, Integer>{
	
    Page<TemasAreas> findAll(Pageable pageable);
    Page<TemasAreas> findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(Pageable pageable, String nome);
}