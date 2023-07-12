package com.calangodevteam.backquestionario.application.services;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.calangodevteam.backquestionario.application.dtos.RespostaDTO;
import com.calangodevteam.backquestionario.domain.exceptions.BadRequestException;
import com.calangodevteam.backquestionario.domain.exceptions.ObjectNotFoundException;
import com.calangodevteam.backquestionario.domain.models.Resposta;
import com.calangodevteam.backquestionario.domain.repositories.RespostaRepository;

import jakarta.transaction.Transactional;

@Service
public class RespostaService {
	
	@Autowired
	private RespostaRepository respostaRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	public Page<RespostaDTO> findAll(Pageable pageable) {
		
		Page<Resposta> res = respostaRepository.findAll(pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	
	
	public Page<RespostaDTO> findAllByAluno(Integer alunoId, Pageable pageable) {
		
		Page<Resposta> res = respostaRepository.findAllByAlunoId(alunoId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	public Page<RespostaDTO> findAllByQuestionario(Integer questioId, Pageable pageable) {
		
		Page<Resposta> res = respostaRepository.findAllByQuestionarioId(questioId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	public Page<RespostaDTO> findAllByQuestao(Integer questId, Pageable pageable) {
		
		Page<Resposta> res = respostaRepository.findAllByQuestionarioId(questId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	

	public Page<RespostaDTO> findAllByAlunoAndQuestionario (Integer alunoId, Integer questioId, Pageable pageable){
	
		Page<Resposta> res = respostaRepository.findAllByAlunoIdAndQuestionarioId(alunoId,questioId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	public Page<RespostaDTO> findAllByAlunoAndQuestao (Integer alunoId, Integer questId, Pageable pageable){
		
		Page<Resposta> res = respostaRepository.findAllByAlunoIdAndQuestaoId(alunoId, questId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	public Page<RespostaDTO> findAllByQuestionarioAndQuestao (Integer questioId, Integer questId, Pageable pageable){
		
		Page<Resposta> res = respostaRepository.findAllByQuestionarioIdAndQuestaoId(questioId, questId, pageable);
		return res.map(resposta->modelMapper.map(resposta, RespostaDTO.class));
	}
	
	
	
	
	public RespostaDTO findByAlunoAndQuestionarioAndQuestao (Integer alunoId, Integer questioId, Integer questId){
		
		Resposta res = respostaRepository.findByAlunoIdAndQuestionarioIdAndQuestaoId(alunoId, questioId, questId)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Resposta não encontrada! Id do Aluno: " + alunoId + " | Id do questionario: "+ questioId + " | Id da questão: " + questId));

		return modelMapper.map(res, RespostaDTO.class);
	}
	
	

	@Transactional
	public String createEmMassa(List<RespostaDTO> respostas) {
		
		for(RespostaDTO resposta :respostas) {
			
			Boolean resultExite = respostaRepository.findByAlunoIdAndQuestionarioIdAndQuestaoId(
					resposta.getAluno().getId(), resposta.getQuestionario().getId(), resposta.getQuestao().getId()
				).isPresent();
		
			if(resultExite)
				throw new BadRequestException("O aluno já respondeu essa questão deste questionario!");
		}
		
		for(RespostaDTO respostaDto :respostas) {
			Resposta resposta = modelMapper.map(respostaDto, Resposta.class);
			respostaRepository.save(resposta);
		}
		return "Salvo com sucesso!";
	}
	
	
	
	public RespostaDTO findById (Integer id){
		
		Resposta resposta = respostaRepository.findById(id)
        .orElseThrow(() -> new ObjectNotFoundException(
            "Resposta não encontrada! Id "+ id ));

		return modelMapper.map(resposta, RespostaDTO.class);
	}
	
	@Transactional
	public RespostaDTO create(RespostaDTO respostaDto) {
		
		Boolean resultExite = respostaRepository.findByAlunoIdAndQuestionarioIdAndQuestaoId(
				respostaDto.getAluno().getId(), respostaDto.getQuestionario().getId(), respostaDto.getQuestao().getId()
				).isPresent();
		
		if(resultExite)
			throw new BadRequestException("O aluno já respondeu essa questão deste questionario!");
		else {
			Resposta resposta = modelMapper.map(respostaDto, Resposta.class);
			Resposta newResposta = respostaRepository.save(resposta);
			return modelMapper.map(newResposta, RespostaDTO.class);
		}
	}

	@Transactional
	public void delete(Integer id) {
		RespostaDTO result = findById(id);
		respostaRepository.deleteById(result.getId());
	}

}
