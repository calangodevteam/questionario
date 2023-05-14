import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Configuracao } from 'configuracao';
import { Questionario } from 'src/app/model/questionario';
import { QuizService } from 'src/app/services/quiz.service';
import { RestElementsInfinitescrollService } from 'src/app/services/rest.elements.infinitescroll.service';

@Component({
  selector: 'app-list-quiz',
  templateUrl: './list-quiz.component.html',
  styleUrls: ['./list-quiz.component.css']
})
export class ListQuizComponent implements OnInit{

  router: Router;
  quizService: QuizService;
  questionarios: Array<Questionario> = [];
  public restElementsInfinitescrollService: RestElementsInfinitescrollService<Questionario>;

  constructor(router: Router, quizService: QuizService, http: HttpClient) {
      this.router = router;
      this.quizService = quizService;
      this.restElementsInfinitescrollService = new RestElementsInfinitescrollService<Questionario>(http);
   }

  ngOnInit(): void {
    this.restElementsInfinitescrollService.setElementsUrl(Configuracao.urlQuestionario);
    this.restElementsInfinitescrollService.carregar();
  }

}
