package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Instituicao;

public interface InstituicaoRepository extends JpaRepository<Instituicao, Integer>{

	Page<Instituicao> findAll(Pageable pageable);

}