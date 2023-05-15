import { AreaConhecimento } from "./areaConhecimento";
import { Tema } from "./tema";

export class TemasAreas {
    id?: number;
    tema?: Tema;
    areaConhecimento?: AreaConhecimento;

    static getAreasConhecimento(areaConhecimento: AreaConhecimento | undefined){

        let caminho = [];
        let areaConhecimentoTemp: AreaConhecimento | undefined = areaConhecimento;
        
        while(areaConhecimentoTemp != null){
          caminho.push(areaConhecimentoTemp.nome);
          areaConhecimentoTemp = areaConhecimentoTemp.areaConhecimentoPai;
        }
        return caminho.reverse().join(" > ");
    }
}