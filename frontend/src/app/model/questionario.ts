import { Questao } from "./questao";
import { Tema } from "./tema";

export class Questionario {

  titulo: String = "";
  id: number = 0;
  questoes: Questao[] = [];
  qtd_questoes: number = 0;
  tempo_duracao: number = 0;
  tempo_disponivel: number = 0;
  dificuldade: String = "Fácil";
  tema?: Tema[];

}
