import React, {useEffect, useState} from 'react';
import {styles} from './styles';
import {AnimatedFAB, Text} from 'react-native-paper';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useNavigation } from '@react-navigation/native';

const HistoricoCamp = () => {

  const navigation = useNavigation();

  const [isExtended, setIsExtended] = useState(false);

  useEffect(() => {
    setIsExtended(!isExtended);
  }, []);

  const handleCampanha = () => {
    navigation.navigate('escolha_camp');
  }

  return (
    <SafeAreaView style={styles.container}>
      <Text> Campanhas </Text>
      <AnimatedFAB
        variant='primary'
        icon={'plus'}
        label={'Iniciar Campanha'}
        extended={isExtended}
        onPress={handleCampanha}
        animateFrom={'right'}
        iconMode={'dynamic'}
        style={styles.fab}
      />
    </SafeAreaView>
  );
};

export default HistoricoCamp;
