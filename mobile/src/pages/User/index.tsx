import React, { useContext } from 'react';
import { View } from 'react-native';

import { styles } from './styles';
import { PreferencesContext } from '../../theme/Theme';
import { Button, Switch } from 'react-native-paper';

 const User = ({navigation}:any) => {

    const {toggleTheme, isThemeDark} = useContext(PreferencesContext);

    const aux = () => {
        navigation.navigate('inicial')
      }
  return (
    <View style={styles.container}>
        <Switch color={'red'} value={isThemeDark} onValueChange={toggleTheme} />
        <Button  mode="contained" onPress={aux}> Iniciar </Button>
    </View>
  );
}

export default User;