package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.dtos.QuestionarioDTO;
import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.domain.models.Questionario;
import com.calangodevteam.backquestionario.domain.services.QuestionarioService;

@RestController
@RequestMapping("questionarios")
@CrossOrigin(origins = "*")
public class QuestionarioController {
	
	@Autowired
	private QuestionarioService questionarioService;
	
	private ModelMapper modelMapper = new ModelMapper();

	@GetMapping
	public ResponseEntity<List<QuestionarioDTO>> findAllByIdAscOrDesc(
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		List<QuestionarioDTO> questionarioDTO = questionarioService.findAll(page, size, sort);
		return ResponseEntity.ok(questionarioDTO);
	}

	@PostMapping
	public ResponseEntity<Questionario> create(@RequestBody QuestionarioDTO questionarioDto) {
		Questionario questionario = questionarioService.create(questionarioDto);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(questionario.getId()).
		toUri();

		return ResponseEntity.created(location).body(questionario);
	}
	
	/*
	@GetMapping
	public List<QuestionarioDTO> findAll() {
		
		List<QuestionarioDTO> questionarios = new ArrayList<>();
		service.findAll().forEach(questionario -> questionarios.add(modelMapper.map(questionario, QuestionarioDTO.class)));
		return questionarios;
	}
	
	@GetMapping("/{id}")
	public Optional<Questionario> findById (@PathVariable Integer id){
		
		return service.findById(id);
	}
	
	@PostMapping
	public Questionario create(@RequestBody Questionario questionario) {
		
		return service.create(questionario);
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);

	}
	*/
	
}
