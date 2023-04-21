import { Artigo } from "./artigo";
import { Figura } from "./figura";
import { Opcao } from "./opcao";
import { Tema } from "./tema";

export class Questao {

  id?: number;
  texto: string = "";
  categoriaBloom: string = "Avaliação";
  tema: Tema = new Tema();
  artigos: Artigo[] = [];
  figuras: Figura[] = [];
  opcoes: Opcao[] = [];

  adicionarOpcao(){
    const qtd:number=4;

    for (let i=0; i<qtd; i++)
      this.opcoes.push(new Opcao());
  }

  deletarOpcao(indice: number){

    this.opcoes.splice(indice,1);

  }

  adicionarArtigo(){
    this.artigos.push(new Artigo());
  }

  deletarArtigo(indice: number){

    this.artigos.splice(indice,1);

  }

}

