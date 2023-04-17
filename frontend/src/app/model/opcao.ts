export class Opcao {
    id: number;
    texto: string;
    correta: boolean;
    numero: number;

    constructor(id: number = 0, texto: string = "",
      correta: boolean = false, numero: number = 0
      ) {
  
      this.id = id;
      this.texto = texto;
      this.correta = correta;
      this.numero = numero;
  
    }
}