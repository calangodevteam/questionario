import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Questao } from 'src/app/model/questao';
import { QuestaoService } from 'src/app/services/questao.service';

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: ['./list-questions.component.css']
})
export class ListQuestionsComponent implements OnInit {

  router: Router;
  servicoQuestao: QuestaoService;
  questoes: Array<Questao> = [];

  constructor(router: Router, servicoQuestao: QuestaoService) {
      this.router = router;
      this.servicoQuestao = servicoQuestao;
   }

  private obterTodos(){
    this.servicoQuestao.obterTodos()
        .subscribe((questoes)=>this.questoes=questoes);
  }

  ngOnInit(): void {
    this.obterTodos();
  }
}
