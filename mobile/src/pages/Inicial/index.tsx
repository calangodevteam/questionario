import {styles} from './styles';
import {Text, TouchableRipple, useTheme} from 'react-native-paper';
import {Image, View} from 'react-native';

const Inicial = ({navigation}: any) => {
  return (
    <TouchableRipple
      style={[styles.container]}
      onPress={() => navigation.navigate('login')}
      rippleColor="rgba(202, 202, 202, 0.01)">
      <View style={[styles.view]}>
        <Text>CALANGO </Text>
        <Image style={[styles.image]} source={require('../../assets/logo300.png')} />
        <Text>versão 0.0.0.1</Text>
      </View>
    </TouchableRipple>
  );
};

export default Inicial;
