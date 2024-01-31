import { Component } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { register } from 'src/app/model/register';
import { LoginWithJWTService } from 'src/app/services/login-with-jwt.service';

@Component({
  selector: 'app-cadastro-user-jwt',
  templateUrl: './cadastro-user-jwt.component.html',
  styleUrls: ['./cadastro-user-jwt.component.css']
})
export class CadastroUserJWTComponent {
  formUsu: FormGroup;
  servLogin: LoginWithJWTService;
  resultadoUltimoCadastro: string = "NADA";

  constructor(private formBuilder: FormBuilder, servLogin:LoginWithJWTService ) {
    this.servLogin = servLogin;
    this.formUsu = this.formBuilder.group({
      nome: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      senha: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  getError(campo: string): string {
    if (this.formUsu.get(campo)?.hasError('required'))
      return "Campo Obrigatório";
    if (this.formUsu.get(campo)?.hasError('email'))
      return "E-mail inválido";
    if (this.formUsu.get(campo)?.hasError('minlength')) {
      const erro = this.formUsu.get(campo)?.errors?.['minlength'];
      return `Mínimo de ${erro.requiredLength} caracteres`;
    }
    return "Erro no campo";
  }

  addUsu(): boolean {
    const fdata = this.formUsu.getRawValue();
    var role = "USER";

    const usuario = new register(fdata.senha, fdata.nome, fdata.email,role);


    if (this.servLogin.cadastrar(usuario)) {
      this.resultadoUltimoCadastro = "OK";
      return true;
    }
    else {
      this.resultadoUltimoCadastro = "ERRO";
      return false;
    }
  }




}
