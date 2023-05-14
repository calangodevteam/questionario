package com.calangodevteam.backquestionario.domain.services;

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

import com.calangodevteam.backquestionario.application.dtos.QuestionarioDTO;
import com.calangodevteam.backquestionario.application.dtos.existent.QuestaoExistentDTO;
import com.calangodevteam.backquestionario.domain.models.Questionario;
import com.calangodevteam.backquestionario.domain.repositories.Questao2Repository;
import com.calangodevteam.backquestionario.domain.repositories.QuestionarioRepository;

@Service
public class QuestionarioService {
	
	@Autowired
	private QuestionarioRepository repoQuestionario;

	@Autowired
	private Questao2Repository repoQuestao;
	private ModelMapper modelMapper = new ModelMapper();

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;
	
	public List<QuestionarioDTO> findAll(int page, int size, String sort) {

		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");

		List<QuestionarioDTO> questionariosDto = new ArrayList<>();

		repoQuestionario.findAll(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id"))).forEach(
			questionario -> questionariosDto.add(modelMapper.map(questionario, QuestionarioDTO.class)
		));
		return questionariosDto;
	}

	/*
	
	public Optional<Questionario> findById (Integer id){
		return repo.findById(id);
	}

	public Questionario create(Questionario questionario) {

		questionario.getQuestoes().forEach(questao -> {
			if(questao.getId() == null)
				repoQuestao.save(questao);
		});
	
		return repo.save(questionario);
	}
	
	public String delete(Integer id) {

		Optional<Questionario> questionario = repo.findById(id);	
		if(questionario.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}

	 */

}
