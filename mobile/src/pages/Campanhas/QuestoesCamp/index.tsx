import {styles} from './styles';
import {SafeAreaView} from 'react-native-safe-area-context';
import {
  Button,
  Card,
  IconButton,
  List,
  ProgressBar,
  RadioButton,
  Text,
  ToggleButton,
  TouchableRipple,
  useTheme,
} from 'react-native-paper';
import {useNavigation, useRoute} from '@react-navigation/native';
import {Questionario} from '../../../@types/questionario';
import {useEffect, useState} from 'react';
import {Image, ScrollView, View} from 'react-native';
import {Figura, Questao} from '../../../@types/questao';
import QuestaoOpcao from '../../../components/QuestaoOpcao';
import QuestaoArtigo from '../../../components/QuestaoArtigo';

const QuestoesCamp = () => {

  const theme = useTheme();
  const navigation = useNavigation();

  const route = useRoute();
  const questionario = route.params as Questionario;

  const [index, setIndex] = useState(0);

  const [acertos, setAcertos] = useState(0);

  const [questAtual, setQuestAtual] = useState<Questao>(questionario.questoes[index]);

  const [valueOption, setValueOption] = useState(questAtual.opcoes[0].id.toString());

  useEffect(() => {
    setQuestAtual(questionario.questoes[index]);
  }, [index]);

  useEffect(() => {
    setValueOption(questAtual.opcoes[0].id.toString());
  }, [questAtual]);

  const  handleValidateResponse = () => {
    if(questAtual.opcaoCorreta.id.toString() == valueOption) {
      setAcertos(acertos+1);
    }
  }
  const handleResponse = () => index == questionario.questoes.length - 1? (
    navigation.navigate(
      'resultado_camp', 
      {
        acertos:acertos,
        dificuldade:questionario.dificuldade,
        qtdQuestoes:questionario.qtdQuestoes,
      })
  ): setIndex(index + 1);

  return (
    <SafeAreaView style={styles.container}>
      <ProgressBar
        key={`progress1`}
        animatedValue={index / (questionario.questoes.length - 1)}
        color={theme.colors.primary}
        style={{height: 10}}
      />
      <View style={styles.containerQuestao}>
        <ScrollView
          style={styles.scrollView}
          showsVerticalScrollIndicator={true}
          keyboardDismissMode="none">
          <Text variant="titleMedium" style={styles.text}>
            {questAtual!.texto}
          </Text>

          <View
            style ={styles.imageView}
          >
            {questAtual.figuras.map((fig) =>(
              <TouchableRipple
                key={`touch${fig.id}`} 
                style={styles.touchImage}
                background={{color:"rgba(0, 0, 0, .30)"}}
                onPress={() => {console.log('clicou')}}
              >
              <Image key={`fig${fig.id}`} style={styles.image} source={{ uri: fig.atributo }} />
              </TouchableRipple>
            ))}
          </View>

          {questAtual.artigos.length > 0 ? (
            <List.Section
              id="art"
              style={[
                {borderColor: theme.colors.elevation.level5, borderWidth: 1},
              ]}>
              <List.Subheader style={{fontWeight: '800', fontSize: 16}}>
                Artigos
              </List.Subheader>
              {questAtual.artigos.map(art => (
                <QuestaoArtigo key={`art${art.id}`} artigo={art} />
              ))}
            </List.Section>
          ) : null}

          <RadioButton.Group
            onValueChange={newValue => setValueOption(newValue)}
            value={valueOption}>
            {questAtual.opcoes.map(op => (
              <QuestaoOpcao key={`op${op.id}`} opcao={op} />
            ))}
          </RadioButton.Group>
        </ScrollView>
      </View>
      <Button mode="contained" onPress={() => {handleValidateResponse(); handleResponse()}}>
        {questionario.questoes.length != 1 && index != questionario.questoes.length - 1 ? 'Proxima': 'Finalizar'}
      </Button>
    </SafeAreaView>
  );
};

export default QuestoesCamp;
