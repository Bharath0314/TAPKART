package com.tapkart.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.tapkart.dao.CategoryDao;
import com.tapkart.model.Category;
import com.tapkart.model.Product;

public class CategoryDaoImpl implements CategoryDao {
    private Session session;
	private Transaction t;

	public CategoryDaoImpl() {
    	Configuration cfg = new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(Category.class);
		SessionFactory sessionfactory = cfg.buildSessionFactory();
		session = sessionfactory.openSession();
		t=session.beginTransaction();
	}
    @Override
    public List<Category> getAllCategories() {
        Query query = session.createQuery("FROM Category",Category.class);
        List<Category> categoryList = query.list();
        return categoryList;
    }

	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Category getCategory(int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCategory(Category category) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteCategory(int categoryId) {
		// TODO Auto-generated method stub
		return 0;
	}
}
