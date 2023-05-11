package com.example.calango.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.calango.model.Curso;


public interface CursoRepository extends JpaRepository<Curso, Integer> {

}
