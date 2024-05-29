package com.calangodevteam.backquestionario.domain.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.users.Aluno;

public interface AlunoRepository extends JpaRepository<Aluno, Integer>{

	Page<Aluno> findAll(Pageable pageable);
	Optional<Aluno> findByEmail(String email);

}