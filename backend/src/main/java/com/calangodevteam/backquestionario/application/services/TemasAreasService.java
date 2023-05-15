package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.models.TemasAreas;
import com.calangodevteam.backquestionario.domain.repositories.TemasAreasRepository;

@Service
public class TemasAreasService {
	
	@Autowired
	private TemasAreasRepository repo;

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;

	public List<TemasAreas> findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(int page, int size, String sort, String temaNome) {

		/*
		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");
		 */
		
		return repo.findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")), temaNome)
		.toList();
	}
}