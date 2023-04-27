import { Component, Input } from '@angular/core';
import { Questao } from 'src/app/model/questao';

@Component({
  selector: 'app-questao-card',
  templateUrl: './questao-card.component.html',
  styleUrls: ['./questao-card.component.css']
})
export class QuestaoCardComponent {

  @Input() questao!:Questao;

}
