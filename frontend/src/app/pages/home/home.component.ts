import { Component, OnInit } from '@angular/core';
import { LoginMemoriaService } from 'src/app/services/login.memoria.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  servLogin: LoginMemoriaService;

  constructor(servLogin: LoginMemoriaService){
    this.servLogin = servLogin;
  }

}
