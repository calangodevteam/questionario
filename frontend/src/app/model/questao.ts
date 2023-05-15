import { Artigo } from "./artigo";
import { Figura } from "./figura";
import { Opcao } from "./opcao";
import { TemasAreas } from "./temasAreas";

export class Questao {

  id?: number;
  opcaoCorreta: Opcao = new Opcao();
  texto: string = "";
  categoriaBloom: string = "Avaliação";
  temasAreas: TemasAreas = new TemasAreas();
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
