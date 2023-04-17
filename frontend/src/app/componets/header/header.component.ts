import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { LoginMemoriaService } from 'src/app/services/login.memoria.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent {
  router: Router;
  servLogin: LoginMemoriaService;

  constructor(router: Router, servLogin: LoginMemoriaService){
    this.router = router;
    this.servLogin = servLogin;
  }

  sair(): void{
    this.servLogin.sair();
    this.router.navigateByUrl("/home");
  }
}
