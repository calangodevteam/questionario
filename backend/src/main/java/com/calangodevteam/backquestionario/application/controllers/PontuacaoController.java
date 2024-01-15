package com.calangodevteam.backquestionario.application.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.InsertPontuacaoDTO;
import com.calangodevteam.backquestionario.application.services.PontuacaoService;
import com.calangodevteam.backquestionario.domain.models.Pontuacao;

import jakarta.validation.Valid;

@RestController
@RequestMapping("api")
@CrossOrigin(origins = "*")
public class PontuacaoController {
	
	@Autowired
	private PontuacaoService pontuacaoService;
	
	@GetMapping("/pontuacoes")
	public ResponseEntity<Page<Pontuacao>> findAll(
		@PageableDefault(size = 4, sort = "id") Pageable pageable) {

		return ResponseEntity.ok(pontuacaoService.findAll(pageable));
	}
	
	@GetMapping("/alunos/{id}/pontuacao")
	public ResponseEntity<Pontuacao> findByAluno(@PathVariable Integer id) {

		return ResponseEntity.ok(pontuacaoService.findByAluno(id));
	}
	
	
	@PatchMapping("/pontuacoes")
	public ResponseEntity<Pontuacao> update(@Valid @RequestBody InsertPontuacaoDTO pontDto) {

		Integer resp = pontuacaoService.update(pontDto);
		return resp == 0?ResponseEntity.notFound().build(): ResponseEntity.noContent().build();
	}
	
	
	
}