import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Inicial from "../pages/Inicial";
import Login from "../pages/Auth/Login";
import Cadastro from "../pages/Auth/Cadastro";
import BottomRoutes from "./BottomRoutes";

const {Navigator, Screen} = createNativeStackNavigator();

const AuthRoutes = () => {
  return (
    <Navigator
    screenOptions={{headerShown: false}}
    >
      <Screen 
        name="inicial" 
        component={Inicial}
      />
      <Screen 
        name="login" 
        component={Login} 
      />
      <Screen 
        name="cadastro" 
        component={Cadastro}
      />
      <Screen 
        name="app" 
        component={BottomRoutes}
      />
    </Navigator>
  );
}

export default AuthRoutes;