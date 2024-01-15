package com.calangodevteam.backquestionario.domain.models;

import java.util.ArrayList;
import java.util.List;

import com.calangodevteam.backquestionario.domain.models.enums.Bloom;
import com.calangodevteam.backquestionario.domain.models.users.Professor;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "questao")
public class Questao2 {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition="TEXT")
	private String texto;
	
	@Column(name = "categoria_bloom")
	@Enumerated(EnumType.STRING)
	private Bloom categoriaBloom;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Artigo> artigos;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Figura> figuras;
	
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name="questao_id")
	private List<Opcao> opcoes;

    @OneToOne
    @JoinColumn(name = "opcao_correta")
    private Opcao opcaoCorreta;
    
    @ManyToOne
	@JoinColumn(name="temas_areas_id")
	private TemasAreas temasAreas;
    
    @ManyToOne
	@JoinColumn(name="professor_id")
	private Professor professor;
    
    @JsonIgnore
    @ManyToMany(mappedBy = "questoes")
    private List<Questionario> questionarios = new ArrayList<>();
    
    

}