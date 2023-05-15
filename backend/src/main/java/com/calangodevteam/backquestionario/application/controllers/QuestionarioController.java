package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.services.QuestionarioService;
import com.calangodevteam.backquestionario.domain.models.Questionario;

@RestController
@RequestMapping("questionarios")
@CrossOrigin(origins = "*")
public class QuestionarioController {
	
	@Autowired
	private QuestionarioService questionarioService;

	@GetMapping
	public ResponseEntity<List<Questionario>> findAllByIdAscOrDesc(
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		List<Questionario> questionario = questionarioService.findAll(page, size, sort);
		return ResponseEntity.ok(questionario);
	}

	@PostMapping
	public ResponseEntity<Questionario> create(@RequestBody Questionario questionario) {
		Questionario novoQuestionario = questionarioService.create(questionario);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(questionario.getId()).
		toUri();

		return ResponseEntity.created(location).body(novoQuestionario);
	}
	
}
