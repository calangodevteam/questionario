package com.example.calango.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class Endereco{

    @Column(name = "endereco_cep")
	private String cep;

    @Column(name = "endereco_estado")
    private String estado;

    @Column(name = "endereco_cidade")
    private String cidade;

    @Column(name = "endereco_rua")
	private String rua;

    @Column(name = "endereco_bairro")
	private String bairro;

    @Column(name = "endereco_numero")
	private Integer numero;
    
    public Endereco() {
		// TODO Auto-generated constructor stub
	}

	public Endereco(String cep, String estado, String cidade, String rua, String bairro, Integer numero) {
		this.cep = cep;
		this.estado = estado;
		this.cidade = cidade;
		this.rua = rua;
		this.bairro = bairro;
		this.numero = numero;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}
    
}