package com.calangodevteam.backquestionario.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.RespostaPaginadaDTO;
import com.calangodevteam.backquestionario.application.validation.ValidacaoPaginacao;
import com.calangodevteam.backquestionario.domain.models.TemasAreas;
import com.calangodevteam.backquestionario.domain.repositories.TemasAreasRepository;

@Service
public class TemasAreasService {
	
	@Autowired
	private TemasAreasRepository repo;

	@Autowired
	private ValidacaoPaginacao validacaoPaginacao;

	public RespostaPaginadaDTO<TemasAreas> findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(int page, int size, String sort, String temaNome) {

		this.validacaoPaginacao.validar(size, sort);
		
		Page<TemasAreas> pagina = repo.findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")), temaNome);
		return new RespostaPaginadaDTO<>(pagina.toList(), pagina.hasNext());
	}
}