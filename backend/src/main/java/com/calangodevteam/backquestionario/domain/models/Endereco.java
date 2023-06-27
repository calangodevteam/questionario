package com.calangodevteam.backquestionario.domain.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable 
public class Endereco{

    @Column(name = "endereco_cep")
	private String cep;

    @Column(name = "endereco_estado")
    private String estado;

    @Column(name = "endereco_cidade")
    private String cidade;
    
    @Column(name = "endereco_bairro")
	private String bairro;

    @Column(name = "endereco_rua")
	private String rua;

    @Column(name = "endereco_numero")
	private Integer numero;
    
}
