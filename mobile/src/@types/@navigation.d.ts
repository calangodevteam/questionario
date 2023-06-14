import { Questionario, Resultado } from "./questionario";


export declare global {
  namespace ReactNavigation {
    interface RootParamList {
      inicial: undefined;
      login: undefined;
      cadastro: undefined;
      app: undefined;
      historico_camp: undefined;
      escolha_camp: undefined;
      questoes_camp: Questionario;
      resultado_camp: Resultado;
    }
  }
}