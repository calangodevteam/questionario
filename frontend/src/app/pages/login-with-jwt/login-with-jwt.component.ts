import { MatDialog } from '@angular/material/dialog';
import { Observable } from 'rxjs';
import { Router, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Component } from '@angular/core';
import { authLogin } from 'src/app/model/authLogin';
import { LoginWithJWTService } from 'src/app/services/login-with-jwt.service';
import { CadastroUserJWTComponent } from 'src/app/components/cadastro-user-jwt/cadastro-user-jwt.component';
import { usuarioMemoriaJWT } from 'src/app/model/usuarioMemoriaJWT';

@Component({
  selector: 'app-login-with-jwt',
  templateUrl: './login-with-jwt.component.html',
  styleUrls: ['./login-with-jwt.component.css']
})
export class LoginWithJWTComponent {
  authLogin = new authLogin();
  isAuthenticated: boolean = false;
  dialogo: MatDialog;
  enviando: boolean = false;
  mensagem: string = "";
  router: Router = new Router;
  usuarioLogado: usuarioMemoriaJWT = new usuarioMemoriaJWT();

  constructor(private service: LoginWithJWTService, dialogo: MatDialog) {
    this.dialogo = dialogo;
  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot):
    boolean | UrlTree | Observable<boolean | UrlTree> |
    Promise<boolean | UrlTree> {
    if (!this.isAuthenticated)
      return this.router.parseUrl("/login");
    else
      return true;
  }



  showCadUsu(): void {
    const dialogRef = this.dialogo.open(CadastroUserJWTComponent);

    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
  }




  onloging():void {
    this.enviando = true;
    if (this.authLogin.login === '' || this.authLogin.password === '') {
      alert('Preencha todos os campos');
         return
    }



    this.service.logar(this.authLogin).subscribe(
      (usuarioLogado) => {
        this.isAuthenticated = true;
        this.router.navigateByUrl("/home");

      },
       (error) => {
         console.error(error);
         this.mensagem = "Login ou senha inválido(s).";
      }
    );


  }




}
