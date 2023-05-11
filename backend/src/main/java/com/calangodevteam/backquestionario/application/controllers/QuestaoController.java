package com.calangodevteam.backquestionario.application.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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

import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.domain.models.TemasAreas;
import com.calangodevteam.backquestionario.domain.repositories.TemasAreasRepository;
//import com.calangodevteam.backquestionario.domain.models.Questao;
import com.calangodevteam.backquestionario.domain.services.QuestaoService;

@RestController
@RequestMapping("questoes")
@CrossOrigin(origins = "*")
public class QuestaoController {
	
	@Autowired
	private QuestaoService service;
	
	@GetMapping
	public ResponseEntity<List<QuestaoExistentDTO>> findAllByIdAscOrDesc(
		@RequestParam(name = "temasareasid", defaultValue = "0") int temasAreasId,
		@RequestParam(name = "page", defaultValue = "0") int page,
    	@RequestParam(name = "size", defaultValue = "${backquestionario.paginacao.size.generico.padrao}") int size,
		@RequestParam(name = "sort", defaultValue = "asc") String sort) {

		return ResponseEntity.ok(service.findAll(page, size, sort, temasAreasId));
	}

	//@GetMapping("tema")
	//public List<QuestaoExistentDTO> findByTema(@RequestParam Integer temaId) {
		
	//	List<QuestaoExistentDTO> questoesDto = new ArrayList<>();
		//service.findByTema(temaId).forEach(questao -> questoesDto.add(modelMapper.map(questao, QuestaoDTO.class)));
		//return questoesDto;
	//}
	
	//@GetMapping("/{id}")
	//public Optional<Questao> findById (@PathVariable Integer id){
		
		//return service.findById(id);
	//}
	
	//@PostMapping
	//public Questao create(@RequestBody CadastroQuestaoDTO questao) {
		
		//return service.create(questao.getQuestao(), questao.getOpcao_correta());
	//}
	
	//@DeleteMapping("/{id}")
	//public String delete(@PathVariable Integer id) {
		//return service.delete(id);

	//}

}
