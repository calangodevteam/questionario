package com.example.calango.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.Instituicao;
import com.example.calango.services.InstituicaoService;


@RestController
@RequestMapping("instituicoes")
@CrossOrigin(origins = "*")
public class InstituicaoController {
	
	@Autowired
	private InstituicaoService service;
	
//	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<Instituicao> findAll() {
		return service.findAll();
	}
	
	@GetMapping("/{id}")
	public Optional<Instituicao> findById (@PathVariable Integer id){
		
		return service.findById(id);
	}
	
	@PostMapping
	public Instituicao create(@RequestBody Instituicao instituicao) {
		
		return service.create(instituicao);
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);

	}

}
