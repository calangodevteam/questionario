package com.calangodevteam.backquestionario.application.controllers;

import com.calangodevteam.backquestionario.application.dtos.records.AuthenticationDTO;
import com.calangodevteam.backquestionario.application.dtos.records.LoginResponseDTO;
import com.calangodevteam.backquestionario.application.dtos.records.RegisterDTO;
import com.calangodevteam.backquestionario.domain.models.users.User;
import com.calangodevteam.backquestionario.domain.repositories.UserRepository;
import com.calangodevteam.backquestionario.infra.security.TokenService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("auth")
public class LoginController {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private UserRepository repository;
    @Autowired
    private TokenService tokenService;

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody @Valid AuthenticationDTO data){


        try{
                var usernamePassword = new UsernamePasswordAuthenticationToken(data.login(), data.password());

                var auth = this.authenticationManager.authenticate(usernamePassword);

                var token = tokenService.generateToken((User) auth.getPrincipal());

                User aux = repository.findByEmail(data.login());

                return ResponseEntity.ok(new LoginResponseDTO(token));

        }catch (Exception e){
             e.printStackTrace();

        }
        return ResponseEntity.badRequest().body("Não foi possivel registrar! , problema na conexão do banco");

    }

    @PostMapping("/register")
    public ResponseEntity register(@RequestBody @Valid RegisterDTO data){
        if(this.repository.findByLogin(data.login()) != null){
            return ResponseEntity.badRequest().body("FALSE");
        }

        String encryptedPassword = new BCryptPasswordEncoder().encode(data.password());
        User newUser = new User(data.login(), data.name(), encryptedPassword, data.role());

        this.repository.save(newUser);

        return ResponseEntity.ok().body("TRUE");
    }
}
