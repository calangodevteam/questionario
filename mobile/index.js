/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';

import { PaperProvider } from 'react-native-paper';
import { defaultTheme } from './src/theme/Theme';

const Main = () => {
  return (
    <PaperProvider theme={defaultTheme}>
      <App />
    </PaperProvider>
  );
}
export default Main;

AppRegistry.registerComponent(appName, () => App);
