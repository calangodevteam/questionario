package com.calangodevteam.backquestionario.application.controllers;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
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
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.calangodevteam.backquestionario.application.dtos.RespostaDTO;
import com.calangodevteam.backquestionario.application.services.RespostaService;

@RestController
@RequestMapping("api/")
@CrossOrigin(origins = "*")
public class RespostaController {
	
	@Autowired
	private RespostaService respostaService;
	
	@GetMapping("respostas")
	public ResponseEntity<?> find(
			@RequestParam(required = false) Integer alunoid,
			@RequestParam(required = false) Integer questionarioid,
			@RequestParam(required = false) Integer questaoid,
			@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable) {
		
		if(alunoid != null && questionarioid != null && questaoid != null) {
			return ResponseEntity.ok(respostaService.findByAlunoAndQuestionarioAndQuestao(alunoid, questionarioid, questaoid));
		}
		else if(questionarioid != null && questaoid != null){
			return ResponseEntity.ok(respostaService.findAllByQuestionarioAndQuestao(questionarioid, questaoid,pageable));
		}
		else {
			return ResponseEntity.ok(respostaService.findAll(pageable));
		}
	}
	
	@GetMapping("alunos/{id}/respostas")
	public ResponseEntity<Page<RespostaDTO>> findAllByAluno(
			@PathVariable Integer id,
			@RequestParam(required = false) Integer questionarioid,
			@RequestParam(required = false) Integer questaoid,
			@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable) {
		
		if(questionarioid != null) {
			return ResponseEntity.ok(respostaService.findAllByAlunoAndQuestionario(id,questionarioid,pageable));
		}
		else if (questaoid != null) {
			return ResponseEntity.ok(respostaService.findAllByAlunoAndQuestao(id,questaoid,pageable));
		}
		else
			return ResponseEntity.ok(respostaService.findAllByAluno(id,pageable));
	}
	
	@GetMapping("questionarios/{id}/respostas")
	public ResponseEntity<Page<RespostaDTO>> findAllByQuestionario(
			@PathVariable Integer id,
			@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable) {
		return ResponseEntity.ok(respostaService.findAllByQuestionario(id,pageable));
	}
	
	@GetMapping("questoes/{id}/respostas")
	public ResponseEntity<Page<RespostaDTO>> findAllByQuestao(
			@PathVariable Integer id,
			@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable) {
		return ResponseEntity.ok(respostaService.findAllByQuestao(id,pageable));
	}
	
	
	
	
	@GetMapping("respostas/{id}")
	public ResponseEntity<RespostaDTO> findById(@PathVariable Integer id) {

		return ResponseEntity.ok(respostaService.findById(id));
	}
	
	@PostMapping("respostas")
	public ResponseEntity<RespostaDTO> create(@RequestBody RespostaDTO resposta) {

		RespostaDTO newResposta = respostaService.create(resposta);
		URI location = ServletUriComponentsBuilder.
		fromCurrentRequest().
		path("/{id}").
		buildAndExpand(newResposta.getId()).
		toUri();

		return ResponseEntity.created(location).body(newResposta);
	}
	
	@PostMapping("questionarios/respostas")
	public ResponseEntity<String> createEmMassa(@RequestBody List<RespostaDTO> respostas) {

		String resultado = respostaService.createEmMassa(respostas);
		return ResponseEntity.status(200).body(resultado);
	}
	
	@DeleteMapping("respostas/{id}")
	public ResponseEntity<Void> delete(@PathVariable Integer id) {
		respostaService.delete(id);
		return ResponseEntity.noContent().build();
	}
	
}