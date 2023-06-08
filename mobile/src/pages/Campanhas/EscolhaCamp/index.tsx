import {styles} from './styles';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Button, Text, useTheme } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';
import { FlatList, View } from 'react-native';
import { useEffect, useState } from 'react';
import { Questionario } from '../../../utils/Questionario';
import ModalQuestionario from '../../../components/ModalQuestionario';
import ListEmpty from '../../../components/ListEmpty';

const EscolhaCamp = () => {

  const theme = useTheme();
  const navigation = useNavigation();

  const [visible, setVisible] = useState(false);
  const [campanhas, setCampanhas] = useState<any[]>([]);
  const [qtdQUestoes, setQtdQuestoes] = useState(0);

  useEffect(() => {
    setCampanhas(Questionario)
  }, []);
  
  const handleConfirm = () => {
    showModal();
    navigation.navigate('questoes_camp');
  }

  const showModal = () => setVisible(!visible);

  return (
    <SafeAreaView style={styles.container}>
      <Text variant='titleLarge' style={styles.text}>Campanhas Disponiveis para você</Text>
      <FlatList
        showsVerticalScrollIndicator={false}
        data={campanhas}
        keyExtractor={(camp) => camp.id!.toString()}
        ListEmptyComponent={
          <ListEmpty
            title='Não há campanhas no momento.'
            subTitle='Tente voltar mais tarde!' 
            icon={{
              name:'book-open-page-variant-outline', 
              size:110, 
              color:theme.colors.onBackground
            }} 
          />
        }
        renderItem={({ item }) => (
          <Button
          mode="elevated"
          icon="chevron-right"
          contentStyle={{flexDirection: 'row-reverse', justifyContent: 'space-between', height:45}}
          labelStyle={{color: theme.colors.onBackground}}
          style={{marginHorizontal:30, marginVertical:10}}
          onPress={
            () => {
              showModal(); 
              setQtdQuestoes(item.qtdQuestoes);
            }
          }
        > 
        {item.titulo} 
        </Button>
        )}
      />
      <ModalQuestionario 
        visible={visible} 
        qtdQuestoes={qtdQUestoes}
        onClose={() => showModal()}
        navigate={handleConfirm}
      />
    </SafeAreaView>
  );
};

export default EscolhaCamp;
