import React, {useEffect, useState} from 'react';
import {styles} from './styles';
import {Text, Button, Avatar, TextInput, HelperText, useTheme} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {ScrollView, View} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { AppTheme } from '../../../@types/theme';
import Select from '../../../components/Select';
import { instituicaImpl, unidadeImpl } from '../../../utils/data';

const Cadastro = () => {

  const navigation = useNavigation();

  const theme = useTheme<AppTheme>();
  const [instituicao, setInstituicao] = useState(0);
  const [unidade, setUnidade] = useState(0);
  const [cep, setCep] = useState(0);
  const [curso, setCurso] = useState(0);
  const [modelo, setModelo] = useState(0);

  const[validacao,setValidacao] = useState(false);

  const validar = () => setValidacao(true);

  const verificaOpVazia = () => {
    return instituicao<1 || unidade<1 || cep<1 || curso<1 || modelo<1? true:false
  }

  const handleSignUp = () => {

    verificaOpVazia()? validar(): navigation.navigate('app');
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        keyboardDismissMode="none"
        >
        <View style={styles.containerImage}>
          <Avatar.Image
            style={styles.image}
            size={120}
            source={require('../../../assets/avatar.png')}
          />
          <Text variant='titleMedium'>Bem vindo(a)!</Text>
        </View>

        <Select 
          arrayObject={instituicaImpl}
          onChange={(newValue) => setInstituicao(newValue)}
          titleLabel={'Instituição'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Select 
          arrayObject={unidadeImpl}
          onChange={(newValue) => setUnidade(newValue)}
          titleLabel={'Unidade ou Polo'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Select 
          arrayObject={[]}
          onChange={(newValue) => setCep(newValue)}
          titleLabel={'CEP'}
          titleButton={'Insira seu CEP...'}
          validacao={validacao}
        />

        <Select 
          arrayObject={[]}
          onChange={(newValue) => setCurso(newValue)}
          titleLabel={'Curso'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Select 
          arrayObject={[]}
          onChange={(newValue) => setModelo(newValue)}
          titleLabel={'Modelo'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Button style={styles.button} buttonColor={theme.colors.onBackground} mode="contained" onPress={handleSignUp}>
          Avançar
        </Button>

      </ScrollView>
    </SafeAreaView>
  );
};

export default Cadastro;
