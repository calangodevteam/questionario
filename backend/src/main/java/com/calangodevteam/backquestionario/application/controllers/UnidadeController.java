package com.calangodevteam.backquestionario.application.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.services.UnidadeService;
import com.calangodevteam.backquestionario.domain.models.Unidade;

@RestController
@RequestMapping("api/")
@CrossOrigin(origins = "*")
public class UnidadeController {
	
	@Autowired
	private UnidadeService uniadeService;
	
	@GetMapping("/instituicoes/{instId}/unidades/page")
	public ResponseEntity<Page<Unidade>> findAllByInstituicao(
			@PathVariable Integer instId,
		@PageableDefault(size = 4, sort = "id") Pageable pageable) {

		return ResponseEntity.ok(uniadeService.findAllByInstituicao(pageable, instId));
	}
	
	@GetMapping("/instituicoes/{instId}/unidades")
	public ResponseEntity<List<Unidade>> findAllByInstituicao(
			@PathVariable Integer instId) {

		return ResponseEntity.ok(uniadeService.findAllByInstituicao(instId));
	}
	
}