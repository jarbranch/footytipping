package tipping.dao;

import java.util.List;

import tipping.entity.User;

public interface UserDao {

    User findByUserName(String userName);
    
    void save(User user);
    
    List<User> getUsers();
    
}
