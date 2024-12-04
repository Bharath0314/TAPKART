package com.tapkart.daoimpl;

import java.util.List;

import com.tapkart.model.Category;
import com.tapkart.model.Product;
import com.tapkart.model.User;

public class Demo {
public static void main(String[] args) {
	UserDaoImpl u=new UserDaoImpl();
	int i=u.addUser(new User("Navi", "navi@gmail.com", "95762", "Tirupati", "navi", "navi", "Customer"));
	System.out.println(i);
}
}
