import { Component } from '@angular/core';
import { UsuarioMemoria } from 'src/app/model/usuario.memoria';
import { LoginMemoriaService } from 'src/app/services/login.memoria.service';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-register-user',
  templateUrl: './register-user.component.html',
  styleUrls: ['./register-user.component.css']
})
export class RegisterUserComponent {

  formUsu: FormGroup;
  servLogin: LoginMemoriaService;
  resultadoUltimoCadastro: string = "NADA";

  constructor(private formBuilder: FormBuilder, servLogin: LoginMemoriaService) {
    this.servLogin = servLogin;
    this.formUsu = this.formBuilder.group({
      nome:  ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  getError(campo: string): string {
    if(this.formUsu.get(campo)?.hasError('required'))
      return "Campo Obrigatório";
    if(this.formUsu.get(campo)?.hasError('email'))
      return "E-mail inválido";
    if(this.formUsu.get(campo)?.hasError('minlength')){
      const erro = this.formUsu.get(campo)?.errors?.['minlength'];
      return `Mínimo de ${erro.requiredLength} caracteres`;
    }
    return "Erro no campo";
  }

  addUsu(): boolean{
    const fdata = this.formUsu.getRawValue();
    const usuario = new UsuarioMemoria(fdata.senha,fdata.nome,fdata.email);
    if(this.servLogin.cadastrar(usuario)){
      this.resultadoUltimoCadastro = "OK";
      return true;
    }
    else{
      this.resultadoUltimoCadastro = "ERRO";
      return false;
    }
  }

  ngOnInit(): void {
  }

}
