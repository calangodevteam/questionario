export class usuarioMemoriaJWT {
  name?: string;
  login?: string;
  token?: string;


  constructor(name:string='',login:string='',token:string='') {
    this.name = name;
    this.login = login;
    this.token = token;

  }


}
