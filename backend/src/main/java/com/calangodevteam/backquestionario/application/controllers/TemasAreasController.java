package com.calangodevteam.backquestionario.application.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.existent.TemaExistentDTO;
import com.calangodevteam.backquestionario.application.dtos.existent.TemasAreasExistentDTO;
import com.calangodevteam.backquestionario.domain.models.Tema;
import com.calangodevteam.backquestionario.domain.services.TemaService;
import com.calangodevteam.backquestionario.domain.services.TemasAreasService;

@RestController
@RequestMapping("temasareas")
@CrossOrigin(origins = "*")
public class TemasAreasController {
	
	@Autowired
	private TemasAreasService service;

	@GetMapping
	public ResponseEntity<List<TemasAreasExistentDTO>> findAllTemasPaginatedByTemaNomeContainingIgnoreCaseAscOrDesc(
		@RequestParam(name = "temanome") String temaNome,
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(service.findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(page, size, sort, temaNome));
	}
}