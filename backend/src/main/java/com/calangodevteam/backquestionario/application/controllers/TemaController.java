package com.calangodevteam.backquestionario.application.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.TemaDTO;
import com.calangodevteam.backquestionario.domain.models.Tema;
import com.calangodevteam.backquestionario.domain.services.TemaService;

@RestController
@RequestMapping("temas")
@CrossOrigin(origins = "*")
public class TemaController {
	
	@Autowired
	private TemaService service;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<TemaDTO> findAll() {
		
		List<TemaDTO> temasDto = new ArrayList<>();
		service.findAll().forEach(tema -> temasDto.add(modelMapper.map(tema, TemaDTO.class)));
		return temasDto;
	}
	
	@GetMapping("/area")
	public List<Tema> findAByAreaConhecimento (@RequestParam Integer id){
		
		return service.findAByAreaConhecimento(id);
	}
	
	@GetMapping("/{id}")
	public Optional<Tema> findById (@PathVariable Integer id){
		
		return service.findById(id);
		
	}
	
	@PostMapping
	public Tema create(@RequestBody Tema tema) {
		return service.create(tema);
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);
	}

}
