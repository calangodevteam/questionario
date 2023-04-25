import { Questionario } from './../../model/questionario';
import { ThemeService } from './../../services/theme.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Questao } from 'src/app/model/questao';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { QuizService } from 'src/app/services/quiz.service';

@Component({
  selector: 'app-create-quiz',
  templateUrl: './create-quiz.component.html',
  styleUrls: ['./create-quiz.component.css']
})
export class CreateQuizComponent{
  btnText = "Criar"

  constructor(
    private router: Router,
    private service: QuizService,
  ) { }

  incluir(questionario: Questionario):void{

    this.service.adicionar(questionario)
        .subscribe(_=> {
          this.router.navigateByUrl("/questionarios")
        });
  }

}
