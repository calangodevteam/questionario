import {
  DarkTheme as NavigationDarkTheme,
  DefaultTheme as NavigationDefaultTheme,
} from '@react-navigation/native';

import {
  MD3DarkTheme,
  MD3LightTheme,
  adaptNavigationTheme,
} from 'react-native-paper';

const { LightTheme, DarkTheme } = adaptNavigationTheme({
  reactNavigationLight: NavigationDefaultTheme,
  reactNavigationDark: NavigationDarkTheme,
});

export const defaultTheme = {
  ...MD3LightTheme,
  ...LightTheme,
  roundness: 12,

  colors: {
    ...MD3LightTheme.colors,
    ...LightTheme.colors,
  },

};

export const darkTheme = {
  ...MD3DarkTheme,
  ...DarkTheme,
  roundness: 12,

  colors: {
    ...MD3DarkTheme.colors,
    ...DarkTheme.colors,
  },
};