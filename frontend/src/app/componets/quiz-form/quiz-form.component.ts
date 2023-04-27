import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup } from '@angular/forms';
import { of } from 'rxjs';
import { Questao } from 'src/app/model/questao';
import { QuestaoDto } from 'src/app/model/questao-dto';
import { QuestaoForm } from 'src/app/model/questao-form';
import { Questionario } from 'src/app/model/questionario';
import { QuestaoService } from 'src/app/services/questao.service';
import { ThemeService } from 'src/app/services/theme.service';

@Component({
  selector: 'app-quiz-form',
  templateUrl: './quiz-form.component.html',
  styleUrls: ['./quiz-form.component.css']
})
export class QuizFormComponent implements OnInit {

  @Input() btnText!: string;
  @Input() questionario: Questionario | null = null;
  @Output() onSubmit = new EventEmitter<Questionario>();

  questionarioForm!: FormGroup;
  modalVisible = false;
  questaoNova = false;
  modalTitle ='Questão';

  constructor(private serviceT: ThemeService, private fb: FormBuilder, private serviceQ: QuestaoService) { }

  ngOnInit() {

    this.questionarioForm = this.fb.group({
      id: [null],
      titulo: [null],
      tempo_duracao: [null],
      tempo_disponivel: [null],
      qtd_questoes: [null],
      dificuldade: [null],
      temas: this.fb.array([]),
      questoes: this.fb.array([])
    });

  }

  newQuestion() {
    this.questaoNova = !this.questaoNova;
  }

  showModal() {
    this.modalVisible = !this.modalVisible;
  }

  get qtd_questoes() {
    return this.questionarioForm.get('qtd_questoes');
  }

  get temas() {
    return this.questionarioForm.get('temas') as FormArray;
  }

  addTema() {

     const tema = this.fb.group({
      id: [null],
      nome: [null],
      areas_id:[null]
    });
    this.temas.push(tema);
  }

  deleteTema(index: number) {
    this.temas.removeAt(index);
  }


  get questoes() {
    return this.questionarioForm.get('questoes') as FormArray;
  }

  addQuestao() {

     const questao = this.fb.group({
      id: [null],
      nome: [null],
      temaId: [null]
    });
    this.questoes.push(questao);
  }

  deleteQuestao(index: number) {
    this.verificaTemaQuestao(index);
    this.questoes.removeAt(index);
    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  verificaTemaExiste(id:number): boolean{
    for (let i = 0; i < this.temas.length; i++) {
      const temaFormGroup = this.temas.at(i) as FormGroup;
      let temaId:number = temaFormGroup.get('id')!.value;
      if(temaId === id){
        return true;
      }
    }
    return false
  }

  verificaTemaQuestao(index:number){

    let ocorrencia:number = 0;
    const questaoGroup = this.questoes.at(index) as FormGroup;
    const idTema: number = questaoGroup.get('temaId')!.value;

    for (let i = 0; i < this.questoes.length; i++) {
      const questaoFormGroup = this.questoes.at(i) as FormGroup;
      let temaId:number = questaoFormGroup.get('temaId')!.value;
      if(temaId === idTema){
        ocorrencia+=1;
        console.log('ocorrencia++'+ ocorrencia)
      }
    }

    if(ocorrencia === 1){
      for (let j = 0; j <= this.temas.length; j++) {
        const temaFormGroup = this.temas.at(j) as FormGroup;
        let temaId:number = temaFormGroup.get('id')!.value;
        if(temaId === idTema){
          this.deleteTema(j);
          return
        }
      }
    }
  }

  addQuestaoTema(questaoForm: QuestaoForm){

    const questao = this.fb.group({
      id: questaoForm.id,
      nome: questaoForm.nome,
      temaId: questaoForm.tema.id
    });
    this.questoes.push(questao);

    const tema = this.fb.group({
      id: questaoForm.tema.id,
      nome: questaoForm.tema.nome,
      areas_id:[null]
    });

    if(!this.verificaTemaExiste(questaoForm.tema.id))
      this.temas.push(tema);

    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });

  }

   submitQuestao(questaoDto: QuestaoDto):void{
    let id!:number;
    this.serviceQ.adicionar(questaoDto).subscribe((data:Questao) => id = data.id!);

    console.log(questaoDto.questao.tema.id!+''+ questaoDto.questao.tema.nome)
    this.addQuestaoTema({
        id:id,
        nome:questaoDto.questao.texto,
        tema:{
          id:Number(questaoDto.questao.tema.id!),
          nome:questaoDto.questao.tema.nome
        }
      })

    this.showModal();
  }

  submitQuestionario() {
     this.onSubmit.emit(this.questionarioForm.value);
     this.questionarioForm.reset();
  }

}
