package com.calangodevteam.backquestionario.domain.repositories;


import com.calangodevteam.backquestionario.domain.models.users.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;

public interface UserRepository extends JpaRepository<User, String> {
    UserDetails findByLogin(String login);
    User findByEmail(String login);
}
