package com.example.calango.controllers;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.Unidade;
import com.example.calango.model.dto.UnidadeDTO;
import com.example.calango.services.UnidadeService;

@RestController
@RequestMapping("unidades")
@CrossOrigin(origins = "*")
public class UnidadeController {
	
	@Autowired
	private UnidadeService service;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<UnidadeDTO> findAll() {
		
		List<UnidadeDTO> uniDto = new ArrayList<>();
		service.findAll().forEach(uni -> uniDto.add(modelMapper.map(uni, UnidadeDTO.class)));
		return uniDto;
	}
	
	@GetMapping("/{id}")
	public UnidadeDTO findById (@PathVariable Integer id){
		return modelMapper.map(service.findById(id).orElse(new Unidade()), UnidadeDTO.class);
	}
	
	@PostMapping
	public Unidade create(@RequestBody Unidade unidade) {
		
		return service.create(unidade);
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);

	}

}
