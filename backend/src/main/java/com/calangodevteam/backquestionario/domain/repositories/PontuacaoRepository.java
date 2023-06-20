package com.calangodevteam.backquestionario.domain.repositories;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.calangodevteam.backquestionario.domain.models.Pontuacao;

public interface PontuacaoRepository extends JpaRepository<Pontuacao, Integer>{

	Page<Pontuacao> findAll(Pageable pageable);
	Optional<Pontuacao> findByAlunoId(int alunoId);
	
	@Transactional
	@Modifying
	@Query(value = "update pontuacao set estrelas = ?, experiencia = ? where aluno_id = ?", 
	 		nativeQuery = true)
	int updateByAlunoId(Integer estrelas, Integer experiencia, Integer aluno_id);

}