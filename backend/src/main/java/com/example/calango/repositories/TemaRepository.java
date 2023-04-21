package com.example.calango.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.calango.model.Tema;

public interface TemaRepository extends JpaRepository<Tema, Integer>{
	
	List<Tema> findByAreasConhecimentoId(Integer id);

}
