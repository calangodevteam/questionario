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
import com.calangodevteam.backquestionario.application.dtos.existent.TemasAreasExistentDTO;
import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.Questao2;
import com.calangodevteam.backquestionario.domain.repositories.Questao2Repository;
import com.calangodevteam.backquestionario.domain.repositories.TemasAreasRepository;

@Service
public class TemasAreasService {
	
	@Autowired
	private TemasAreasRepository repo;
	private ModelMapper modelMapper = new ModelMapper();

	@Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;

	public List<TemasAreasExistentDTO> findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(int page, int size, String sort, String temaNome) {

		/*
		if(size > pageSizeMaximoPermitido)
			throw new RuntimeException("PageSize não pode exceder " + pageSizeMaximoPermitido);

		if((sort.equals("asc") && sort.equals("desc")))
			throw new RuntimeException("Método de ordenação " + sort + " não suportado!");
		 */
		
		List<TemasAreasExistentDTO> temasAreasDto = new ArrayList<>();
		repo.findAllByTemaNomeContainingIgnoreCaseOrderByTemaNome(PageRequest.of(page, size, Sort.by(Direction.fromString(sort), "id")), temaNome).forEach(
			temasAreas -> temasAreasDto.add(modelMapper.map(temasAreas, TemasAreasExistentDTO.class)
		));
		
		return temasAreasDto;
	}

	
	
	/*

	public List<Questao> findByTema(Integer temaId) {
		
		return repo.findByTema(temaId);
	}
	
	public Questao create(Questao questao, String resp) {
		
		questao.getFiguras().forEach(figura -> {
			String aux = figura.getAtributo();
			figura.setAtributo(image.saveNuvem(aux));
		});
		
		Questao qaux = repo.save(questao);
		Opcao opcaoCorreta = new Opcao();
		qaux.getOpcoes().forEach(opcao -> {
			if(opcao.getTexto().equals(resp)) {
				opcaoCorreta.setId(opcao.getId());
				opcaoCorreta.setTexto(opcao.getTexto());
			}
		});
		qaux.setOpcao_correta(opcaoCorreta);
		repo.save(qaux);
		return qaux;
	}
	
	public String delete(Integer id) {

		Optional<Questao> questao = repo.findById(id);	
		if(questao.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";
	}
	 */
}
