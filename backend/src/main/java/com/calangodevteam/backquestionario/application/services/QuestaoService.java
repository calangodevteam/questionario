package com.calangodevteam.backquestionario.application.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.domain.models.Questao2;
import com.calangodevteam.backquestionario.domain.repositories.Questao2Repository;

@Service
public class QuestaoService {
	
	@Autowired
	private Questao2Repository questao2Repository;

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private ImageService imageService;

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;

	public QuestaoService(ModelMapper modelMapper){
		this.modelMapper = modelMapper;
	}

	public List<Questao2> findAll(int page, int size, String sort, int temasAreasId) {

		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");

		//Seria de responsabilidade desse método decidir qual repositório usar com base nos argumentos?
		if(temasAreasId != 0)
			return questao2Repository.findAllByTemasAreasId(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")), temasAreasId)
			.toList();

		return questao2Repository.findAll(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")))
		.toList();
	}

	public Questao2 findById (Integer id){
		
		Optional<Questao2> optionalQuestao = questao2Repository.findById(id);
		if(optionalQuestao.isEmpty())
			throw new RuntimeException("Questão com id " + id + " não encontrada!");

		return optionalQuestao.get();
	}

	public Questao2 create(CadastroQuestaoDTO cadastroQuestaoDTO) {
		
		cadastroQuestaoDTO.getFiguras().forEach(figura -> {
			String aux = figura.getAtributo();
			figura.setAtributo(imageService.saveNuvem(aux));
		});

		Questao2 questao2 = modelMapper.map(cadastroQuestaoDTO, Questao2.class);

		questao2.setOpcaoCorreta(cadastroQuestaoDTO.getOpcoes().get(
			cadastroQuestaoDTO.getIndiceOpcaoCorreta()
		));
	
		return questao2Repository.save(questao2);
	}

}
