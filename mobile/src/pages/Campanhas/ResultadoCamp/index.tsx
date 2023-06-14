import {styles} from './styles';
import {SafeAreaView} from 'react-native-safe-area-context';
import {ActivityIndicator, Button, Card, ProgressBar, Text, useTheme} from 'react-native-paper';
import {useNavigation, useRoute} from '@react-navigation/native';
import {Resultado} from '../../../@types/questionario';
import {View} from 'react-native';
import { moedasGanhas } from '../../../utils/Pontuacao';

const ResultadoCamp = () => {
  const theme = useTheme();
  const navigation = useNavigation();

  const route = useRoute();
  const resultado = route.params as Resultado;

  const aux = () => {
    navigation.navigate('historico_camp');
  };

  return (
    <SafeAreaView style={styles.container}>
      <Card contentStyle={{
        height: 400,
        flexDirection: 'row',
        flexWrap: 'wrap',
      marginVertical:30,}} style={{
      }}
      >
        <Card.Content style={{backgroundColor: 'red', width:"50%", height:'80%'}} >
          <View >
            <Text>Seu desempenho</Text>
            <Text>{`${resultado.acertos}`}</Text>
            <Text>Moedas</Text>
            <Text>{resultado.acertos * moedasGanhas(resultado.dificuldade)}</Text>
          </View>
        </Card.Content>
        <Card.Content style={{backgroundColor: 'blue', width:"50%", height:'80%'}}>
          <View >
            <Text>Respostas Certas</Text>
            <Text>7</Text>
            <Text>Respostas Erradas</Text>
            <Text>8</Text>
          </View>
        </Card.Content>
        <Card.Actions style={{backgroundColor: 'yellow', width:"100%", height:'20%'}}>
          <Button mode="contained" onPress={aux}>
            Voltar
          </Button>
        </Card.Actions>
      </Card>
    </SafeAreaView>
  );
};

export default ResultadoCamp;
