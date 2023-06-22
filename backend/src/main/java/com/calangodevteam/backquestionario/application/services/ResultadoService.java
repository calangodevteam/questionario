package com.calangodevteam.backquestionario.application.services;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.Resultado;
import com.calangodevteam.backquestionario.domain.repositories.ResultadoRepository;

import jakarta.transaction.Transactional;

@Service
public class ResultadoService {
	
	@Autowired
	private ResultadoRepository resultadoRepository;
	
	public Page<Resultado> findAll(Pageable pageable) {
		return resultadoRepository.findAll(pageable);
	}
	
	public Page<Resultado> findAllByAluno(Integer alunoId, Pageable pageable) {
		return resultadoRepository.findAllByAlunoId(alunoId, pageable);
	}
	
	public Page<Resultado> findAllByQuestionario(Integer questId, Pageable pageable) {
		return resultadoRepository.findAllByQuestionarioId(questId, pageable);
	}

	public Resultado findByAlunoAndQuestionario (Integer alunoId, Integer questId){
	
		Resultado resultado = resultadoRepository.findByAlunoIdAndQuestionarioId(alunoId, questId)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Resultado não encontrado! Id do Aluno: " + alunoId + " | Id do questionario: "+ questId ));

		return resultado;
	}
	
	public Resultado findById (Integer id){
		
		Resultado resultado = resultadoRepository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Resultado não encontrado! Id "+ id ));

		return resultado;
	}

	public Resultado create(Resultado resultado) {
		
		Boolean resultExite = resultadoRepository.findByAlunoIdAndQuestionarioId(
					resultado.getAluno().getId(), resultado.getQuestionario().getId()
				).isPresent();
		
		if(resultExite)
			throw new BadRequestException("O aluno já respondeu esse questionario!");
		
		resultado.setInicio(LocalDateTime.now());
		resultado.setTermino(null);
		return resultadoRepository.save(resultado);
	}
	
	@Transactional
	public Resultado update(Resultado resultado) {
		Resultado resultAtt = findById(resultado.getId());
		resultAtt.setAcertos(resultado.getAcertos());
		resultAtt.setTermino( LocalDateTime.now());
		return resultadoRepository.save(resultAtt);
	}
	
	@Transactional
	public void delete(Integer id) {
		Resultado result = findById(id);
		resultadoRepository.delete(result);
	}

}
