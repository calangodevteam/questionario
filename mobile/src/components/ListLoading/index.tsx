import React from 'react';
import { View } from 'react-native';
import { styles } from './styles';
import { ActivityIndicator } from 'react-native-paper';

interface props {
    loading: boolean,
    size:'small' | 'large' | number,
    color:string,
}

const ListLoading = ({loading, size, color}:props) => {
    return <ActivityIndicator size={size} color={color} hidesWhenStopped={true} animating={loading} style={{marginTop:15}} />;
}
export default ListLoading;