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

@RestController
@RequestMapping("areas")
@CrossOrigin(origins = "*")
public class AreaConhecimentoController{

	@Autowired
	private AreaConhecimentoRepository repo;
	
	private ModelMapper modelMapper = new ModelMapper();
	
	/*
	 * Retorna todos os membros da tabela soltos
	 * */
	@GetMapping("/todos")
	public List<AreaConhecimento> findAll() {
		
		return repo.findAll();
	}
	
	/*
	 * Obtem todas as areas em um formato de array
	 * */
    @GetMapping
    public List<AreasDTO> FindAllRoots() {
    	
    	List<AreaConhecimento> areasRaizes = repo.findByPaiIsNull();
    	
    	List<AreasDTO> areasDto = new ArrayList<>();
    	areasRaizes.forEach(areas -> {
    		areasDto.add(modelMapper.map(areas, AreasDTO.class));
    	});
    	
		return areasRaizes != null? areasDto: new ArrayList<>();
    }
    
	/*
	 * Obtem todas as areas de uma determinada area
	 * 
	 *  @GetMapping("/{id}/subareas")
	 *  public List<AreaConhecimento> FindAllLeaf(@PathVariable Integer id) {
	 *  	AreaConhecimento areaRaiz = repo.findById(id).orElse(null);
	 *  	return areaRaiz.getSubAreas();
	 *  }
	 *  
	 *  @GetMapping("{id}")
	 *  public Optional<AreaConhecimento> findById(@PathVariable Integer id) {
	 *  	return repo.findById(id);
	 *  }
     *
     */
	
	/*
	 * cria uma area que pode ser raiz ou já ter um pai
	 * Não pode ser inserida mais de uma area!
	 * */
	@PostMapping
	public AreaConhecimento create(@RequestBody AreaConhecimento novaArea) {
		
    	if(novaArea.getPai() == null)
    		return repo.save(novaArea);
    	
    	AreaConhecimento areaPai = repo.findById(novaArea.getPai().getId()).orElse(null);
    	novaArea.setPai(areaPai);
        return repo.save(novaArea);

	}
	/*
	 * Inserção de subareas em massa
	 * Necessita do id da area pai
	 * */
	@PostMapping("/subareas")
	public List<AreaConhecimento> createSub(@RequestBody SubAreas novasAreas) {
    		
    	novasAreas.getSubAreas().forEach(filho -> {
    		AreaConhecimento areaPai = repo.findById(filho.getPai().getId()).orElse(null);
    		filho.setPai(areaPai);
    	});

        return repo.saveAll(novasAreas.getSubAreas());
        
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {

		Optional<AreaConhecimento> areaConhecimento = repo.findById(id);	
		if(areaConhecimento.isPresent()) {
			repo.deleteById(id);
		}

	}
}
