import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { QuestaoDto } from 'src/app/model/questao-dto';
import { QuestaoService } from 'src/app/services/questao.service';

@Component({
  selector: 'app-create-questao',
  templateUrl: './create-questao.component.html',
  styleUrls: ['./create-questao.component.css']
})
export class CreateQuestaoComponent {

  btnText = "Criar"

  constructor(
    private router: Router,
    private service: QuestaoService,
  ) { }

  incluir(questaoDto: QuestaoDto):void{

    this.service.adicionar(questaoDto)
        .subscribe(_=> {
          this.router.navigateByUrl("/questoes")
        });
  }

}
