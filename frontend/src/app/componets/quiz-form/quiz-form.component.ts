import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup } from '@angular/forms';
import { Questionario } from 'src/app/model/questionario';
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
  showModal: boolean = false;

  constructor(private serviceT: ThemeService, private fb: FormBuilder, ) { }

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

  toggle () {
    this.showModal = !this.showModal;
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
    });

    this.questoes.push(questao);
    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  deleteQuestao(index: number) {
    this.questoes.removeAt(index);
    this.questionarioForm.patchValue({ qtd_questoes: this.questoes.length });
  }

  submit() {
    console.log(this.questionarioForm.value);
    // this.onSubmit.emit(this.questionarioForm.value);
  }

}
