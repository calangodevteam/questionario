import { HttpClient } from '@angular/common/http';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Configuracao } from 'configuracao';
import { Questao } from 'src/app/model/questao';
import { TemasAreas } from 'src/app/model/temasAreas';
import { RestElementsInfinitescrollService } from 'src/app/services/rest.elements.infinitescroll.service';

@Component({
  selector: 'app-modal-selecao-tema',
  templateUrl: './modal-selecao-tema.component.html'
})
export class ModalSelecaoTemaComponent implements OnInit {

  @Input() callbackSelecaoTema: (parametro: any) => any = () => {}
  @Output() onTemaSelecionado: EventEmitter<TemasAreas | null> = new EventEmitter<TemasAreas | null>();

  public restElementsInfinitescrollServiceTema: RestElementsInfinitescrollService<TemasAreas>;

  constructor(
    http: HttpClient) {
      this.restElementsInfinitescrollServiceTema = new RestElementsInfinitescrollService<TemasAreas>(http);
  }

  selecionarTema(temasAreas: TemasAreas | null) {
    this.onTemaSelecionado.emit(temasAreas);
  }

  getAreasConhecimento(temasAreas: TemasAreas){
    let caminho = [];
    let areaConhecimento = temasAreas.areaConhecimento;
    while(areaConhecimento != null){
      caminho.push(areaConhecimento.nome);
      areaConhecimento = areaConhecimento.areaConhecimentoPai;
    }
    return caminho.reverse().join(" > ");
  }

  ngOnInit(): void {
    this.restElementsInfinitescrollServiceTema.setElementsUrl(Configuracao.urlAreasTemas);
    this.restElementsInfinitescrollServiceTema.httpParams = this.restElementsInfinitescrollServiceTema.httpParams.set("temanome", "");
    this.restElementsInfinitescrollServiceTema.carregar();
  }

}