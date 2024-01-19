import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { LoginDTO } from '../model/loginDTO';

@Injectable({
  providedIn: 'root'
})
export class AuthServiceService {

  private apiURL = "http://localhost:8080/calango/auth/";

  constructor(private http: HttpClient) { }

  login(email: string, senha: string):Observable<any> {

    const loginData = new LoginDTO(email, senha);


    return this.http.post<any>(`${this.apiURL}/login`, loginData);

  }

}
