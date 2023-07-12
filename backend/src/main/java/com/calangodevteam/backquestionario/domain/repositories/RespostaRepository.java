package com.calangodevteam.backquestionario.domain.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.Resposta;

public interface RespostaRepository extends JpaRepository<Resposta, Integer>{

	Page<Resposta> findAll(Pageable pageable);
	
	Page<Resposta> findAllByAlunoId(int alunoId, Pageable pageable);
	Page<Resposta> findAllByQuestionarioId(int questioId, Pageable pageable);
	Page<Resposta> findAllByQuestaoId(int questId, Pageable pageable);
	
	Page<Resposta> findAllByAlunoIdAndQuestionarioId(int alunoId, int questioId, Pageable pageable);
	Page<Resposta> findAllByAlunoIdAndQuestaoId(int alunoId, int questId, Pageable pageable);
	Page<Resposta> findAllByQuestionarioIdAndQuestaoId(int questioId, int questId, Pageable pageable);
	
	Optional<Resposta> findByAlunoIdAndQuestionarioIdAndQuestaoId(int alunoId, int questioId, int questId);
}