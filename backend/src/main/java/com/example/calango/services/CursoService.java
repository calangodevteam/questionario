package com.example.calango.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.calango.model.Curso;
import com.example.calango.repositories.CursoRepository;

@Service
public class CursoService {
	
	@Autowired
	private CursoRepository repo;
	
	public List<Curso> findAll() {
		return repo.findAll();
	}
	
	public Optional<Curso> findById (Integer id){
		return repo.findById(id);
	}

	public Curso create(Curso curso) {
		return repo.save(curso);
	}
	
	public String delete(Integer id) {

		Optional<Curso> curso = repo.findById(id);	
		if(curso.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}
}
