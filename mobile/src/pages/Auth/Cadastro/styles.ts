import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flex:1,
    paddingHorizontal:0,
    marginHorizontal:0,
  },
  scrollView: {
    marginHorizontal:0,
    paddingHorizontal:40,
  },
  containerImage: {
    alignItems:'center',
    paddingBottom:10,
    marginVertical: 27,
  },
  containerInput: {
    marginHorizontal: 10,
  },
  image:{
    marginBottom:4,
  },
  titleButton: {
    marginVertical:10,
  },
  buttonEsc: {
    flexDirection: 'row-reverse', 
    justifyContent:'space-between', 
    height:50,
},
  button: {
    alignSelf:'center',
    marginTop: 50,
    marginBottom:25,
    width:311,
  },
});
