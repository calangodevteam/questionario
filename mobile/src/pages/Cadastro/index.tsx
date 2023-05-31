import React from 'react';
import {styles} from './styles';
import {Text, Button, Avatar, TextInput} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {View} from 'react-native';

const Cadastro = () => {
  return (
    <SafeAreaView style={styles.container}>
      <View>
        <Avatar.Image size={125} source={require('../../assets/avatar.png')} />
        <Text>Bem vindo(a)!</Text>
      </View>
      <View>
        <Text>Instituição</Text>
        <TextInput
          mode="outlined"
          placeholder="Insira sua instituição"
          value={''}
          onChangeText={() => {}}
        />

        <Text>Unidade ou Polo</Text>
        <TextInput
          mode="outlined"
          placeholder="Insira a unidade ou polo que você cursa"
          value={''}
          onChangeText={() => {}}
        />

        <Text>CEP</Text>
        <TextInput
          mode="outlined"
          inputMode="numeric"
          placeholder="Insira seu CEP"
          value={''}
          onChangeText={() => {}}
        />

        <Text>Curso</Text>
        <TextInput
          mode="outlined"
          placeholder="Insira seu curso"
          value={''}
          onChangeText={() => {}}
        />

        <Text>Modelo</Text>
        <TextInput
          mode="outlined"
          placeholder="Insira o modelo que está cursando"
          value={''}
          onChangeText={() => {}}
        />
      </View>
      <Button mode="contained" onPress={() => console.log('Pressed')}>
        Avançar
      </Button>
    </SafeAreaView>
  );
};

export default Cadastro;
