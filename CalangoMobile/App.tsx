import React, { useCallback, useEffect, useMemo, useState } from 'react';
import { darkTheme, defaultTheme } from './src/theme/Theme';
import { PreferencesContext } from './src/contexts/ThemeContext';
import { PaperProvider } from 'react-native-paper';
import { NavigationContainer } from '@react-navigation/native';
import AuthRoutes from './src/routes/AuthRoutes';
import auth, { FirebaseAuthTypes } from '@react-native-firebase/auth';
import AppRoutes from './src/routes/AppRoutes';
import { Aluno } from './src/@types/aluno';
import { findAlunoByEmail } from './src/services/ApiCalango';

const App = () => {
  const [isThemeDark, setIsThemeDark] = useState(false);

  let theme = isThemeDark ? darkTheme : defaultTheme;

  const [user, setUser] = useState<FirebaseAuthTypes.User | null>(null);
  const [aluno, setAluno] = useState<Aluno | null>(null);

  useEffect(() => {
    auth().onAuthStateChanged(userState => {
      if (userState) {
        findAlunoByEmail(userState.email!).then(alunoResponse => setAluno(alunoResponse));
        setUser(userState);
      } else {
        setUser(null);
      }
    });
  }, []);

  const toggleTheme = useCallback(() => {
    return setIsThemeDark(!isThemeDark);
  }, [isThemeDark]);

  const preferences = useMemo(
    () => ({
      toggleTheme,
      isThemeDark,
    }),
    [toggleTheme, isThemeDark]
  );

  return (
    <PreferencesContext.Provider value={preferences}>
      <PaperProvider theme={theme}>
        <NavigationContainer theme={theme}>
          {user && aluno ? <AppRoutes/> : <AuthRoutes/>}
        </NavigationContainer>
      </PaperProvider>
    </PreferencesContext.Provider>
  );
};

export default App;
