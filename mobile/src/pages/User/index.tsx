import React, { useContext } from 'react';
import { View } from 'react-native';

import { styles } from './styles';
import { Button, Switch } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';
import { PreferencesContext } from '../../contexts/ThemeContext';
import UsuLevelCard from '../../components/UsuLevelCard';
import { SafeAreaView } from 'react-native-safe-area-context';

 const User = () => {

  const navigation = useNavigation();

    const {toggleTheme, isThemeDark} = useContext(PreferencesContext);

    const aux = () => {
        navigation.navigate('inicial');
      }
  return (
    <SafeAreaView style={styles.container}>
        <Switch color={'red'} value={isThemeDark} onValueChange={toggleTheme} />
        <Button  mode="contained" onPress={aux}> Iniciar </Button>
        <UsuLevelCard/>
    </SafeAreaView>
  );
}

export default User;