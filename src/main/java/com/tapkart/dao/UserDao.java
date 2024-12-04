package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.User;

public interface UserDao {
    
    int addUser(User user);
    User getUser(int userId);
    void updateUser(User user);
    int deleteUser(int userId);
    List<User> getAllUsers();
    boolean isValidUser(String userName, String password) ;
	User getUserByuserNameAndPassword(String userName, String password);
}
