import { Questao } from './../../model/questao';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { RestElementsInfinitescrollService } from 'src/app/services/rest.elements.infinitescroll.service';
import { Configuracao } from 'configuracao';
import { TemasAreas } from 'src/app/model/temasAreas';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-list-questions',
  templateUrl: './list-questions.component.html',
  styleUrls: ['./list-questions.component.css']
})
export class ListQuestionsComponent implements OnInit {

  public restElementsInfinitescrollService: RestElementsInfinitescrollService<Questao>;
  public restElementsInfinitescrollServiceTema: RestElementsInfinitescrollService<TemasAreas>;
  public temasAreasSelecionado: TemasAreas | null = null;
  @Output() onSelecionarQuestao: EventEmitter<Questao> = new EventEmitter<Questao>;
  @Input() modoDeSelecao: boolean = false;

  constructor(
    private router: Router,
    http: HttpClient) {
      this.restElementsInfinitescrollService = new RestElementsInfinitescrollService<Questao>(http);
      this.restElementsInfinitescrollServiceTema = new RestElementsInfinitescrollService<TemasAreas>(http);
    }

  callbackSelecaoTema(temasAreas: TemasAreas | null){
    console.log(this.restElementsInfinitescrollService)
    this.temasAreasSelecionado = temasAreas;
    if(temasAreas == null){
      this.restElementsInfinitescrollService.setarParametroEResetar('temasareasid', '')
      return;
    }
    this.restElementsInfinitescrollService.setarParametroEResetar('temasareasid', temasAreas.id != null? temasAreas.id.toString() : '')
  }

  ngOnInit(): void {
    this.restElementsInfinitescrollService.setElementsUrl(Configuracao.urlQuestao);
    this.restElementsInfinitescrollServiceTema.httpParams = this.restElementsInfinitescrollServiceTema.httpParams.set("temasareasid", "");
    this.restElementsInfinitescrollService.carregar();

    this.restElementsInfinitescrollServiceTema.setElementsUrl(Configuracao.urlAreasTemas);
    this.restElementsInfinitescrollServiceTema.httpParams = this.restElementsInfinitescrollServiceTema.httpParams.set("temanome", "");
    this.restElementsInfinitescrollServiceTema.carregar();
  }

  getAreasConhecimento(temasAreas: TemasAreas){
    return TemasAreas.getAreasConhecimento(temasAreas.areaConhecimento);
  }

}