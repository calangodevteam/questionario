package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.services.ProfessorService;
import com.calangodevteam.backquestionario.domain.models.users.Professor;

@RestController
@RequestMapping("api/professores")
@CrossOrigin(origins = "*")
public class ProfessorController {
	
	@Autowired
	private ProfessorService professorService;
	
	@GetMapping("/{id}")
	public ResponseEntity<Professor> findById(@PathVariable Integer id) {

		return ResponseEntity.ok(professorService.findById(id));
	}
	
	@GetMapping
	public ResponseEntity<Professor> findByEmail(@RequestParam(required = true) String email) {

		return ResponseEntity.ok(professorService.findByEmail(email));
	}
	
	@PostMapping("/cadastro")
	public ResponseEntity<Professor> create(@RequestBody Professor professor) {

		Professor newProfessor = professorService.create(professor);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(newProfessor.getId()).
		toUri();

		return ResponseEntity.created(location).body(newProfessor);
	}
	
}