package com.calangodevteam.backquestionario.config;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.calangodevteam.backquestionario.application.validation.ValidacaoPaginacao;

@Configuration
public class Config {

    @Value("${backquestionario.paginacao.size.generico.padrao}")
	private int pageSizeMaximoPermitido;

    @Bean
    public ModelMapper modelMapper(){
        return new ModelMapper();
    } 

    @Bean
    public ValidacaoPaginacao validacaoPaginacao(){

        //A responsabilidade de criar os valores permitidos pro sort não podem ser dessa classe
        //Quando necessário, irei refatorar
        List<String> sortsPermitidos = new ArrayList<>();
        sortsPermitidos.add("asc");
        sortsPermitidos.add("desc");

        return new ValidacaoPaginacao(pageSizeMaximoPermitido, sortsPermitidos);
    } 
}