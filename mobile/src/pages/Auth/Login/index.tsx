import React, { useEffect, useState } from 'react';
import {styles} from './styles';
import {Text, Button, useTheme} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Image} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import {
  GoogleSignin,
  GoogleSigninButton,
  statusCodes,
} from '@react-native-google-signin/google-signin';
import auth, { FirebaseAuthTypes } from '@react-native-firebase/auth';

const Login = () => {

  const navigation = useNavigation();

  GoogleSignin.configure({
    webClientId: '478136560350-uunms38larls3kq64uto8it49prh1pea.apps.googleusercontent.com',
  });

  async function onGoogleButtonPress() {
    // Check if your device supports Google Play
    await GoogleSignin.hasPlayServices({ showPlayServicesUpdateDialog: true });
    // Get the users ID token
    const { idToken } = await GoogleSignin.signIn();
  
    // Create a Google credential with the token
    const googleCredential = auth.GoogleAuthProvider.credential(idToken);
  
    // Sign-in the user with the credential
    return auth().signInWithCredential(googleCredential);
  }

  const signOut = async () => {
    try {
      await GoogleSignin.revokeAccess();
    } catch (error) {
      console.error(error);
    }
  };

  const handleUseExist =  () => {
      navigation.navigate('cadastro');
  }
  return (
    <SafeAreaView style={styles.container}>
      <Image style={styles.image} source={require('../../../assets/estudante.png')} />
      <Text variant='displaySmall'>Bem vindo(a)!</Text>
      <Text variant='titleMedium' style={styles.text}>Faça o login com o google e vamos começar!</Text>
      <GoogleSigninButton 
        size={GoogleSigninButton.Size.Wide}
        color={GoogleSigninButton.Color.Light}
        onPress={() => onGoogleButtonPress().then(() => console.log('Signed in with Google!')).catch(error => {console.log('error: ',)})}
      />
      <Button mode='contained' onPress={() => signOut().then(() => console.log('SignOut with Google!')).catch(error => {console.log('error signOut: ',)})}>SignOut</Button>
    </SafeAreaView>
  );
};

export default Login;
