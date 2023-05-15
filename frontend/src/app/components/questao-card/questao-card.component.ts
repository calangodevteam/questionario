import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Questao } from 'src/app/model/questao';
import { TemasAreas } from 'src/app/model/temasAreas';

@Component({
  selector: 'app-questao-card',
  templateUrl: './questao-card.component.html',
  styleUrls: ['./questao-card.component.css']
})
export class QuestaoCardComponent {

  @Input() questao: Questao = new Questao();
  @Output() onSelecionarQuestao: EventEmitter<Questao> = new EventEmitter<Questao>;
  @Input() modoDeSelecao: boolean = false;

  getAreasConhecimento(){
    return TemasAreas.getAreasConhecimento(this.questao.temasAreas.areaConhecimento);
  }
  
}