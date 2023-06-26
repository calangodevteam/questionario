import React, { useEffect, useState } from 'react';
import {styles} from './styles';
import {Button, Text} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Image} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { GoogleSigninButton } from '@react-native-google-signin/google-signin';
import auth from '@react-native-firebase/auth';
import { SignIn } from '../../../services/FireBaseAuth';
import { findAlunoByEmail } from '../../../services/ApiCalango';
import { Aluno } from '../../../@types/aluno';

const Login = () => {

  const navigation = useNavigation();


  useEffect(() => {
      if (user) {
        findAlunoByEmail(user.email!).then(alunoResponse => setAluno(alunoResponse));
      } else {
        setAluno(null);
      }
  }, [user]);

  const handleSignIn = () => {
      SignIn().then(({ user }) => {
        findAlunoByEmail(user.email!).then(aluno => {
          if (!aluno){
            navigation.navigate('cadastro');
          }
        }).catch(error => console.log('erro ao buscar aluno: ', error));
      }).catch(error => {console.log('error: ', error);});
  };
  return (
    <SafeAreaView style={styles.container}>
      <Image style={styles.image} source={require('../../../assets/estudante.png')} />
      <Text variant="displaySmall">Bem vindo(a)!</Text>
      <Text variant="titleMedium" style={styles.text}>Faça o login com o google e vamos começar!</Text>
      <GoogleSigninButton
        size={GoogleSigninButton.Size.Wide}
        color={GoogleSigninButton.Color.Light}
        onPress={() => {} }
      />
      <Button
        mode="text"
        contentStyle={styles.button}
        labelStyle={{alignSelf:'center'}}
        onPress={handleSignIn}>
        Sign in with Google
      </Button>
    </SafeAreaView>
  );
};

export default Login;
