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

const fontConfig = {
  fontFamily: 'Roboto, "Helvetica Neue", Helvetica, Arial,"Sansita One"'
};

export const defaultTheme = {
  ...MD3LightTheme,
  ...LightTheme,
  roundness: 12,
  colors: {
    ...MD3LightTheme.colors,
    ...LightTheme.colors,
  },
  fonts: {
    ...MD3LightTheme.fonts,
    SansitaOne: {
      fontFamily: '"Sansita One"', // Defina o nome da sua fonte personalizada
      fontWeight: 'normal', // Defina o peso da fonte (opcional)
    },
    Poppins: {
      fontFamily: 'Poppins', // Defina o nome da sua fonte personalizada
      fontWeight: 'normal', // Defina o peso da fonte (opcional)
    }
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
