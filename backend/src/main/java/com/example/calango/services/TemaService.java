package com.example.calango.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.calango.model.Tema;
import com.example.calango.repositories.TemaRepository;

@Service
public class TemaService {
	
	@Autowired
	private TemaRepository repo;
	
	public List<Tema> findAll() {
		return repo.findAllByOrderByNomeAsc();
	}
	
	public List<Tema> findAByAreaConhecimento (@RequestParam Integer id){
		
		return repo.findByAreasConhecimentoId(id);
	}
	
	public Optional<Tema> findById (@PathVariable Integer id){
		
		return repo.findById(id);
		
	}
	
	public Tema create(@RequestBody Tema tema) {
		return repo.save(tema);
	}
	
	public String delete(@PathVariable Integer id) {

		Optional<Tema> tema = repo.findById(id);	
		if(tema.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}

}
