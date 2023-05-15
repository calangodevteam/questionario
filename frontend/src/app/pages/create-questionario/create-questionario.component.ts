import { Questionario } from '../../model/questionario';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
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
