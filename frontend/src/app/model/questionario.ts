import { Questao } from "./questao";

export class Questionario {

  titulo: string = "";
  id: number = 0;
  questoes: Questao[] = [];
  qtdQuestoes: number = 0;
  tempoDuracao: number = 0;
  tempoDisponivel: number = 0;
  dificuldade: string = "Fácil";
  dataCriacao: string = "";

}