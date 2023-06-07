import React, {useState} from 'react';
import {styles} from './styles';
import {Text, Button, Avatar, TextInput, HelperText, useTheme} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {ScrollView, View} from 'react-native';
import { useNavigation } from '@react-navigation/native';

const Cadastro = () => {

  const navigation = useNavigation();

  const theme = useTheme();
  const [instituicao, setInstituicao] = useState('');
  const [unidade, setUnidade] = useState('');
  const [cep, setCep] = useState('');
  const [curso, setCurso] = useState('');
  const [modelo, setModelo] = useState('');

  const handleSignUp = () => {
    navigation.navigate('app');
  };

  const erroInstituicao = () => {
    return instituicao.length < 2 && instituicao != '' ? true : false;
  };
  const erroUnidade = () => {
    return unidade.length < 2 && unidade != '' ? true : false;
  };
  const erroCep = () => {
    return cep.length < 2 && cep != '' ? true : false;
  };
  const erroCurso = () => {
    return curso.length < 2 && curso != '' ? true : false;
  };
  const erroModelo = () => {
    return modelo.length < 2 && modelo != '' ? true : false;
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

        <View style={styles.containerInput}>
            <TextInput  
              mode="outlined"
              outlineStyle={{borderRadius: theme.roundness, elevation: 3, borderColor: theme.colors.elevation.level5}}
              label="Instituição"
              placeholder="Insira sua instituição"
              error={erroInstituicao()}
              value={instituicao}
              onChangeText={setInstituicao}
            />
            <HelperText type="error" padding='none' visible={erroInstituicao()}>
            Instituição invalida!
          </HelperText>
        </View>

        <View style={styles.containerInput}>
            <TextInput
              mode="outlined"
              outlineStyle={{borderRadius: theme.roundness, elevation: 3, borderColor: theme.colors.elevation.level5}}
              label="Unidade ou Polo"
              placeholder="Insira a sua unidade ou polo"
              error={erroUnidade()}
              value={unidade}
              onChangeText={setUnidade}
            />
            <HelperText type="error" padding='none' visible={erroUnidade()}>
            Unidade ou Polo invalido!
          </HelperText>
        </View>

        <View style={styles.containerInput}>
            <TextInput
              mode="outlined"
              outlineStyle={{borderRadius: theme.roundness, elevation: 3, borderColor: theme.colors.elevation.level5}}
              label="CEP"
              placeholder="Insira seu CEP"
              inputMode="numeric"
              error={erroCep()}
              value={cep}
              onChangeText={setCep}
            />
            <HelperText type="error" padding='none' visible={erroCep()}>
            CEP invalido!
          </HelperText>
        </View>

        <View style={styles.containerInput}>
            <TextInput
              mode="outlined"
              outlineStyle={{borderRadius: theme.roundness, elevation: 3, borderColor: theme.colors.elevation.level5}}
              label="Curso"
              placeholder="Insira seu curso"
              error={erroCurso()}
              value={curso}
              onChangeText={setCurso}
            />
            <HelperText type="error" padding='none' visible={erroCurso()}>
              Curso invalido!
          </HelperText>
        </View>

        <View style={styles.containerInput}>
            <TextInput
              mode="outlined"
              outlineStyle={{borderRadius: theme.roundness, elevation: 3, borderColor: theme.colors.elevation.level5}}
              label="Modelo"
              placeholder="Insira o modelo que está cursando"
              error={erroModelo()}
              value={modelo}
              onChangeText={setModelo}
            />
            <HelperText type="error" padding='none' visible={erroModelo()}>
              Modelo invalido!
          </HelperText>
        </View>

        <Button style={styles.button} buttonColor={theme.colors.onBackground} mode="contained" onPress={handleSignUp}>
          Avançar
        </Button>

      </ScrollView>
    </SafeAreaView>
  );
};

export default Cadastro;
