package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.services.ResultadoService;
import com.calangodevteam.backquestionario.domain.models.Resultado;

@RestController
@RequestMapping("api/")
@CrossOrigin(origins = "*")
public class ResultadoController {
	
	@Autowired
	private ResultadoService resultadoService;
	
	@GetMapping("/questionarios/resultados")
	public ResponseEntity<Page<Resultado>> findAll(
			@RequestParam(required = false) Integer alunoid,
			@PageableDefault(size = 4, sort = "id") Pageable pageable) {
		
		return alunoid == null? ResponseEntity.ok(resultadoService.findAll(pageable)): 
			ResponseEntity.ok(resultadoService.findAllByAluno(alunoid,pageable));
	}
	
	@GetMapping("/questionarios/{id}/resultados")
	public ResponseEntity<Page<Resultado>> findAllByQuestionario(
			@PathVariable Integer id,
			@PageableDefault(size = 4, sort = "id") Pageable pageable) {
		return ResponseEntity.ok(resultadoService.findAllByQuestionario(id,pageable));
	}
	
	@GetMapping("/questionarios/resultados/{id}")
	public ResponseEntity<Resultado> findById(@PathVariable Integer id, @RequestParam(required = false) Integer alunoid) {

		return alunoid == null? ResponseEntity.ok(resultadoService.findById(id)):
			ResponseEntity.ok(resultadoService.findByAlunoAndQuestionario(alunoid, id));
	}
	
	@PostMapping("/questionarios/resultados")
	public ResponseEntity<Resultado> create(@RequestBody Resultado resultado) {

		Resultado newResultado = resultadoService.create(resultado);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(newResultado.getId()).
		toUri();

		return ResponseEntity.created(location).body(newResultado);
	}
	
	@PutMapping("/questionarios/resultados/{id}")
	public ResponseEntity<Void> update(@PathVariable Integer id, @RequestBody Resultado resultado) {

		resultado.setId(id);
		resultadoService.update(resultado);
		return ResponseEntity.noContent().build();
	}
	
	@DeleteMapping("/questionarios/resultados/{id}")
	public ResponseEntity<Void> delete(@PathVariable Integer id) {
		resultadoService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
}