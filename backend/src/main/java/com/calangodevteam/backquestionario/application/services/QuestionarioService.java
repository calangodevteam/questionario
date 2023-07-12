package com.calangodevteam.backquestionario.application.services;

import java.time.LocalDateTime;
import java.time.ZoneOffset;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.QuestionarioDTO;
import com.calangodevteam.backquestionario.application.dtos.RespostaPaginadaDTO;
import com.calangodevteam.backquestionario.application.validation.ValidacaoPaginacao;
import com.calangodevteam.backquestionario.domain.models.Questionario;
import com.calangodevteam.backquestionario.domain.repositories.QuestionarioRepository;

@Service
public class QuestionarioService {
	
	@Autowired
	private QuestionarioRepository repoQuestionario;

	@Autowired
	private ValidacaoPaginacao validacaoPaginacao;
	

	@Autowired
	private ModelMapper modelMapper;
	
	public RespostaPaginadaDTO<Questionario> findAll(int page, int size, String sort) {

		this.validacaoPaginacao.validar(size, sort);

		Page<Questionario> pagina = repoQuestionario.findAll(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")));
		return new RespostaPaginadaDTO<>(pagina.toList(), pagina.hasNext());
	}
	
	public Page<QuestionarioDTO> findAllByNotAluno(Integer alunoId, Pageable pageable) {
		
		Page<Questionario> quest = repoQuestionario.findAllByNotAluno(alunoId, pageable);
		
		return quest.map(questionario -> modelMapper.map(questionario, QuestionarioDTO.class));
	}

	public Questionario create(Questionario questionario) {

		questionario.setQtdQuestoes(questionario.getQuestoes().size());
		questionario.setDataCriacao(LocalDateTime.now(ZoneOffset.UTC));
		return repoQuestionario.save(questionario);
	}

}
