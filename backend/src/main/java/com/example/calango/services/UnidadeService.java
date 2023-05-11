package com.example.calango.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.calango.model.Unidade;
import com.example.calango.repositories.UnidadeRepository;

@Service
public class UnidadeService {
	
	@Autowired
	private UnidadeRepository repo;
	
	public List<Unidade> findAll() {
		return repo.findAll();
	}
	
	public Optional<Unidade> findById (Integer id){
		return repo.findById(id);
	}

	public Unidade create(Unidade unidade) {
		return repo.save(unidade);
	}
	
	public String delete(Integer id) {

		Optional<Unidade> unidade = repo.findById(id);	
		if(unidade.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}
}
