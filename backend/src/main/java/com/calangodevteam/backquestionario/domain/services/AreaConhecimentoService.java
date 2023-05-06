package com.calangodevteam.backquestionario.domain.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.SubAreas;
import com.calangodevteam.backquestionario.domain.models.AreaConhecimento;
import com.calangodevteam.backquestionario.domain.repositories.AreaConhecimentoRepository;

@Service
public class AreaConhecimentoService {
	

	@Autowired
	private AreaConhecimentoRepository repo;
	
	/*
	 * Retorna todos os membros da tabela soltos
	 * */
	public List<AreaConhecimento> findAll() {
		return repo.findAll();
	}
	
	/*
	 * Obtem todas as areas em um formato de array
	 * */
    public List<AreaConhecimento> FindAllRoots() {
		return repo.findByPaiIsNull();
    }
	   
	/*
	 *  Obtem uma area pelo id informado
	 */
	   
	   public Optional<AreaConhecimento> findById(Integer id) {
	   	return repo.findById(id);
	   }
	
	/*
	 * cria uma area que pode ser raiz ou já ter um pai
	 * Não pode ser inserida mais de uma area!
	 */
	public AreaConhecimento create(AreaConhecimento novaArea) {
		
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
	public List<AreaConhecimento> createSub(SubAreas novasAreas) {
    		
    	novasAreas.getSubAreas().forEach(filho -> {
    		AreaConhecimento areaPai = repo.findById(filho.getPai().getId()).orElse(null);
    		filho.setPai(areaPai);
    	});

        return repo.saveAll(novasAreas.getSubAreas());
	}
	
	public String delete(Integer id) {

		Optional<AreaConhecimento> areaConhecimento = repo.findById(id);	
		if(areaConhecimento.isPresent()) {
			repo.deleteById(id);
			return "Deletado com sucesso!";
		}
		else return "Erro ao deletar!";

	}
}
