import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Questionario } from 'src/app/model/questionario';
import { QuizService } from 'src/app/services/quiz.service';

@Component({
  selector: 'app-list-quiz',
  templateUrl: './list-quiz.component.html',
  styleUrls: ['./list-quiz.component.css']
})
export class ListQuizComponent implements OnInit{

  router: Router;
  quizService: QuizService;
  questionarios: Array<Questionario> = [];

  constructor(router: Router, quizService: QuizService) {
      this.router = router;
      this.quizService = quizService;
   }

  private obterTodos(){
    this.quizService.obterTodos()
        .subscribe((questionarios)=>this.questionarios=questionarios);
  }

  ngOnInit(): void {
    this.obterTodos();
  }

}
