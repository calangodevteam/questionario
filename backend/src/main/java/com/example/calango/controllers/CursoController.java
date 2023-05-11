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

import com.example.calango.model.Curso;
import com.example.calango.model.dto.CursoDTO;
import com.example.calango.services.CursoService;

@RestController
@RequestMapping("cursos")
@CrossOrigin(origins = "*")
public class CursoController {
	
	@Autowired
	private CursoService service;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	@GetMapping
	public List<CursoDTO> findAll() {
		
		List<CursoDTO> cursoDto = new ArrayList<>();
		service.findAll().forEach(curso -> cursoDto.add(modelMapper.map(curso, CursoDTO.class)));
		return cursoDto;
	}
	
	@GetMapping("/{id}")
	public CursoDTO findById (@PathVariable Integer id){
		return modelMapper.map(service.findById(id).orElse(new Curso()), CursoDTO.class);
	}
	
	@PostMapping
	public Curso create(@RequestBody Curso curso) {
		
		return service.create(curso);
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);

	}

}
