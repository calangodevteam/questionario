import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { of } from 'rxjs';
import { Questao } from 'src/app/model/questao';
import { QuestaoDto } from 'src/app/model/questao-dto';
import { QuestaoForm } from 'src/app/model/questao-form';
import { Questionario } from 'src/app/model/questionario';
import { Tema } from 'src/app/model/tema';
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
  questaoQtdForm!: FormControl;

  temas: Tema[] = [];
  questoes_drop: Questao[] = [];
  temaSec = false;
  progress = true;

  constructor(private serviceT: ThemeService, private fb: FormBuilder, private serviceQ: QuestaoService, private servicoQuestao: QuestaoService) { }

  ngOnInit() {

    if (!this.questionario)
    this.obterTemas();

    this.questionarioForm = this.fb.group({
      id: [null],
      titulo: [null],
      tempo_duracao: [null],
      tempo_disponivel: [null],
      qtd_questoes: [null],
      dificuldade: [null],
      tema: this.fb.group({
        id: [null],
        nome: [null]
      }),
      questoes: this.fb.array([])
    });

    this.questaoQtdForm = this.fb.control('');

  }

  private obterTemas() {
    this.serviceT.obterTemas()
      .subscribe((temas) => this.temas = temas);
  }

  obterPorTema(){
    let temaId:number = this.tema.get('id')!.value;
     this.servicoQuestao.obterPorTema(temaId)
      .subscribe((questoes) => this.questoes_drop = questoes);
  }

  get QuestaoQtdForm() {
    return Number(this.questaoQtdForm.value);
  }

  alterarTema() {
    this.temaSec = this.questoes.length>0? true : false;
  }

  get qtd_questoes() {
    return this.questionarioForm.get('qtd_questoes');
  }

  get tema() {
    return this.questionarioForm.get('tema') as FormGroup;
  }

  addNomeTema(){
    let id:number = this.tema.get('id')!.value;
    let nomeTema!:string;
    this.temas.forEach(tema => {
      if(id == tema.id)
        nomeTema = tema.nome;
    });
    this.tema?.patchValue({nome:nomeTema});
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
    this.questoes.removeAt(index);
    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  deleteAllQuestao() {
    this.questoes.clear();
    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  private VerificaQuestaoExiste(questaoId: number): boolean{
    for (let i = 0; i < this.questoes.length; i++) {
      const questaoFormGroup = this.questoes.at(i) as FormGroup;
      let id:number = questaoFormGroup.get('id')!.value;
      if(id === questaoId){
        return true
      }
    }
    return false;
  }

  addQuestaoComp(questaoAdd:Questao){

    if(this.VerificaQuestaoExiste(questaoAdd.id!) === true)
      return

    const questao = this.fb.group({
      id: questaoAdd.id,
      nome: questaoAdd.texto,
      temaId: questaoAdd.tema.id
    });
    this.questoes.push(questao);

    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  addRandonQuest(){

      const randomArray: number[] = [];
      for (let i = 0; i < this.QuestaoQtdForm; i++) {
        let randomNumber: number;
        let idQuest: number;
        do {
          randomNumber = Math.floor(Math.random() * this.questoes_drop.length);
          idQuest = this.questoes_drop[randomNumber].id!;
        } while (randomArray.includes(randomNumber) || this.VerificaQuestaoExiste(idQuest));
        randomArray.push(randomNumber);
      }
      randomArray.forEach(index => this.addQuestaoComp(this.questoes_drop[index]));
      this.questaoQtdForm.setValue(0);
  }

  submitQuestionario() {
    this.addNomeTema();
    // console.log(this.questionarioForm.value);
    this.onSubmit.emit(this.questionarioForm.value);
     this.questionarioForm.reset();
     this.deleteAllQuestao();
     this.progress = false;
  }

}
