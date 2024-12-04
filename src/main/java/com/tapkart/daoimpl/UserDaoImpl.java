package com.tapkart.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.tapkart.dao.UserDao;
import com.tapkart.model.Category;
import com.tapkart.model.Product;
import com.tapkart.model.User;

import jakarta.persistence.Query;

public class UserDaoImpl implements UserDao {
	 private Session session;
		private Transaction t;

		public UserDaoImpl() {
	    	Configuration cfg = new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(User.class);
			SessionFactory sessionfactory = cfg.buildSessionFactory();
			session = sessionfactory.openSession();
			t=session.beginTransaction();
		}

	public boolean isValidUser(String username, String password) {
		boolean isValid = false;
	    
		Query query = session.createQuery("FROM User  WHERE userName = :username AND password = :password");
		query.setParameter("username", username);
		query.setParameter("password", password);

		// Using getSingleResult() if you expect only one result
		User user = (User) query.getSingleResult();


		    if (user != null) {
		        System.out.println("User found: " + user.getUserName());
		        isValid=true;
		    } else {
		        System.out.println("No user found with the given username and password.");
		    }

		    // Commit the transaction
		    t.commit();
		    
		return isValid;
	}
	@Override
    public User getUserByuserNameAndPassword(String username, String password) {
        User User=new User();
        // Create HQL query to retrieve the user by username and password
	    String hql = "FROM User  WHERE userName = :username AND password = :password";
	    Query query = session.createQuery(hql);
	    query.setParameter("username", username);
	    query.setParameter("password", password);
	    User user = (User) query.getSingleResult();

	    if (user != null) {
	        System.out.println("User found: " + user.getUserName());
                user.setUserId(user.getUserId());
                user.setName(user.getName());
                user.setEmail(user.getEmail());
                user.setPhoneNo(user.getPhoneNo());
                user.setAddress(user.getAddress());
                user.setUserName(user.getUserName());
                user.setPassword(user.getPassword());
            }
	     else {
	        System.out.println("No user found with the given username and password.");
	    }
	    // Commit the transaction
        return user;
    }
	@Override
	public int addUser(User user) {
		int userid=(int)session.save(user);
		t.commit();
		return userid;
	}

	@Override
	public User getUser(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteUser(int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}
    
}
