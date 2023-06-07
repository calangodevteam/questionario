import {styles} from './styles';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Button, Text } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';

const ResultadoCamp = () => {

  const navigation = useNavigation();

  const aux = () => {
    navigation.navigate('historico_camp');
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text> Resultados Campanhas </Text>
      <Button  mode="contained" onPress={aux}> Voltar </Button>
    </SafeAreaView>
  );
};

export default ResultadoCamp;
