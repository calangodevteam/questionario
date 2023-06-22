import React, {useEffect, useState} from 'react';
import {styles} from './styles';
import {
  Text,
  Button,
  Avatar,
  TextInput,
  useTheme,
} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {ScrollView, View} from 'react-native';
import {useNavigation} from '@react-navigation/native';
import {AppTheme} from '../../../@types/theme';
import Select from '../../../components/Select';
import {cursoImpl, instituicaImpl, unidadeImpl} from '../../../utils/data';

const Cadastro = () => {
  const navigation = useNavigation();

  const theme = useTheme<AppTheme>();
  const [instituicao, setInstituicao] = useState(0);
  const [unidade, setUnidade] = useState(0);
  const [cep, setCep] = useState('');
  const [curso, setCurso] = useState(0);
  const [modelo, setModelo] = useState('');

  const [validacao, setValidacao] = useState(false);
  const [invalidCep, setInvalidCep] = useState(false);

  const cepRegex = /^[0-9]{5}-[0-9]{3}$/;

  const validar = () => setValidacao(true);

  const verificaOpVazia = () => {
    return instituicao < 1 ||
      unidade < 1 ||
      cep == '' ||
      curso < 1 ||
      modelo == ''
      ? true
      : false;
  };

  useEffect(() => {
    console.log(cep);
  }, [cep]);

  const handleSignUp = () => {
    verificaOpVazia() || invalidCep ? validar() : navigation.navigate('app');
  };

  return (
    <SafeAreaView style={styles.container}>
      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        keyboardDismissMode="none">
        <View style={styles.containerImage}>
          <Avatar.Image
            style={styles.image}
            size={120}
            source={require('../../../assets/avatar.png')}
          />
          <Text variant="titleMedium">Bem vindo(a)!</Text>
        </View>

        <View style={{marginHorizontal: 10}}>
          <Text
            variant="labelLarge"
            style={{marginVertical: 4, color: theme.colors.secondary}}>
            CEP
          </Text>
          <TextInput
            mode="outlined"
            keyboardType="numeric"
            textColor={
              (cep == '' && validacao) || (cep != '' && invalidCep)
              ? theme.colors.error
              : theme.colors.outline
            }
            outlineStyle={{
              borderRadius: theme.roundness,
              elevation: 3,
              borderColor:
                (cep == '' && validacao) || (cep != '' && invalidCep)
                  ? theme.colors.error
                  : theme.colors.elevation.level5,
            }}
            placeholder="12345-678"
            value={cep}
            onChangeText={newValue => {
              cepRegex.test(newValue)
                ? setInvalidCep(false)
                : setInvalidCep(true);
              setCep(newValue);
            }}
          />
        </View>

        <Select
          arrayObject={instituicaImpl}
          onChange={newValue => setInstituicao(newValue)}
          titleLabel={'Instituição'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Select
          arrayObject={unidadeImpl}
          onChange={newValue => setUnidade(newValue)}
          titleLabel={'Unidade ou Polo'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Select
          arrayObject={cursoImpl.map(cursoImpl => {
            return {
              id: cursoImpl.id,
              nome: `${cursoImpl.curso?.nome} - ${cursoImpl.modalidade}`,
            };
          })}
          onChange={newValue => {
            setCurso(newValue);
            cursoImpl.forEach(cursoImpl => {
              if (newValue == cursoImpl.id) {
                return setModelo(cursoImpl.modalidade);
              }
            });
          }}
          titleLabel={'Curso | Modalidade'}
          titleButton={'Escolha uma Opção...'}
          validacao={validacao}
        />

        <Button
          style={styles.button}
          buttonColor={theme.colors.onBackground}
          mode="contained"
          onPress={handleSignUp}>
          Avançar
        </Button>
      </ScrollView>
    </SafeAreaView>
  );
};

export default Cadastro;
