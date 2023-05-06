package com.calangodevteam.backquestionario.domain.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.calangodevteam.backquestionario.domain.models.AreaConhecimento;

public interface AreaConhecimentoRepository extends JpaRepository<AreaConhecimento, Integer>{

	List<AreaConhecimento> findByPaiIsNull();
}
