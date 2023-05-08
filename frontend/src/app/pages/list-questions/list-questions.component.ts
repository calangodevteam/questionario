import { Questao } from './../../model/questao';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { ThemeService } from 'src/app/services/theme.service';

enum ESTADOS_BUSCA {
  Valor1 = "valor1",
  Valor2 = "valor2",
  Valor3 = "valor3"
}

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: ['./list-questions.component.css']
})
export class ListQuestionsComponent implements OnInit {
  temas: Tema[] = [];
  questoes: Questao[] = [];
  sort: string = "desc";
  page: number = 0;

  estadoBusca: number = -1;
  /*
   -1 = primeiro carregamento 
    0 = pode tentar carregar mais
    1 = carregando...
    2 = não tem mais dados a serem carregados

    Poderia ser um enum. 
    Muita coisa aqui pode ser modularizada para ser reaproveitada.
  */

  constructor(private router: Router, private servicoQuestao: QuestaoService, private serviceT: ThemeService) {}

  private reset(){
    this.questoes = [];
    this.page = 0;
    this.estadoBusca = -1;
  }

  public setSort(sort: string){
    this.estadoBusca = 1;
    this.sort = sort;
    this.reset();
    this.obterTodos();
  }

  public carregarMais(){
    this.estadoBusca = 1;
    this.page++;
    this.obterTodos();
  }

  private gerenciarNovosDados(questoes: Questao[]){
    if(questoes.length == 0){
      this.estadoBusca = 2;
      return;
    }
    this.estadoBusca = 0;

    let clone = this.questoes.slice();
    questoes.forEach((questao) => clone.push(questao));
    this.questoes = clone;
  }

  private obterTodos(){
    this.servicoQuestao.obterTodos(this.sort, this.page)
        .subscribe((questoes) => this.gerenciarNovosDados(questoes));
  }

  private obterTemas() {
    this.serviceT.obterTemas()
      .subscribe((temas) => this.temas = temas);
  }

  ngOnInit(): void {
    this.estadoBusca = -1;
    this.obterTodos();
    this.obterTemas();
  }
}
