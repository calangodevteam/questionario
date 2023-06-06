import React, { useState } from 'react';
import { BottomNavigation, useTheme } from 'react-native-paper';
import User from '../pages/User';
import Campanhas from '../pages/Campanhas';
import Ranking from '../pages/Ranking';

const BottomRoutes = () => {

    const [index, setIndex] = useState(0);

    const [routes] = useState([
      { key: 'campanhas',title: 'Campanhas', focusedIcon: 'book-edit-outline', unfocusedIcon: 'book-edit' },
      { key: 'ranking', title: 'Ranking', focusedIcon: 'podium-gold', unfocusedIcon: 'podium' },
      { key: 'user', title: 'Usuário', focusedIcon: 'account-outline', unfocusedIcon: 'account' },
    ]);
  
    const renderScene = BottomNavigation.SceneMap({
      campanhas: Campanhas,
      ranking: Ranking,
      user: User,
    });
  
    return (
        <BottomNavigation
            navigationState={{ index, routes }}
            onIndexChange={setIndex}
            renderScene={renderScene}
            labeled={false}
        />
    );
}

export default BottomRoutes;