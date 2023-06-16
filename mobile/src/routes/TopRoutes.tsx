import { createMaterialTopTabNavigator } from '@react-navigation/material-top-tabs';
import React from 'react';
import Ranking from '../pages/Ranking';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import HistoricoCamp from '../pages/Campanhas/HistoricoCamp';
import User from '../pages/User';
import Notificacao from '../pages/Notificacao';

const CampanhaIcon = ({focused, color}:any) => (
  <MaterialCommunityIcons name={focused?"book-edit":"book-edit-outline"} color={color} size={25} />
);

const RankingIcon = ({focused, color}:any) => (
  <MaterialCommunityIcons name={focused?"podium":"podium-gold"} color={color} size={25} />
);

const NotificationIcon = ({focused, color}:any) => (
  <MaterialCommunityIcons name={focused?"bell":"bell-outline"} color={color} size={25} />
);

const UserIcon = ({focused, color}:any) => (
  <MaterialCommunityIcons name={focused?"account":"account-outline"} color={color} size={25} />
);

const {Navigator, Screen} = createMaterialTopTabNavigator();

const TopRoutes = () => {
  return (
    <Navigator 
        screenOptions={{
            tabBarShowLabel:false,  
        }}>
        <Screen 
            name="campanhas" 
            component={HistoricoCamp}
            options={{ 
                tabBarIcon:CampanhaIcon
             }}
        />
        <Screen 
            name="ranking" 
            component={Ranking}
            options={{ 
                tabBarIcon:RankingIcon,
             }}
        />
        <Screen 
            name="notificacao" 
            component={Notificacao} 
            options={{ 
                tabBarIcon:NotificationIcon,
             }}
        />
        <Screen 
            name="user" 
            component={User} 
            options={{ 
                tabBarIcon:UserIcon,
             }}
        />
    </Navigator>
  );
};

export default TopRoutes;