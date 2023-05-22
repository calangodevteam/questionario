package com.calangodevteam.backquestionario.application.services;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
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

	public Page<Questao2> findAll(Pageable pageable, int temasAreasId) {
		
		//Seria de responsabilidade desse método decidir qual repositório usar com base nos argumentos?
		if(temasAreasId != 0){
			return questao2Repository.findAllByTemasAreasId(pageable , temasAreasId);
		}
		return questao2Repository.findAll(pageable);

	}

	public Questao2 findById (Integer id){
	
		Questao2 questao = questao2Repository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Questão não encontrada! Id: " + id));

		return questao;
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
