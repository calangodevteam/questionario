package com.calangodevteam.backquestionario.domain.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.application.dtos.fresh.CadastroQuestaoDTO;
import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.Questao2;
import com.calangodevteam.backquestionario.domain.repositories.Questao2Repository;

@Service
public class QuestaoService {
	
	@Autowired
	private Questao2Repository questao2Repository;
	private ModelMapper modelMapper = new ModelMapper();
	
	@Autowired
	private ImageService imageService;

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;

	public List<QuestaoExistentDTO> findAll(int page, int size, String sort, int temasAreasId) {

		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");

		List<QuestaoExistentDTO> questoesDto = new ArrayList<>();

		
		//Seria de responsabilidade desse método decidir qual repositório usar com base nos argumentos?
		if(temasAreasId != 0){
			questao2Repository.findAllByTemasAreasId(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")), temasAreasId).forEach(
				questao -> questoesDto.add(modelMapper.map(questao, QuestaoExistentDTO.class)
			));
			return questoesDto;
		}

		questao2Repository.findAll(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id"))).forEach(
			questao -> questoesDto.add(modelMapper.map(questao, QuestaoExistentDTO.class)
		));
		return questoesDto;
	}

	public QuestaoExistentDTO findById (Integer id){
		
		Optional<Questao2> optionalQuestao = questao2Repository.findById(id);
		if(optionalQuestao.isEmpty())
			throw new RuntimeException("Questão com id " + id + " não encontrada!");

		return modelMapper.map(optionalQuestao.get(), QuestaoExistentDTO.class);
	}

	public QuestaoExistentDTO create(CadastroQuestaoDTO cadastroQuestaoDTO) {
		
		cadastroQuestaoDTO.getFiguras().forEach(figura -> {
			String aux = figura.getAtributo();
			figura.setAtributo(imageService.saveNuvem(aux));
		});

		Questao2 questao2 = modelMapper.map(cadastroQuestaoDTO, Questao2.class);

		questao2.setOpcaoCorreta(cadastroQuestaoDTO.getOpcoes().get(
			cadastroQuestaoDTO.getIndiceOpcaoCorreta()
		));
	
		questao2Repository.save(questao2);
		return null;
	}
	
	/*

	public List<Questao> findByTema(Integer temaId) {
		
		return questao2Repository.findByTema(temaId);
	}
	
	public Questao create(Questao questao, String resp) {
		
		questao.getFiguras().forEach(figura -> {
			String aux = figura.getAtributo();
			figura.setAtributo(image.saveNuvem(aux));
		});
		
		Questao qaux = questao2Repository.save(questao);
		Opcao opcaoCorreta = new Opcao();
		qaux.getOpcoes().forEach(opcao -> {
			if(opcao.getTexto().equals(resp)) {
				opcaoCorreta.setId(opcao.getId());
				opcaoCorreta.setTexto(opcao.getTexto());
			}
		});
		qaux.setOpcao_correta(opcaoCorreta);
		questao2Repository.save(qaux);
		return qaux;
	}
	
	public String delete(Integer id) {

		Optional<Questao> questao = questao2Repository.findById(id);	
		if(questao.isPresent()) {
			questao2Repository.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";
	}
	 */
}
