import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  containerQuestao: {
    paddingHorizontal:0,
    marginHorizontal:0,
    maxHeight: 680,
    marginVertical:10,
    marginBottom:20,
  },
  scrollView: {
    marginHorizontal:0,
    paddingHorizontal:25,
  },
  imageView: {
    flexDirection: 'row',
    flexWrap:'wrap', 
    alignItems: 'center', 
    justifyContent:'center',
    padding:10,
  },
  image: {
    height: 140, 
    width: 140, 
    borderRadius:30
  },
  touchImage: {
    margin: 5,
  },
  text: {
    marginVertical:10,
  },
  imageDialogo: {
    width:62, 
    height:62, 
    alignSelf:'center',
  },
  actionContainerDialogo: {
    paddingBottom:30, 
    justifyContent:'center',
  },
  buttonDialogo: {
    paddingHorizontal:15, 
    flexDirection:'row-reverse',
  }
});