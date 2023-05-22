package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.application.services.QuestaoService;
import com.calangodevteam.backquestionario.domain.models.Questao2;

@RestController
@RequestMapping("api/questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoService questaoService;
	
	@GetMapping
	public ResponseEntity<Page<Questao2>> findAllByIdAscOrDesc(
		@RequestParam(name = "temasareasid", defaultValue = "0") int temasAreasId,
		@PageableDefault(size = 4, sort = "id") Pageable pageable) {

		return ResponseEntity.ok(questaoService.findAll(pageable, temasAreasId));
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