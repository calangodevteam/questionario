import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, FormArray, FormControl } from '@angular/forms';
import { Router } from '@angular/router';

import { Questao } from 'src/app/model/questao';
import { Tema } from 'src/app/model/tema';
import { QuestaoDto } from './../../model/questao-dto';

import { ThemeService } from 'src/app/services/theme.service';

@Component({
  selector: 'app-questao-form',
  templateUrl: './questao-form.component.html',
  styleUrls: ['./questao-form.component.css']
})
export class QuestaoFormComponent implements OnInit{

  @Input() btnText!: string;
  @Input() questaoDto: QuestaoDto | null = null;
  @Output() onSubmit = new EventEmitter<QuestaoDto>();

  questionForm!: FormGroup;
  temas: Tema[] = [];
  private questaoCont!: Questao;
  opcaoCerta!:number;
  progress = true;

  constructor(private serviceT: ThemeService, private fb: FormBuilder) { }

  private obterTemas() {
    this.serviceT.obterTemas()
      .subscribe((temas) => this.temas = temas);
  }

  ngOnInit() {

    this.questaoCont = this.questaoDto ? this.questaoDto.questao : new Questao();

    if (!this.questaoDto)
      this.obterTemas();

    this.questionForm = this.fb.group({
      questao: this.fb.group({
        id: [null],
        texto: [null],
        categoriaBloom: [null],
        tema: this.fb.group({
          id: [null],
          nome: [null],
          areas_id:[null]
        }),
        artigos: this.fb.array([]),
        figuras: this.fb.array([]),
        opcoes: this.fb.array([])
      }),
      opcao_correta:[null]
    });

  }

  get tema() {
    return this.questionForm.get('questao.tema') as FormGroup;
  }

  get artigos() {
    return this.questionForm.get('questao.artigos') as FormArray;
  }

  addArtigo() {

     const artigo = this.fb.group({
        id: [null],
        url: [null],
        titulo: [null],
        dataPublicacao: [null],
        autor:this.fb.array([])
    });

    this.artigos.push(artigo);
  }

  deleteArtigo(index: number) {
    this.artigos.removeAt(index);
  }

  getAutorControls(index: number) {
    return (this.artigos.controls[index] as FormGroup).get('autor') as FormArray;
  }

  addAutorControl(index: number) {
    this.getAutorControls(index).push(this.fb.control(''));
  }

  deleteAutorControl(id:number, index: number) {
    this.getAutorControls(id).removeAt(index);
  }

  get figuras() {
    return this.questionForm.get('questao.figuras') as FormArray;
  }

  addFigura() {

     const figura = this.fb.group({
      id:[null],
      atributo:[null],
      descricao:[null],
    });

    this.figuras.push(figura);
  }

  arquivoSelec(event: any, index:number){
    const imageFormGroup = this.figuras.at(index) as FormGroup;
    const file: File = event.target.files[0];
    if (file) {
      this.fileToBase64(file).then((base64String: string) => {
        const base64 = base64String;
        imageFormGroup.patchValue({ atributo: base64 });
      });
    }
  }

  fileToBase64(file: File): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = error => reject(error);
    });
  }

  deleteFigura(index: number) {
    this.figuras.removeAt(index);
  }

  get opcoes() {
    return this.questionForm.get('questao.opcoes') as FormArray;
  }

  addOpcao() {

     const opcao = this.fb.group({
      id: [null],
      texto: [null],
    });
      this.opcoes.push(opcao);
  }

  addFourOpcao() {
    for (let i = 0; i < 4; i++) {
      this.addOpcao();
    }
  }

  deleteOpcoes(index: number) {
    this.opcoes.removeAt(index);
  }

  get opcao_correta (){
    return this.questionForm.get('opcao_correta');
  }

  addNomeTema(){
     const questaoFormGroup = this.tema as FormGroup;
     let id:number = questaoFormGroup.get('id')!.value;
     let nomeTema!:string;
     this.temas.forEach(tema => {
       if(id == tema.id)
         nomeTema = tema.nome;
     });
     this.questionForm.get('questao.tema')?.patchValue({nome:nomeTema});

  }

  submit() {
    this.addNomeTema();
    this.onSubmit.emit(this.questionForm.value);
    this.questionForm.reset();
    this.progress = false;
  }

}
