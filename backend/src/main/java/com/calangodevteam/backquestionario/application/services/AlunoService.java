package com.calangodevteam.backquestionario.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.Aluno;
import com.calangodevteam.backquestionario.domain.repositories.AlunoRepository;

@Service
public class AlunoService {
	
	@Autowired
	private AlunoRepository alunoRepository;

	public Aluno findById (Integer id){
	
		Aluno aluno = alunoRepository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Aluno não encontrado! Id: " + id));

		return aluno;
	}

	public Aluno create(Aluno aluno) {	
		Boolean alunoExite = alunoRepository.findByEmail(aluno.getEmail()).isPresent();
	
		if(alunoExite)
			throw new BadRequestException("Email em Uso!");
		else
			return alunoRepository.save(aluno);
	}

}
