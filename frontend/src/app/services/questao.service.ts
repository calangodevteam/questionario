import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Questao } from '../model/questao';
import { catchError, map, Observable, of, tap } from 'rxjs';
import { QuestaoDto } from '../model/questao-dto';

@Injectable({
  providedIn: 'root'
})
export class QuestaoService {

  // private questoesUrl = "/questoes";
  private questoesUrl = "http://localhost:8080/questoes";
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

  adicionar(questao: QuestaoDto): Observable<Questao>{
      return this.http.post<QuestaoDto>(this.questoesUrl, questao, this.httpOptions)
             .pipe(
                  tap((novo: any) => console.log(`Adicionado id=${novo.id}`)),
                  catchError(this.handleError<Questao>('adicionar'))
       );
   }

   remover(_id: number): Observable<Questao>{
      const url = `${this.questoesUrl}/${_id}`;
      return this.http.delete<Questao>(url, this.httpOptions).pipe(
        tap(_ => console.log(`Removido id=${_id}`)),
        catchError(this.handleError<Questao>('remover'))
      );
   }

   obterPorTema(temaId: number):Observable<Questao[]> {
    return this.http.get<Questao[]>(`${this.questoesUrl}/tema?id=${temaId}`)
      .pipe(
        tap(_ => console.log('Questoes recuperados')),
        catchError(this.handleError<Questao[]>('obterPorTema', []))
      );
  }

   obterTodos():Observable<Questao[]> {
      return this.http.get<Questao[]>(this.questoesUrl)
        .pipe(
          tap(_ => console.log('Questoes recuperadas')),
          catchError(this.handleError<Questao[]>('obterTodos', []))
        );
    }

}
