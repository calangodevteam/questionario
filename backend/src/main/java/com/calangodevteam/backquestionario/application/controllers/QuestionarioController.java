package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.dtos.QuestionarioDTO;
import com.calangodevteam.backquestionario.application.dtos.RespostaPaginadaDTO;
import com.calangodevteam.backquestionario.application.services.QuestionarioService;
import com.calangodevteam.backquestionario.domain.models.Questionario;

@RestController
@RequestMapping("api/questionarios")
@CrossOrigin(origins = "*")
public class QuestionarioController {
	
	@Autowired
	private QuestionarioService questionarioService;

	@GetMapping
	public ResponseEntity<RespostaPaginadaDTO<Questionario>> findAllByIdAscOrDesc(
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(questionarioService.findAll(page, size, sort));
	}
	
	@GetMapping("/page")
	public ResponseEntity<Page<QuestionarioDTO>> findAllByNotAluno(
			@RequestParam(required = true) Integer alunoid,
			@PageableDefault(size = 10, direction =  Direction.DESC) Pageable pageable) {
		
		Page<QuestionarioDTO> quest = questionarioService.findAllByNotAluno(alunoid, pageable);
		
		return ResponseEntity.ok(quest);
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
