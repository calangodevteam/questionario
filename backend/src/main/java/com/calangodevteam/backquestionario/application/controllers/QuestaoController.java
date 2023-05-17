package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;

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

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.application.dtos.RespostaPaginadaDTO;
import com.calangodevteam.backquestionario.application.services.QuestaoService;
import com.calangodevteam.backquestionario.domain.models.Questao2;

@RestController
@RequestMapping("api/questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoService questaoService;
	
	@GetMapping
	public ResponseEntity<RespostaPaginadaDTO<Questao2>> findAllByIdAscOrDesc(
		@RequestParam(name = "temasareasid", defaultValue = "0") int temasAreasId,
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(questaoService.findAll(page, size, sort, temasAreasId));
	}
	
	@PostMapping
	public ResponseEntity<Questao2> create(@RequestBody CadastroQuestaoDTO cadastroQuestaoDTO) {

		Questao2 novaQuestao2 = questaoService.create(cadastroQuestaoDTO);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(novaQuestao2.getId()).
		toUri();

		return ResponseEntity.created(location).body(novaQuestao2);
	}
	
}