package com.example.calango.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.calango.model.Opcao;
import com.example.calango.model.Questao;
import com.example.calango.model.dto.QuestaoDTO;
import com.example.calango.repositories.QuestaoRepository;
import com.example.calango.utilities.ImageUtility;

@Service
public class QuestaoService {
	
	@Autowired
	private QuestaoRepository repo;
	
	private ImageUtility image = new ImageUtility();
	
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
			figura.setAtributo(image.newName(aux));
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
	
	public void delete(Integer id) {

		Optional<Questao> questao = repo.findById(id);	
		if(questao.isPresent()) {
			repo.deleteById(id);
		}
	}

}
