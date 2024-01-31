package com.calangodevteam.backquestionario.application.dtos.records;

import com.calangodevteam.backquestionario.domain.models.enums.UserRole;

public record RegisterDTO(String name,String login, String password, UserRole role) {
}
