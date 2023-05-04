package com.example.calango.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.calango.model.Instituicao;
import com.example.calango.repositories.InstituicaoRepository;

@Service
public class InstituicaoService {
	
	@Autowired
	private InstituicaoRepository repo;
	
	public List<Instituicao> findAll() {
		return repo.findAll();
	}
	
	public Optional<Instituicao> findById (Integer id){
		return repo.findById(id);
	}

	public Instituicao create(Instituicao instituicao) {
		return repo.save(instituicao);
	}
	
	public String delete(Integer id) {

		Optional<Instituicao> instituicao = repo.findById(id);	
		if(instituicao.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}
}
