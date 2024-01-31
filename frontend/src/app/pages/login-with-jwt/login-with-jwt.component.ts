import { Observable } from 'rxjs';
import { Router, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Component } from '@angular/core';
import { authLogin } from 'src/app/model/authLogin';
import { LoginWithJWTService } from 'src/app/services/login-with-jwt.service';

@Component({
  selector: 'app-login-with-jwt',
  templateUrl: './login-with-jwt.component.html',
  styleUrls: ['./login-with-jwt.component.css']
})
export class LoginWithJWTComponent {
  authLogin = new authLogin();
  isAuthenticated: boolean = false;

  enviando: boolean = false;
  mensagem: string = "";
  router: Router = new Router;

  constructor(private service: LoginWithJWTService) {

  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot):
    boolean | UrlTree | Observable<boolean | UrlTree> |
    Promise<boolean | UrlTree> {
    if (!this.isAuthenticated)
      return this.router.parseUrl("/login");
    else
      return true;
  }

  onloging():void {
    this.enviando = true;
    if (this.authLogin.login === '' || this.authLogin.password === '') {
      alert('Preencha todos os campos');
         return
    }

    this.service.logar(this.authLogin).subscribe(
      (res: any) => {
      this.isAuthenticated = true;
      this.router.navigateByUrl("/home");

      },
      (error: any) => {
        console.error(error);
        this.mensagem = "Login ou senha inválido(s).";


      }
    );

  }




}
