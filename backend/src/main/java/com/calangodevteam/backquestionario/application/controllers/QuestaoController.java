package com.calangodevteam.backquestionario.application.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.application.services.QuestaoService;
import com.calangodevteam.backquestionario.domain.models.Questao2;

@RestController
@RequestMapping("questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoService service;
	
	@GetMapping
	public ResponseEntity<List<Questao2>> findAllByIdAscOrDesc(
		@RequestParam(name = "temasareasid", defaultValue = "0") int temasAreasId,
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(service.findAll(page, size, sort, temasAreasId));
	}
	
	@PostMapping
	public ResponseEntity<Questao2> create(@RequestBody CadastroQuestaoDTO cadastroQuestaoDTO) {
		return new ResponseEntity<>(service.create(cadastroQuestaoDTO), HttpStatus.CREATED);
	}
	
}