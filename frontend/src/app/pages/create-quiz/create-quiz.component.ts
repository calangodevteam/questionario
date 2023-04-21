import { Questionario } from './../../model/questionario';
import { ThemeService } from './../../services/theme.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Questao } from 'src/app/model/questao';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { QuizService } from 'src/app/services/quiz.service';

@Component({
  selector: 'app-create-quiz',
  templateUrl: './create-quiz.component.html',
  styleUrls: ['./create-quiz.component.css']
})
export class CreateQuizComponent implements OnInit{

  router: Router;
  servicoQuestionario: QuizService;
  servicoQuestao: QuestaoService;
  servicoTema: ThemeService
  public questionario: Questionario = new Questionario();
  temas: Tema[] = [];

  questoes_form: Questao[] = [];
  num_questoes_form = 2;

  constructor(router: Router, servicoQuestionario: QuizService, servicoQuestao: QuestaoService, servicoTema: ThemeService) {
      this.router = router;
      this.servicoQuestionario = servicoQuestionario;
      this.servicoQuestao = servicoQuestao;
      this.servicoTema = servicoTema;
   }

  obterTemas(){
    this.servicoTema.obterTemas()
        .subscribe((temas)=>this.temas=temas);
  }

  incluir():void{
    this.servicoQuestionario.adicionar(this.questionario)
        .subscribe(_=> {
          this.router.navigateByUrl("/questionarios")
        });
  }

  adicionarQuestaoForm(){
    console.log(this.questionario.questoes.length);
    this.questionario.questoes.push(new Questao());

    //this.num_questoes_form_array = new Array(num_questoes_form_number);
    //this.template_questoes_criadas = true;
  }

  deletarQuestaoForm(indice: number){

    console.log(this.questionario.questoes.length)
    this.questionario.questoes.splice(indice,1);

    //this.num_questoes_form_array = new Array(num_questoes_form_number);
    //this.template_questoes_criadas = true;
  }

  ngOnInit(){
    this.obterTemas();
  }
}
