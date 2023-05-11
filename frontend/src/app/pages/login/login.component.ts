import { MatDialog } from '@angular/material/dialog';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UsuarioMemoria } from 'src/app/model/usuario.memoria';
import { LoginMemoriaService } from 'src/app/services/login.memoria.service';
import { RegisterUserComponent } from 'src/app/components/register-user/register-user.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit{

  router: Router;
  servLogin: LoginMemoriaService;
  dialogo: MatDialog;
  login: string = "";
  senha: string = "";
  mensagem: string = "";
  enviando: boolean = false;

  logar(): void{
    this.enviando = true;
    console.log(this.login, this.senha)
    if(this.servLogin.entrar(this.login, this.senha)){
      this.router.navigateByUrl("/home");
    }
    else{
      this.mensagem = "Login ou senha inválido(s).";
      this.login = "";
      this.senha = "";
      this.router.navigateByUrl("/login");
    }
    this.enviando = false;
  }

  showCadUsu(): void{
    const dialogRef = this.dialogo.open(RegisterUserComponent);

    dialogRef.afterClosed().subscribe(result => {
      console.log(`Dialog result: ${result}`);
    });
  }

  constructor(router: Router, servLogin: LoginMemoriaService,
              dialogo: MatDialog) {
    this.router = router;
    this.servLogin = servLogin;
    this.dialogo = dialogo;
  }

  ngOnInit(): void {
    this.servLogin.cadastrar(new UsuarioMemoria("admin", "admin", "admin"));
  }
}
