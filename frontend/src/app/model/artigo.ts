export class Artigo {
  id: number;
  url: string;
  titulo: string;
  dataPublicacao: Date;
  autor: string[];

  constructor() {

    this.id = 0;
    this.url = "";
    this.titulo = "";
    this.dataPublicacao = new Date;
    this.autor = [];

  }

adicionarAutor(){
  this.autor.push("Nome");
}

deletarAutor(indice: number){

  this.autor.splice(indice,1);

}

}
