package com.example.calango.controllers;

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
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.Opcao;
import com.example.calango.model.Questao;
import com.example.calango.model.dto.CadastroQuestaoDTO;
import com.example.calango.model.dto.QuestaoDTO;
import com.example.calango.repositories.QuestaoRepository;

@RestController
@RequestMapping("questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoRepository repo;
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<QuestaoDTO> findAll() {
		
		List<QuestaoDTO> questoesDto = new ArrayList<>();
		repo.findByOrderByTemaNomeAsc().forEach(questao -> questoesDto.add(modelMapper.map(questao, QuestaoDTO.class)));
		return questoesDto;
	}
	
	@GetMapping("/{id}")
	public Optional<Questao> findById (@PathVariable Integer id){
		
		return repo.findById(id);
	}
	
	@PostMapping
	public Questao create(@RequestBody CadastroQuestaoDTO questao) {
		
		Questao qaux = repo.save(questao.getQuestao());
		Opcao opcaoCorreta = new Opcao();
		qaux.getOpcoes().forEach(opcao -> {
			if(opcao.getTexto().equals(questao.getOpcao_correta())) {
				opcaoCorreta.setId(opcao.getId());
				opcaoCorreta.setTexto(opcao.getTexto());
			}
		});
		qaux.setOpcao_correta(opcaoCorreta);
		repo.save(qaux);
		return qaux;
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {

		Optional<Questao> questao = repo.findById(id);	
		if(questao.isPresent()) {
			repo.deleteById(id);
		}

	}

}
