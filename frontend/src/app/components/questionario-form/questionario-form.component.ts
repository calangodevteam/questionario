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
  selector: 'app-questionario-form',
  templateUrl: './questionario-form.component.html',
  styleUrls: ['./questionario-form.component.css']
})
export class QuestionarioFormComponent implements OnInit {

  @Input() btnText!: string;
  @Input() questionario: Questionario | null = null;
  @Output() onSubmit = new EventEmitter<Questionario>();

  questionarioForm!: FormGroup;
  modalVisible = false;
  modalTitle ='Selecione uma questão para incluir em seu questionário';

  constructor(private serviceT: ThemeService, private fb: FormBuilder, private serviceQ: QuestaoService) { }

  ngOnInit() {

    this.questionarioForm = this.fb.group({
      id: 0,
      titulo: '',
      tempoDuracao: 0,
      tempoDisponivel: 0,
      dificuldade: [null],
      questoes: this.fb.array([])
    });

  }

  showModal() {
    this.modalVisible = !this.modalVisible;
  }

  get questoes() {
    return this.questionarioForm.get('questoes') as FormArray;
  }

  deleteQuestao(index: number) {
    this.questoes.removeAt(index);
  }
  
  selecionarQuestao(questao: Questao):void{
    console.log(questao.texto + "kkkk");
    let id!:number;
    //this.serviceQ.adicionar(questao).subscribe((data:Questao) => id = data.id!);

    const novaQuestao = this.fb.group({
      questao,
    });
    this.questoes.push(novaQuestao);

    this.showModal();
  }

  submitQuestionario() {

    /* Questões são armazenadas inteiras, mas apenas o id delas é enviado ao servidor. */
    let questoes: FormArray = this.fb.array([]);
    this?.questoes?.controls.forEach(control =>{
      let questaoAtual: Questao = control.get('questao')?.value;
      questoes.push(this.fb.group({
        id: questaoAtual.id
      }));
    })
    this.questionarioForm.removeControl('questoes');
    this.questionarioForm.addControl('questoes', questoes);

     this.onSubmit.emit(this.questionarioForm.value);
     this.questionarioForm.reset();
  }

}