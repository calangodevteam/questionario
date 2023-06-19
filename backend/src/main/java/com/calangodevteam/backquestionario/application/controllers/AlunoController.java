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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.services.AlunoService;
import com.calangodevteam.backquestionario.domain.models.Aluno;

@RestController
@RequestMapping("api/alunos")
@CrossOrigin(origins = "*")
public class AlunoController {
	
	@Autowired
	private AlunoService alunoService;
	
	@GetMapping("/{id}")
	public ResponseEntity<Aluno> findById(@PathVariable Integer id) {

		return ResponseEntity.ok(alunoService.findById(id));
	}
	
	@PostMapping
	public ResponseEntity<Aluno> create(@RequestBody Aluno aluno) {

		Aluno newAluno = alunoService.create(aluno);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(newAluno.getId()).
		toUri();

		return ResponseEntity.created(location).body(newAluno);
	}
	
}