import { Questao } from './../../model/questao';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { ThemeService } from 'src/app/services/theme.service';

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: ['./list-questions.component.css']
})
export class ListQuestionsComponent implements OnInit {
  temas: Tema[] =[];
  questoes: Questao[] = [];

  constructor(private router: Router, private servicoQuestao: QuestaoService, private serviceT: ThemeService) {}

  private obterTodos(){
    this.servicoQuestao.obterTodos()
        .subscribe((questoes)=>this.questoes=questoes);
  }

  private obterTemas() {
    this.serviceT.obterTemas()
      .subscribe((temas) => this.temas = temas);
  }

  ngOnInit(): void {
    this.obterTodos();
    this.obterTemas();
  }
}
