import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { authLogin } from './../model/authLogin';
import { Router, RouterStateSnapshot, UrlTree, ActivatedRouteSnapshot } from '@angular/router';
import { Injectable } from '@angular/core';
import { loginResponseDTO } from '../model/loginResponseDTO';
import { register } from '../model/register';
import { usuarioMemoriaJWT } from '../model/usuarioMemoriaJWT';

@Injectable({
  providedIn: 'root'
})
export class LoginWithJWTService {

  private url: string = "http://localhost:8080/calango/auth/login";
  private urlRegister: string = "http://localhost:8080/calango/auth/register";

  resultadoUltimoCadastro: string = '';



  constructor(private http: HttpClient) {

  }
  logar(obj: authLogin): Observable<usuarioMemoriaJWT> {
    return this.http.post<usuarioMemoriaJWT>(this.url, obj);
  }

  cadastrar(obj: register): boolean {
    if (this.http.post<boolean>(this.urlRegister, obj)) {
      this.resultadoUltimoCadastro = "TRUE";
      return true;
    } else {
      this.resultadoUltimoCadastro = "ERRO";
      return false;
    }

  }
}
