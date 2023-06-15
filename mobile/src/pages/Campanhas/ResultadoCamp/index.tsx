import {styles} from './styles';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Button, Card, Text, useTheme} from 'react-native-paper';
import {useNavigation, useRoute} from '@react-navigation/native';
import {Image, View} from 'react-native';
import {useState} from 'react';
import { moedasGanhas } from '../../../utils/Pontuacao';
import { AnimatedCircularProgress } from 'react-native-circular-progress';
import { Resultado } from '../../../@types/@navigation';

const ResultadoCamp = () => {
  const theme = useTheme();
  const navigation = useNavigation();

  const route = useRoute();
  const resultado = route.params as Resultado;
  const [showPercente, setShowPercente] = useState(false)
  const porcento = parseFloat((resultado.acertos/resultado.qtdQuestoes*100).toPrecision(2));

  const aux = () => {
    navigation.navigate('historico_camp');
  };

  const complete = () => setShowPercente(!showPercente);
  const definedColor = () => {
    if(porcento>60)
      return '#7bff00';
    else
      return porcento<40?'#ff0000':'#fae62e'
  }

  return (
    <SafeAreaView style={styles.container}>
      <Card contentStyle={{
        height: 350,
        flexDirection: 'row',
        flexWrap: 'wrap',
      marginTop:30, marginBottom:10}} style={{
      }}
      >
        <Card.Content style={{width:"55%", height:'80%', alignItems: 'center', justifyContent:'center'}} >
            <Text variant='titleSmall'>Seu desempenho</Text>
            <AnimatedCircularProgress
              size={125}
              width={8}
              fill={porcento}
              duration={1000}
              onAnimationComplete={() => complete()}
              tintColor={definedColor()}
              backgroundColor={theme.colors.surfaceVariant} style={{marginVertical:25}}>
              {
                (fill) => (
                  <Text variant='headlineSmall' 
                    style={{
                      color:definedColor(),
                      fontWeight:"900"
                    }}>
                    {showPercente? `${fill}%`: ''}
                  </Text>
                )
              }
            </AnimatedCircularProgress>
            <View style={{flexDirection:'row'}} >
              <Text variant='titleSmall' style={{margin:7}} >Moedas:</Text>
              <Image style={{width:32, height:32}} source={require('../../../assets/dollar32.png')} />
              <Text variant='titleSmall' style={{margin:7}}>{`+${resultado.acertos * moedasGanhas(resultado.dificuldade)}`}</Text>
            </View>
        </Card.Content>
        <Card.Content style={{width:"45%", height:'80%', alignItems: 'flex-end'}}>
          <View >
            <Text variant='titleLarge' style={{marginTop:15}}>Respostas Certas</Text>
            <Text variant='headlineMedium' style={{color:'#7bff00', fontWeight:"900"}}>{resultado.acertos}</Text>
            <Text variant='titleLarge' style={{marginTop:40}}>Respostas Erradas</Text>
            <Text variant='headlineMedium' style={{color:'#ff0000', fontWeight:"900"}}>{resultado.qtdQuestoes-resultado.acertos}</Text>
          </View>
        </Card.Content>
        <Card.Actions style={{width:"100%", height:'20%'}}>
          <Button mode="contained" onPress={aux} icon={'arrow-left-thin'} style={{marginRight:20}}>
            Voltar ao menu
          </Button>
        </Card.Actions>
      </Card>
    </SafeAreaView>
  );
};

export default ResultadoCamp;
