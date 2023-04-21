package com.example.calango.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.Tema;
import com.example.calango.model.dto.TemaDTO;
import com.example.calango.repositories.TemaRepository;

@RestController
@RequestMapping("temas")
@CrossOrigin(origins = "*")
public class TemaController {
	
	@Autowired
	private TemaRepository repo;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<TemaDTO> findAll() {
		
		List<TemaDTO> temasDto = new ArrayList<>();
		repo.findAll().forEach(tema -> temasDto.add(modelMapper.map(tema, TemaDTO.class)));
		return temasDto;
	}
	
	@GetMapping("/area")
	public List<Tema> findAByAreaConhecimento (@RequestParam Integer id){
		
		return repo.findByAreasConhecimentoId(id);
	}
	
	@GetMapping("/{id}")
	public Optional<Tema> findById (@PathVariable Integer id){
		
		return repo.findById(id);
		
	}
	
	@PostMapping
	public Tema create(@RequestBody Tema tema) {
		return repo.save(tema);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {

		Optional<Tema> tema = repo.findById(id);	
		if(tema.isPresent()) {
			repo.deleteById(id);
		}

	}

}
