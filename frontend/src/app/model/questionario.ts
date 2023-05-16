import { Questao } from "./questao";
import { Tema } from "./tema";

export class Questionario {

  titulo: String = "";
  id: number = 0;
  questoes: Questao[] = [];
  qtdQuestoes: number = 0;
  tempoDuracao: number = 0;
  tempoDisponivel: number = 0;
  dificuldade: String = "Fácil";
  //temas?: Tema[];

}
