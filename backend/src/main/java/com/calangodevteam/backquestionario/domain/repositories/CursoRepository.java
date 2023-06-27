package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Curso;

public interface CursoRepository extends JpaRepository<Curso, Integer>{

	Page<Curso> findAll(Pageable pageable);

}