package com.calangodevteam.backquestionario.application.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.services.InstituicaoService;
import com.calangodevteam.backquestionario.domain.models.Instituicao;

@RestController
@RequestMapping("api/instituicoes")
@CrossOrigin(origins = "*")
public class InstituicaoController {
	
	@Autowired
	private InstituicaoService instituicaoService;
	
	@GetMapping("/page")
	public ResponseEntity<Page<Instituicao>> findAll(
		@PageableDefault(size = 4, sort = "id") Pageable pageable) {

		return ResponseEntity.ok(instituicaoService.findAll(pageable));
	}
	
	@GetMapping
	public ResponseEntity<List<Instituicao>> findAll() {
		return ResponseEntity.ok(instituicaoService.findAll());
	}

}