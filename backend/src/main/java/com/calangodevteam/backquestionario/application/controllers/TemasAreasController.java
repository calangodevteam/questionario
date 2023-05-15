package com.calangodevteam.backquestionario.application.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.RespostaPaginadaDTO;
import com.calangodevteam.backquestionario.application.services.TemasAreasService;
import com.calangodevteam.backquestionario.domain.models.TemasAreas;

@RestController
@RequestMapping("temasareas")
@CrossOrigin(origins = "*")
public class TemasAreasController {
	
	@Autowired
	private TemasAreasService temasAreasService;

	@GetMapping
	public ResponseEntity<RespostaPaginadaDTO<TemasAreas>> findAllTemasPaginatedByTemaNomeContainingIgnoreCaseAscOrDesc(
		
		@RequestParam(name = "temanome", defaultValue = "") String temaNome,
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(temasAreasService.findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(page, size, sort, temaNome));
	}
}