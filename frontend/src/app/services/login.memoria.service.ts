import { UsuarioMemoria } from './../model/usuario.memoria';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthServiceService } from './auth-service.service';
import { loginResponseDTO } from '../model/loginResponseDTO';



@Injectable({
  providedIn: 'root'
})
export class LoginMemoriaService{

  bancoDeUsuarios = new Map<string, UsuarioMemoria>();

  router: Router;
  authService: AuthServiceService | undefined;


  /** Mudar para true para desativar a autenticação em memória */
 isAuthenticated: boolean = false;
  usuarioLogado: UsuarioMemoria = new UsuarioMemoria();




  constructor(router: Router) {
     this.router = router;
  }




  private buscarUsuario(email: string): UsuarioMemoria | undefined{
    return this.bancoDeUsuarios.get(email);
  }


  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot):
        boolean | UrlTree | Observable<boolean | UrlTree> |
        Promise<boolean | UrlTree> {
    if(!this.isAuthenticated)
        return this.router.parseUrl("/login");
    else
        return true;
  }

  entrar(email: string, senha:string): boolean {

    let usuarioMemoria = this.buscarUsuario(email);


    if(usuarioMemoria != undefined && usuarioMemoria.senha == senha){
          this.usuarioLogado = usuarioMemoria;
          this.isAuthenticated = true;
          return true;
    }

    return false;
  }



  sair(){
    this.usuarioLogado = new UsuarioMemoria() ;
    this.isAuthenticated = false;
  }

  cadastrar(usuarioMemoria: UsuarioMemoria): boolean{

    if(this.buscarUsuario(usuarioMemoria.email) == undefined){
      this.bancoDeUsuarios.set(usuarioMemoria.email, usuarioMemoria);
      return true;
    }
    return false;
  }
}
