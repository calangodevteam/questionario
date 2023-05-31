import React from 'react';
import { styles } from './styles';
import { Text } from 'react-native-paper';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Image } from 'react-native';

const Inicial = () => {
  return (
    <SafeAreaView style={styles.container}>
        <Text>CALANGO</Text>
        <Image
            source={require('../../assets/logo300.png')}
        />
        <Text>versão 0.0.0.1</Text>
    </SafeAreaView>
  );
};

export default Inicial;
