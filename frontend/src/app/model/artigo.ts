export class Artigo {
  id: number = 0;
  url: string = "";
  titulo: string = "";
  dataPublicacao: Date = new Date;
  autor: string[] = [];

adicionarAutor(){
  this.autor.push("");
}

deletarAutor(indice: number){
  this.autor.splice(indice,1);
}

}
