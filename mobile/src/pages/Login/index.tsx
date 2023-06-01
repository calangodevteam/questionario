import React from 'react';
import {styles} from './styles';
import {Text, Button} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Image} from 'react-native';

const Login = ({navigation}:any) => {

  const handleSignUpGoogle = () => {
    navigation.navigate('cadastro');
  }
  return (
    <SafeAreaView style={styles.container}>
      <Image style={styles.image} source={require('../../assets/estudante.png')} />
      <Text style={[]}>Bem vindo(a)!</Text>
      <Text style={styles.text}>Faça o login com o google e vamos começar!</Text>
      <Button
        mode="elevated"
        onPress={handleSignUpGoogle}>
        Sign Up with Google
      </Button>
    </SafeAreaView>
  );
};

export default Login;
