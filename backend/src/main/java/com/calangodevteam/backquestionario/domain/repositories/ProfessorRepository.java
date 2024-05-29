package com.calangodevteam.backquestionario.domain.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.calangodevteam.backquestionario.domain.models.users.Professor;

public interface ProfessorRepository extends JpaRepository<Professor, Integer>{

	Page<Professor> findAll(Pageable pageable);
	Optional<Professor> findByEmail(String email);

}