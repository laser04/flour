package com.flour.web.dto;

import com.flour.web.domain.Users;
import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.List;

@Getter
public class UserAccountDto extends org.springframework.security.core.userdetails.User {

    private Users users;

    public UserAccountDto(Users users) {
        super(users.getUserIdennum(), users.getUserPassword(), List.of(new SimpleGrantedAuthority("ROLE_USER")));
        this.users = users;
    }
}
