import { Component, Input } from '@angular/core';
import { Questao } from 'src/app/model/questao';

@Component({
  selector: 'app-questao-card',
  templateUrl: './questao-card.component.html',
  styleUrls: ['./questao-card.component.css']
})
export class QuestaoCardComponent {

  @Input() questao!:Questao;

  getAreasConhecimento(){
    let caminho = [];
    let areaConhecimento = this.questao.temasAreas.areaConhecimento;
    while(areaConhecimento != null){
      caminho.push(areaConhecimento.nome);
      areaConhecimento = areaConhecimento.areaConhecimentoPai;
    }
    return caminho.reverse().join(" > ");
  }

}
