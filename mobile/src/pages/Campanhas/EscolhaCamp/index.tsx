import {styles} from './styles';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Button, Text } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';

const EscolhaCamp = () => {

  const navigation = useNavigation();

  const aux = () => {
    navigation.navigate('questoes_camp');
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text> Escolhas Campanhas </Text>
      <Button  mode="contained" onPress={aux}> Começar </Button>
    </SafeAreaView>
  );
};

export default EscolhaCamp;
