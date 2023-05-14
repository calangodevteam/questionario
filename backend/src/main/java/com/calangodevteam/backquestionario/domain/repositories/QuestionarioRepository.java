package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Questionario;

public interface QuestionarioRepository extends JpaRepository<Questionario, Integer>{

    Page<Questionario> findAll(Pageable pageable);

}