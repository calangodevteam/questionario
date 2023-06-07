import { createNativeStackNavigator } from "@react-navigation/native-stack";
import HistoricoCamp from "../pages/Campanhas/HistoricoCamp";
import EscolhaCamp from "../pages/Campanhas/EscolhaCamp";
import QuestoesCamp from "../pages/Campanhas/QuestoesCamp";
import ResultadoCamp from "../pages/Campanhas/ResultadoCamp";

const {Navigator, Screen} = createNativeStackNavigator();

const CampanhasRoutes = () => {
  return (
    <Navigator
    screenOptions={{}}
    >
      <Screen 
        name="historico_camp"
        component={HistoricoCamp}
        options={{
          headerShown: false,
        }}
      />
      <Screen 
        name="escolha_camp" 
        component={EscolhaCamp} 
        options={{
          title:'Lista de Campanhas',
        }}
      />
      <Screen 
        name="questoes_camp" 
        component={QuestoesCamp}
        options={{
          title:'Questões',
        }}
      />
      <Screen 
        name="resultado_camp" 
        component={ResultadoCamp}
        options={{
          title:'Resultado Obtido',
        }}
      />
    </Navigator>
  );
}

export default CampanhasRoutes;