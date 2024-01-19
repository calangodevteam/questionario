export class loginResponseDTO {
  private _token: string;
  private _name: string;

  constructor(token: string, name: string) {
    this._token = token;
    this._name = name;
  }

  get token(): string {
    return this._token;
  }

  get name(): string {
    return this._name;
  }

}
