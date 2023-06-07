import {styles} from './styles';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Button, Text } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';

const QuestoesCamp = () => {

  const navigation = useNavigation();

  const aux = () => {
    navigation.navigate('resultado_camp');
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text> Questões Campanhas </Text>
      <Button  mode="contained" onPress={aux}> Finalizar </Button>
    </SafeAreaView>
  );
};

export default QuestoesCamp;
