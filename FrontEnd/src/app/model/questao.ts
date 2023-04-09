import { Artigo } from "./artigo";
import { Figura } from "./figura";
import { Opcao } from "./opcao";
import { Tema } from "./tema";

export class Questao {

  id?: number;
  texto: string = "Nova Questão";
  categoriaBloom: string = "Avaliação";
  tema: Tema = new Tema();
  artigos: Artigo[] = [];
  figuras: Figura[] = [];
  opcoes: Opcao[] = [];

  adicionarOpcao(){

    this.opcoes.push(new Opcao());
  }

  deletarOpcao(indice: number){

    this.opcoes.splice(indice,1);

  }
}
