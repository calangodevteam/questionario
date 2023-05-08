import { Component, Output, EventEmitter, Input } from '@angular/core';
import { Questao } from 'src/app/model/questao';
import { QuestaoForm } from 'src/app/model/questao-form';
import { Tema } from 'src/app/model/tema';
import { QuestaoService } from 'src/app/services/questao.service';
import { ThemeService } from 'src/app/services/theme.service';

@Component({
  selector: 'app-dropdown-questoes',
  templateUrl: './dropdown-questoes.component.html',
  styleUrls: ['./dropdown-questoes.component.css']
})
export class DropdownQuestoesComponent {

  @Input() questaoNova!: boolean;
  @Output() questaoAdd = new EventEmitter<QuestaoForm>();

  temas: Tema[] =[];
  questoes: Questao[] = [];
  questaoForm: QuestaoForm = {id: 0, nome:'', tema:{id:0,nome:''}};

  constructor(private servicoQuestao: QuestaoService, private serviceT: ThemeService) {}

  VerificaQuestoes(){
    if(this.questaoNova)
      this.obterTodos()
  }
  obterTodos(){
    this.servicoQuestao.obterTodos()
        .subscribe((questoes)=>this.questoes=questoes);
  }

  private obterTemas() {
    this.serviceT.obterTemas()
      .subscribe((temas) => this.temas = temas);
  }

  enviarQuestao(questao:Questao){
    this.questaoForm.id = questao.id!;
    this.questaoForm.nome = questao.texto;
    //this.questaoForm.tema.id = questao.tema.id!;
    //this.questaoForm.tema.nome = questao.tema.nome;
    this.questaoAdd.emit(this.questaoForm);
  }

  ngOnInit(): void {
    this.obterTodos();
    this.obterTemas();
  }
}
