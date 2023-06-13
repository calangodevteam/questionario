import React from 'react';
import { Dimensions, Image, View } from 'react-native';

import { styles } from './styles';
import { Modal, Portal, Text, useTheme } from 'react-native-paper';

interface props {
    visible: boolean;
    url:string
    descricao?: string,
    onClose: () => void;
  }

const FullImageModal = ({visible, url, descricao, onClose }:props) => {
    const theme = useTheme();
    const width = Dimensions.get('window').width

  return (
    <Portal>
    <Modal
      visible={visible}
      onDismiss={onClose}
      contentContainerStyle={[{backgroundColor: '#000000'},styles.container]}
  >
      <Image source={{uri:url}} alt={descricao} style={{width: width, height: 300, backgroundColor:'#000000'}} />
    </Modal>
  </Portal>
  );
}

export default FullImageModal;