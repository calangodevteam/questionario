import { Tema } from "./tema";

export class Areas {
  id: number = 0;
  nome: string = "";
  paiId?: number;
  subAreas: Areas[] = [];
  temas: Tema[] = [];
}
