import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { authLogin } from './../model/authLogin';
import { Router, RouterStateSnapshot, UrlTree, ActivatedRouteSnapshot } from '@angular/router';
import { Injectable } from '@angular/core';
import { loginResponseDTO } from '../model/loginResponseDTO';

@Injectable({
  providedIn: 'root'
})
export class LoginWithJWTService {
  private url: string = "http://localhost:8080/calango/auth/login";



  constructor(private http: HttpClient) {

   }
  logar(obj: authLogin): Observable<loginResponseDTO> {
    return this.http.post<loginResponseDTO>(this.url,obj)
  }

}
