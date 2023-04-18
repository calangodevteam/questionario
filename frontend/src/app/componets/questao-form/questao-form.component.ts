import { QuestaoDto } from './../../model/questao-dto';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { Artigo } from 'src/app/model/artigo';
import { Questao } from 'src/app/model/questao';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { ThemeService } from 'src/app/services/theme.service';

@Component({
  selector: 'app-questao-form',
  templateUrl: './questao-form.component.html',
  styleUrls: ['./questao-form.component.css']
})
export class QuestaoFormComponent {

  router: Router;
  service: QuestaoService;
  serviceT: ThemeService;
  temas: Tema[] = [];
  questao: Questao = new Questao();
  questaoDto: QuestaoDto = new QuestaoDto();

  constructor(router: Router, service: QuestaoService, serviceT: ThemeService) {
    this.router = router;
    this.service = service;
    this.serviceT = serviceT;
 }

 obterTemas(){
  this.serviceT.obterTemas()
      .subscribe((temas)=>this.temas=temas);
}

incluirAutor(idArt: number, ind: number, autor: string):void{
  this.questao.artigos[idArt].autor[ind] =  autor;
}

incluir():void{
  this.questaoDto.questao = this.questao;
  this.questaoDto.opcao_corretaId = 4;
  this.service.adicionar(this.questaoDto)
      .subscribe(_=> {
        this.router.navigateByUrl("/questoes")
      });
}

 ngOnInit(){
 this.obterTemas();
}

}
