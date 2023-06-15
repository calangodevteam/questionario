import { StyleSheet } from 'react-native';
import CardContent from 'react-native-paper/lib/typescript/src/components/Card/CardContent';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 15,
  },
  cardContainer: {
    height: 410,
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginTop:30, 
    marginBottom:10,
  },
  CardDireitoContainer: {
    width:"55%", 
    height:'80%', 
    alignItems: 'center', 
    justifyContent:'center', 
    paddingTop:30,
  },
  cardEsquerdoContainer: {
    width:"45%", 
    height:'80%', 
    alignItems: 'flex-end',
    paddingRight:25
  },
  cardInferiorContainer: {
    width:"100%", 
    height:'20%',
  },
  viewPoints: {
    flexDirection:'row', 
    marginBottom:10,
  },
  textViewPoint: {
    margin:7,
  },
  imageIcon: {
    width:32, 
    height:32,
  },
  
});