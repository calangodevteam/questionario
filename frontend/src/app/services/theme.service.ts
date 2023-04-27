import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Tema } from '../model/tema';

import { catchError, Observable, of, tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ThemeService {

  // private temasUrl = "/temas";
  private temasUrl = "http://localhost:8080/temas";
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

    obterTemas():Observable<Tema[]> {
    return this.http.get<Tema[]>(this.temasUrl)
          .pipe(
           tap(_ => console.log('Temas recuperados')),
           catchError(this.handleError<Tema[]>('obterTodos', []))
         );
     }
}
