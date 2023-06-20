import React, {useState} from 'react';
import {styles} from './styles';
import {Text, Button, Avatar, TextInput, HelperText, useTheme} from 'react-native-paper';
import {SafeAreaView} from 'react-native-safe-area-context';
import {ScrollView, View} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { AppTheme } from '../../../@types/theme';

interface esc {
  id:number,
  value: string,
}

const Cadastro = () => {

  const navigation = useNavigation();

  const theme = useTheme<AppTheme>();
  const [instituicao, setInstituicao] = useState<esc>({id:0,value:''});
  const [unidade, setUnidade] = useState<esc>({id:0,value:''});
  const [cep, setCep] = useState<esc>({id:0,value:''});
  const [curso, setCurso] = useState<esc>({id:0,value:''});
  const [modelo, setModelo] = useState<esc>({id:0,value:''});

  const[validacao,setValidacao] = useState(false);

  const validar = () => setValidacao(true);

  const verificaOpVazia = () => {
    return instituicao.id<1 || unidade.id<1 || cep.id<1 || curso.id<1 || modelo.id<1? true:false
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

        <View style={styles.containerInput}>
          <Text variant='labelLarge' style={[styles.titleButton,{color:theme.colors.secondary}]}>Instituição</Text>
          <Button icon="arrow-right"
           mode="elevated" 
           buttonColor={theme.colors.background}
           textColor={instituicao.id<1 && validacao? theme.colors.error:theme.colors.outline}
           contentStyle={styles.buttonEsc}
           style={{borderRadius: theme.roundness, borderColor: theme.colors.elevation.level5}}
           onPress={() => console.log('Pressed')}
           >
            {instituicao.id<1?'Escolha uma Opção...': instituicao.value}
          </Button>
        </View>

        <View style={styles.containerInput}>
          <Text variant='labelLarge' style={[styles.titleButton,{color:theme.colors.secondary}]}>Unidade ou Polo</Text>
          <Button icon="arrow-right"
           mode="elevated" 
           buttonColor={theme.colors.background}
           textColor={unidade.id<1 && validacao? theme.colors.error:theme.colors.outline}
           contentStyle={styles.buttonEsc}
           style={{borderRadius: theme.roundness, borderColor: theme.colors.elevation.level5}}
           onPress={() => console.log('Pressed')}
           >
            {unidade.id<1?'Escolha uma Opção...': unidade.value}
          </Button>
        </View>

        <View style={styles.containerInput}>
          <Text variant='labelLarge' style={[styles.titleButton,{color:theme.colors.secondary}]}>CEP</Text>
          <Button icon="arrow-right"
           mode="elevated" 
           buttonColor={theme.colors.background}
           textColor={cep.id<1 && validacao? theme.colors.error:theme.colors.outline}
           contentStyle={styles.buttonEsc}
           style={{borderRadius: theme.roundness, borderColor: theme.colors.elevation.level5}}
           onPress={() => console.log('Pressed')}
           >
            {cep.id<1?'Insira seu CEP...': cep.value}
          </Button>
        </View>

        <View style={styles.containerInput}>
          <Text variant='labelLarge' style={[styles.titleButton,{color:theme.colors.secondary}]}>Curso</Text>
          <Button icon="arrow-right"
           mode="elevated" 
           buttonColor={theme.colors.background}
           textColor={curso.id<1 && validacao? theme.colors.error:theme.colors.outline}
           contentStyle={styles.buttonEsc}
           style={{borderRadius: theme.roundness, borderColor: theme.colors.elevation.level5}}
           onPress={() => console.log('Pressed')}
           >
            {curso.id<1?'Escolha uma Opção...': curso.value}
          </Button>
        </View>

        <View style={styles.containerInput}>
        <Text variant='labelLarge' style={[styles.titleButton,{color:theme.colors.secondary}]}>Modelo</Text>
          <Button icon="arrow-right"
           mode="elevated" 
           buttonColor={theme.colors.background}
           textColor={modelo.id<1 && validacao? theme.colors.error:theme.colors.outline}
           contentStyle={styles.buttonEsc}
           style={{borderRadius: theme.roundness, borderColor: theme.colors.elevation.level5}}
           onPress={() => console.log('Pressed')}
           >
            {modelo.id<1?'Escolha uma Opção...': modelo.value}
          </Button>
        </View>
        <Button style={styles.button} buttonColor={theme.colors.onBackground} mode="contained" onPress={handleSignUp}>
          Avançar
        </Button>

      </ScrollView>
    </SafeAreaView>
  );
};

export default Cadastro;
