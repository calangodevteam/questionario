import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, of, tap } from 'rxjs';
//import { Areas } from '../model/areaConhecimento';

@Injectable({
  providedIn: 'root'
})
export class AreasService {

  private areasUrl = "/areas";
  // private areasUrl = "http://localhost:8080/areas";
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
/*
    obterAreas():Observable<Areas[]> {
    return this.http.get<Areas[]>(this.areasUrl)
          .pipe(
           tap(_ => console.log('Areas recuperados')),
           catchError(this.handleError<Areas[]>('obterTodos', []))
         );
     }
     */
}
