export class register
{
  name?: string;
  login?: string;
  password?: string;
  role?: string;

  constructor(name:string,login:string,password:string,role:string) {
    this.name = name;
    this.login = login;
    this.password = password;
    this.role = role;
  }
  

}
