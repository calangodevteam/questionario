package com.calangodevteam.backquestionario.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.calangodevteam.backquestionario.domain.models.Questionario;

public interface QuestionarioRepository extends JpaRepository<Questionario, Integer>{

    Page<Questionario> findAll(Pageable pageable);
    
    @Transactional(readOnly = true)
	@Query(
	  value = "SELECT questionario.* FROM questionario "
			+ "LEFT JOIN resultado "
			+ "ON resultado.questionario_id = questionario.id AND resultado.aluno_id = :alunoId "
			+ "WHERE resultado.aluno_id IS NULL OR resultado.aluno_id <> :alunoId",
	  nativeQuery = true)
    Page<Questionario> findAllByNotAluno(@Param("alunoId") Integer alunoId, Pageable pageable);

}