package com.calangodevteam.backquestionario.application.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.application.dtos.QuestaoDTO;
import com.calangodevteam.backquestionario.domain.models.Questao;
import com.calangodevteam.backquestionario.domain.services.QuestaoService;

@RestController
@RequestMapping("questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoService service;
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<QuestaoDTO> findAll() {
		
		List<QuestaoDTO> questoesDto = new ArrayList<>();
		service.findAll().forEach(questao -> questoesDto.add(modelMapper.map(questao, QuestaoDTO.class)));
		return questoesDto;
	}
	
	@GetMapping("tema")
	public List<QuestaoDTO> findByTema(@RequestParam Integer temaId) {
		
		List<QuestaoDTO> questoesDto = new ArrayList<>();
		service.findByTema(temaId).forEach(questao -> questoesDto.add(modelMapper.map(questao, QuestaoDTO.class)));
		return questoesDto;
	}
	
	@GetMapping("/{id}")
	public Optional<Questao> findById (@PathVariable Integer id){
		
		return service.findById(id);
	}
	
	@PostMapping
	public Questao create(@RequestBody CadastroQuestaoDTO questao) {
		
		return service.create(questao.getQuestao(), questao.getOpcao_correta());
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);

	}

}
