import { createNativeStackNavigator } from "@react-navigation/native-stack";
import Inicial from "../pages/Inicial";
import Login from "../pages/Login";
import Cadastro from "../pages/Cadastro";
import User from "../pages/User";
import BottomRoutes from "./BottomRoutes";

const {Navigator, Screen} = createNativeStackNavigator();

const LoginRoutes = () => {
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

export default LoginRoutes;