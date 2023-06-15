import React, { useState } from 'react';
import { BottomNavigation, useTheme, BottomNavigationProps } from 'react-native-paper';
import User from '../pages/User';
import Ranking from '../pages/Ranking';
import CampanhasRoutes from './CampanhasRoutes';
import { createBottomTabNavigator, BottomTabBarProps } from '@react-navigation/bottom-tabs';
import { CommonActions } from '@react-navigation/native';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

const CampanhaIcon = ({ color, size }:any) => (
  <MaterialCommunityIcons name="book-edit-outline" color={color} size={size} />
);

const RankingIcon = ({ color, size }:any) => (
  <MaterialCommunityIcons name="podium-gold" color={color} size={size} />
);

const UserIcon = ({ color, size }:any) => (
  <MaterialCommunityIcons name="account-outline" color={color} size={size} />
);

const Tab = createBottomTabNavigator();

const tabBar= ({ navigation, state, descriptors, insets }: BottomTabBarProps) => (
  <BottomNavigation.Bar
    navigationState={state}
    safeAreaInsets={insets}
    onTabPress={({ route, preventDefault }:any) => {
      const event = navigation.emit({
        type: 'tabPress',
        target: route.key,
        canPreventDefault: true,
      });

      if (event.defaultPrevented) {
        preventDefault();
      } else {
        navigation.dispatch({
          ...CommonActions.navigate(route.name, route.params),
          target: state.key,
        });
      }
    }}
    renderIcon={({ route, focused, color }:any) => {
      const { options } = descriptors[route.key];
      if (options.tabBarIcon) {
        return options.tabBarIcon({ focused, color, size: 24 });
      }

      return null;
    }}
    getLabelText={({ route }:any) => {
      const { options } = descriptors[route.key];
      const label =
        options.tabBarLabel !== undefined
          ? options.tabBarLabel
          : options.title !== undefined
            ? options.title
            : route.title;

      return label;
    }}
  />
);

const BottomRoutes = () => {

  return (
    <Tab.Navigator
      screenOptions={{
        headerShown: false,
        tabBarShowLabel:false,
      }}

    >
      <Tab.Screen
        name="campanhas"
        component={CampanhasRoutes}
        options={{
          tabBarLabel: 'Campanhas',
          tabBarIcon: CampanhaIcon,
        }}
      />
      <Tab.Screen
        name="ranking"
        component={Ranking}
        options={{
          tabBarLabel: 'Ranking',
          tabBarIcon: RankingIcon,
        }}
      />
      <Tab.Screen
        name="user"
        component={User}
        options={{
          tabBarLabel: 'Usuário',
          tabBarIcon: UserIcon,
        }}
      />
    </Tab.Navigator>
  );
}

export default BottomRoutes;