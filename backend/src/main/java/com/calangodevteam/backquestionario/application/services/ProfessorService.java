package com.calangodevteam.backquestionario.application.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.users.Professor;
import com.calangodevteam.backquestionario.domain.repositories.ProfessorRepository;

@Service
public class ProfessorService {
	
	@Autowired
	private ProfessorRepository professorRepository;

	public Professor findById (Integer id){
	
		Professor professor = professorRepository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "professor não encontrado! Id: " + id));

		return professor;
	}
	
	public Professor findByEmail(String email) {
		
		Professor professor = professorRepository.findByEmail(email)
				.orElseThrow(() -> new ObjectNotFoundException(
		            "professor não encontrado! Email: " + email));

		return professor;
	}

	public Professor create(Professor professor) {	
		Boolean professorExite = professorRepository.findByEmail(professor.getEmail()).isPresent();
	
		if(professorExite)
			throw new BadRequestException("Email em Uso!");
		else
			return professorRepository.save(professor);
	}

}
