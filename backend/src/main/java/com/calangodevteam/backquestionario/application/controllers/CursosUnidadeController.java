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

import com.calangodevteam.backquestionario.application.services.CursosUnidadeService;
import com.calangodevteam.backquestionario.domain.models.CursosUnidade;

@RestController
@RequestMapping("api/")
@CrossOrigin(origins = "*")
public class CursosUnidadeController {
	
	@Autowired
	private CursosUnidadeService cursosUnidadeService;
	
	@GetMapping("unidades/{id}/cursos/page")
	public ResponseEntity<Page<CursosUnidade>> findAllByUnidade(
		@PathVariable Integer id,
		@PageableDefault(size = 4, sort = "id") Pageable pageable) {

		return ResponseEntity.ok(cursosUnidadeService.findAllByUnidade(pageable, id));
	}
	
	@GetMapping("unidades/{id}/cursos")
	public ResponseEntity<List<CursosUnidade>> findAllByUnidade(
		@PathVariable Integer id) {
		return ResponseEntity.ok(cursosUnidadeService.findAllByUnidade(id));
	}
	
}