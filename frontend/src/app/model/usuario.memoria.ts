export class UsuarioMemoria {
  
  public senha: string;
  public nome:  string;
  public email: string;

  constructor(senha: string = "", nome: string = "", email: string=""){
      this.senha = senha;
      this.nome = nome;
      this.email = email;
  }
}
