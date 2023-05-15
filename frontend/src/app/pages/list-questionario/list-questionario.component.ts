import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Configuracao } from 'configuracao';
import { Questionario } from 'src/app/model/questionario';
import { QuestionarioService } from 'src/app/services/questionario.service';
import { RestElementsInfinitescrollService } from 'src/app/services/rest.elements.infinitescroll.service';

@Component({
  selector: 'app-list-questionario',
  templateUrl: './list-questionario.component.html',
  styleUrls: ['./list-questionario.component.css']
})
export class ListQuestionarioComponent implements OnInit{

  router: Router;
  questionarioService: QuestionarioService;
  questionarios: Array<Questionario> = [];
  public restElementsInfinitescrollService: RestElementsInfinitescrollService<Questionario>;

  constructor(router: Router, questionarioService: QuestionarioService, http: HttpClient) {
      this.router = router;
      this.questionarioService = questionarioService;
      this.restElementsInfinitescrollService = new RestElementsInfinitescrollService<Questionario>(http);
   }

  ngOnInit(): void {
    this.restElementsInfinitescrollService.setElementsUrl(Configuracao.urlQuestionario);
    this.restElementsInfinitescrollService.carregar();
  }

}
