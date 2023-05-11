/*
  ESTA CLASSE PRECISA SER MELHORADA! NÃO É IDEAL QUE O USUÁRIO TENHA QUE LIDAR COM O HTTPPARAMS DIRETAMENTE
  ALÉM DISSO, ESSE HTTPPARAMS DEVE ESTAR CENTRALIZADO EM UM OUTRO MÉTODO PARA QUE OUTRAS FUNÇÕES DAQUI MESMO NÃO TENHAM QUE LIDAR COM ELE DIRETAMENTE
*/

import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable, OnInit } from '@angular/core';
import { Configuracao } from 'configuracao';
import { catchError, Observable, of, tap } from 'rxjs';
import { ESTADOS_ELEMENTOS } from 'src/app/estadosElementos';

export class RestElementsInfinitescrollService<T> {

  public httpParams = new HttpParams();

  //private questoesUrl = "/questoes";
  private elementsUrl: string = "";
  private http: HttpClient;

  private elementos: T[] = [];

  private estadoBusca: number = ESTADOS_ELEMENTOS.INICIAL;

  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(http: HttpClient) {
      this.http = http;
      this.estadoBusca = ESTADOS_ELEMENTOS.INICIAL;
      this.httpParams = this.httpParams.set(Configuracao.parametroDePage.chave, Configuracao.parametroDePage.valor);
      this.httpParams = this.httpParams.set(Configuracao.parametroDeSort.chave, Configuracao.parametroDeSort.valor);  
  }

  public getEstadosElementos(){
    return ESTADOS_ELEMENTOS;
  }

  public setElementsUrl(elementsUrl: string){
    this.elementsUrl = elementsUrl;
  }

  public getEstadoBusca(): number{
    return this.estadoBusca;
  }

  public getElementos(): T[]{
    return this.elementos;
  }

  public reset(){
    this.elementos = [];
    this.httpParams = this.httpParams.set(Configuracao.parametroDePage.chave, 0);
    this.estadoBusca = ESTADOS_ELEMENTOS.INICIAL;
  }

  setarParametroEResetar(chave: string, valor: string){
    this.httpParams = this.httpParams.set(chave, valor);
    this.estadoBusca = ESTADOS_ELEMENTOS.CARREGANDO;
    this.reset();
    this.carregar();
  }

  public carregarMais(){
    this.estadoBusca = ESTADOS_ELEMENTOS.CARREGANDO;
    this.httpParams.get(Configuracao.parametroDePage.chave)

    const pageValor = this.httpParams.get(Configuracao.parametroDePage.chave);
    if (pageValor == null) return;
    let page = pageValor !== null ? parseInt(pageValor) + 1 : null;
    this.httpParams = this.httpParams.set(Configuracao.parametroDePage.chave, page == null? 0 : page);
 
    this.carregar();
  }

  private gerenciarNovosDados(elementos: T[]){
    if(elementos.length == 0){
      this.estadoBusca = ESTADOS_ELEMENTOS.ACABOU;
      return;
    }
    this.estadoBusca = ESTADOS_ELEMENTOS.PODE_TENTAR_CARREGAR_MAIS;

    let clone = this.elementos.slice();
    elementos.forEach((elemento) => clone.push(elemento));
    this.elementos = clone;
  }

  // Retorno, mesmo que vazio, impede que o app trave
  private handleError<T>(operation:string = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      console.error(operation+" :: "+error);
      return of(result as T);
    };
  }

  public carregar() {
    let params = this.httpParams;
    this.http.get<T[]>(this.elementsUrl, {params})
      .pipe(
        tap(_ => console.log('Elementos recuperados')),
        catchError(this.handleError<T[]>('carregar', []))
      )?.subscribe((elementos) => this.gerenciarNovosDados(elementos));
  }
}