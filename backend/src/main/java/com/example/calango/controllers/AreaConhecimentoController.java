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
import org.springframework.web.bind.annotation.RestController;

import com.example.calango.model.AreaConhecimento;
import com.example.calango.model.dto.AreasDTO;
import com.example.calango.model.dto.SubAreas;
import com.example.calango.repositories.AreaConhecimentoRepository;
import com.example.calango.services.AreaConhecimentoService;

@RestController
@RequestMapping("areas")
@CrossOrigin(origins = "*")
public class AreaConhecimentoController{

	@Autowired
	private AreaConhecimentoService service;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	/*
	 * Retorna todos os membros da tabela soltos
	 * */
	@GetMapping("/todos")
	public List<AreaConhecimento> findAll() {
		
		return service.findAll();
	}
	
	/*
	 * Obtem todas as areas em um formato de array
	 * */
    @GetMapping
    public List<AreasDTO> FindAllRoots() {
    	
    	List<AreaConhecimento> areasRaizes = service.FindAllRoots();
    	
    	List<AreasDTO> areasDto = new ArrayList<>();
    	areasRaizes.forEach(areas -> {
    		areasDto.add(modelMapper.map(areas, AreasDTO.class));
    	});
    	
		return areasRaizes != null? areasDto: new ArrayList<>();
    }
    
    
	
	/*
	 * Obtem todas as areas raizes
	 * Talvez necessite de tal função
	 * 
    @GetMapping("/root")
    public List<AreaConhecimento> FindRoots() {
    	
    	List<AreaConhecimento> areasRaizes = service.FindAllRoots();
		return areasRaizes != null? areasRaizes: new ArrayList<>();
    }
    */
    
    /*
	 *  Obtem todas as areas subareas recursivamente de uma determinada area
	 
	   @GetMapping("/{id}/subareas")
	   public List<AreasDTO> FindAllLeaf(@PathVariable Integer id) {
	   	AreaConhecimento areaRaiz = service.findById(id).orElse(null);
	   	
	   	AreasDTO areasDto = new AreasDTO();
	   	areaRaiz.getSubAreas().forEach(area -> {
	   		area.setSubAreas(null);
	   		areasDto.getSubAreas().add( modelMapper.map(area, AreasDTO.class));
	   	});
		return areasDto != null? areasDto.getSubAreas(): new ArrayList<>();
	   	
	   }
	 */
	   
	/*
	 *  Obtem uma area pelo id informado
	 */
	   
	   @GetMapping("/{id}")
	   public Optional<AreaConhecimento> findById(@PathVariable Integer id) {
	   	return service.findById(id);
	   }
	
	/*
	 * cria uma area que pode ser raiz ou já ter um pai
	 * Não pode ser inserida mais de uma area!
	 */
	@PostMapping
	public AreaConhecimento create(@RequestBody AreaConhecimento novaArea) {
		
        return service.create(novaArea);

	}
	/*
	 * Inserção de subareas em massa
	 * Necessita do id da area pai
	 * */
	@PostMapping("/subareas")
	public List<AreaConhecimento> createSub(@RequestBody SubAreas novasAreas) {
        return service.createSub(novasAreas);
        
	}
	
	@DeleteMapping("/{id}")
	public String delete(@PathVariable Integer id) {
		return service.delete(id);
	}
}
