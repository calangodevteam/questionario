import { Component, Input } from '@angular/core';
import { Questionario } from 'src/app/model/questionario';

@Component({
  selector: 'app-questionario-card',
  templateUrl: './questionario-card.component.html',
  styleUrls: ['./questionario-card.component.css']
})
export class QuestionarioCardComponent {

  @Input() questionario!:Questionario;

}
