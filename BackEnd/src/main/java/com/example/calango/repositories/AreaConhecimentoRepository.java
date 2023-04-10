package com.example.calango.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.calango.model.AreaConhecimento;

public interface AreaConhecimentoRepository extends JpaRepository<AreaConhecimento, Integer>{

	List<AreaConhecimento> findByPaiIsNull();
}
