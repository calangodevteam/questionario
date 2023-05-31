import React from 'react';
import {styles} from './styles';
import {Text, Button} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Image} from 'react-native';

const Login = () => {
  return (
    <SafeAreaView style={styles.container}>
      <Image source={require('../../assets/estudante.png')} />
      <Text>Bem vindo(a)!</Text>
      <Text>Faça o login com o google e vamos começar!</Text>
      <Button
        mode="contained"
        onPress={() => console.log('Pressed')}>
        Sign Up with Google
      </Button>
    </SafeAreaView>
  );
};

export default Login;
