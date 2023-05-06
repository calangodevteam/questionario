package com.calangodevteam.backquestionario.domain.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.domain.models.Opcao;
import com.calangodevteam.backquestionario.domain.models.Questao;
import com.calangodevteam.backquestionario.domain.repositories.QuestaoRepository;

@Service
public class QuestaoService {
	
	@Autowired
	private QuestaoRepository repo;
	
	@Autowired
	private ImageService image;
	
	public List<Questao> findAll() {
		return repo.findByOrderByTemaNomeAsc();
	}
	
	public List<Questao> findByTema(Integer temaId) {
		
		return repo.findByTema(temaId);
	}
	
	public Optional<Questao> findById (Integer id){
		return repo.findById(id);
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

}
