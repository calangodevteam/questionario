import React, { useState } from 'react';
import { View } from 'react-native';

import { styles } from './styles';
import { RadioButton, Text } from 'react-native-paper';
import { Questao } from '../../@types/questao';

interface props {
  questao: Questao,
}

const QuestaoForm = ({questao}: props) => {

  const [value, setValue] = useState('first');
  
  return (
    <View style={styles.container}>
      <Text> Questões Campanhas </Text>
      <RadioButton.Group
        onValueChange={newValue => setValue(newValue)}
        value={value}>
        <View>
          <Text>First</Text>
          <RadioButton value="first" />
        </View>
        <View>
          <Text>Second</Text>
          <RadioButton value="second" />
        </View>
      </RadioButton.Group>
    </View>
  );
}

export default QuestaoForm;