package com.calangodevteam.backquestionario.domain.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.calangodevteam.backquestionario.domain.models.Resultado;

public interface ResultadoRepository extends JpaRepository<Resultado, Integer>{

	Page<Resultado> findAll(Pageable pageable);	
	Page<Resultado> findAllByAlunoId(int alunoId, Pageable pageable);
	Page<Resultado> findAllByQuestionarioId(int questId, Pageable pageable);
	Optional<Resultado> findByAlunoIdAndQuestionarioId(int alunoId, int questId);
}