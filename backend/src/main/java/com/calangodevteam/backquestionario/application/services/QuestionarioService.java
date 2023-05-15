package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.models.Questionario;
import com.calangodevteam.backquestionario.domain.repositories.QuestionarioRepository;

@Service
public class QuestionarioService {
	
	@Autowired
	private QuestionarioRepository repoQuestionario;

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;
	
	public List<Questionario> findAll(int page, int size, String sort) {

		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");

		return repoQuestionario.findAll(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")))
		.toList();
	}

	public Questionario create(Questionario questionario) {

		questionario.setQtdQuestoes(questionario.getQuestoes().size());
		return repoQuestionario.save(questionario);
	}

}
