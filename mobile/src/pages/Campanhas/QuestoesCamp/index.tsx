import {styles} from './styles';
import {SafeAreaView} from 'react-native-safe-area-context';
import {Button, RadioButton, Text} from 'react-native-paper';
import {useNavigation, useRoute} from '@react-navigation/native';
import {Questionario} from '../../../@types/questionario';
import {useState} from 'react';
import {View} from 'react-native';
import QuestaoForm from '../../../components/QuestaoForm';

const QuestoesCamp = () => {
  const navigation = useNavigation();
  const route = useRoute();
  const questionario = route.params as Questionario;

  const [value, setValue] = useState('');

  const aux = () => {
    console.log(questionario);
    navigation.navigate('resultado_camp');
  };

  return (
    <SafeAreaView style={styles.container}>
      <QuestaoForm questao={questionario.questoes[0]}/>
      <Button mode="contained" onPress={aux}>
        Finalizar
      </Button>
    </SafeAreaView>
  );
};

export default QuestoesCamp;
