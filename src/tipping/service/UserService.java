package tipping.service;

import tipping.entity.User;
import tipping.user.NewUser;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {

    User findByUserName(String userName);

    void save(NewUser newUser);
    
    List<User> getUsers();
}
