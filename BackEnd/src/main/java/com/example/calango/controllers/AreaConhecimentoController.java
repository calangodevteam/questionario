package com.example.calango.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.AreaConhecimento;
import com.example.calango.repositories.AreaConhecimentoRepository;

@RestController
@RequestMapping("areas")
public class AreaConhecimentoController {

	@Autowired
	private AreaConhecimentoRepository repo;
	
	@GetMapping
	public Optional<AreaConhecimento> findRoot() {
		
		return repo.findById(1);
	}
	
	@GetMapping("/{id}")
	public Optional<AreaConhecimento> findById (@PathVariable Integer id){
		
		return repo.findById(id);
		
	}
	
	@PostMapping
	public AreaConhecimento create(@RequestBody AreaConhecimento area) {
		return repo.save(area);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {

		Optional<AreaConhecimento> areaConhecimento = repo.findById(id);	
		if(areaConhecimento.isPresent()) {
			repo.deleteById(id);
		}

	}
}
