export class Artigo {
  id: number;
  url: string;
  titulo: string;
  dataPublicacao: Date;
  autor: string[];
  
  constructor(id: number = 0, url: string="",
    titulo: string = "",
    dataPublicao: Date = new Date(), autor: string[] = []
    ) {

    this.id = id;
    this.url = url;
    this.titulo = titulo;
    this.dataPublicacao = dataPublicao;
    this.autor = autor;  

  }
  
}
