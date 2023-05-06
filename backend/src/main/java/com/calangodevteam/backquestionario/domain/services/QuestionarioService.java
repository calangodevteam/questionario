package com.calangodevteam.backquestionario.domain.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.models.Questionario;
import com.calangodevteam.backquestionario.domain.repositories.QuestaoRepository;
import com.calangodevteam.backquestionario.domain.repositories.QuestionarioRepository;

@Service
public class QuestionarioService {
	
	@Autowired
	private QuestionarioRepository repo;

	@Autowired
	private QuestaoRepository repoQuestao;
	
	public List<Questionario> findAll() {
		return repo.findAll();
	}
	
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

}
