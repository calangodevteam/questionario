import { Questao } from "./questao";
import { TemasAreas } from "./temasAreas";


export interface Questionario {
  id: number;
  titulo: string;
  qtdQuestoes: number;
  tempoDuracao: number;
  tempoDisponivel: number;
  dificuldade: string;
  temasAreas: TemasAreas;
  questoes: Questao[];
}
