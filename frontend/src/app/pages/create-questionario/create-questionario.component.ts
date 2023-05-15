import { Questionario } from '../../model/questionario';
import { ThemeService } from '../../services/theme.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Questao } from 'src/app/model/questao';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { QuestionarioService } from 'src/app/services/questionario.service';

@Component({
  selector: 'app-create-questionario',
  templateUrl: './create-questionario.component.html',
  styleUrls: ['./create-questionario.component.css']
})
export class CreateQuestionarioComponent{
  btnText = "Criar"

  constructor(
    private router: Router,
    private service: QuestionarioService,
  ) { }

  incluir(questionario: Questionario):void{

    this.service.adicionar(questionario)
        .subscribe(_=> {
          this.router.navigateByUrl("/questionarios")
        });
  }

}
