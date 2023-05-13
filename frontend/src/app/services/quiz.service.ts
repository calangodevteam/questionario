import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Configuracao } from 'configuracao';

import { catchError, Observable, of, tap } from 'rxjs';
import { Questionario } from '../model/questionario';

@Injectable({
  providedIn: 'root'
})
export class QuizService {

  private questionariosUrl = Configuracao.urlQuestionario;
  // private questionariosUrl = "http://localhost:8080/questionarios";
  private http: HttpClient;

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(http: HttpClient) {
     this.http = http;
  }

  // Retorno, mesmo que vazio, impede que o app trave
  private handleError<T>(operation:string = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(operation+" :: "+error);
      return of(result as T);
    };
  }

  adicionar(questionario: Questionario): Observable<any>{
      return this.http.post<Questionario>(this.questionariosUrl, questionario, this.httpOptions)
             .pipe(
                  tap((novo: any) => console.log(`Adicionado id=${novo.insertedId}`)),
                  catchError(this.handleError<Questionario>('adicionar'))
       );
   }

   remover(_id: number): Observable<Questionario>{
      const url = `${this.questionariosUrl}/${_id}`;
      return this.http.delete<Questionario>(url, this.httpOptions).pipe(
        tap(_ => console.log(`Removido id=${_id}`)),
        catchError(this.handleError<Questionario>('remover'))
      );
   }

   obterTodos():Observable<Questionario[]> {
      return this.http.get<Questionario[]>(this.questionariosUrl)
        .pipe(
          tap(_ => console.log('Questaos recuperados')),
          catchError(this.handleError<Questionario[]>('obterTodos', []))
        );
    }

}
