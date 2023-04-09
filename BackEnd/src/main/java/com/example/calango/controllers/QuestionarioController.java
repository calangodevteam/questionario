package com.example.calango.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.Questao;
import com.example.calango.model.Questionario;
import com.example.calango.repositories.QuestionarioRepository;
import com.example.calango.repositories.TemaRepository;

@RestController
@RequestMapping("questionarios")
@CrossOrigin(origins = "*")
public class QuestionarioController {
	
	@Autowired
	private QuestionarioRepository repo;

	@Autowired
	private TemaRepository repoTema;
	
	@GetMapping
	public List<Questionario> findAll() {
		return repo.findAll();
	}
	
	@GetMapping("/{id}")
	public Optional<Questionario> findById (@PathVariable Integer id){
		
		return repo.findById(id);
	}
	
	@PostMapping
	public Questionario create(@RequestBody Questionario questionario) {
		//System.out.println("TEMA ID: " + repoTema.findById(questionario.getQuestoes().get(0).getTema().getId()));
		
		//Código temporário para usar apenas temas existentes do banco de dados.
		//É esperado que o front-end já tenha esses ids. Não tem validação aqui por enquanto.
		for (Questao questao : questionario.getQuestoes()) {
			questao.setTema(repoTema.findById(questao.getTema().getId()).get());
		}

		return repo.save(questionario);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {

		Optional<Questionario> questionario = repo.findById(id);	
		if(questionario.isPresent()) {
			repo.deleteById(id);
		}

	}
	
}
