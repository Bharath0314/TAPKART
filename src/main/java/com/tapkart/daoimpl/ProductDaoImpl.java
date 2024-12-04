package com.tapkart.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.tapkart.dao.ProductDao;
import com.tapkart.model.Product;

public class ProductDaoImpl implements ProductDao {

	private Session session;
	private Transaction t;

	public ProductDaoImpl() {
		Configuration cfg = new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(Product.class);
		SessionFactory sessionfactory = cfg.buildSessionFactory();
		session = sessionfactory.openSession();
		t=session.beginTransaction();
	}
	@Override
	public void addProduct(Product product) {
		session.persist(product);
		t.commit();
	}

	@Override
	public Product getProduct(int productId) {
		Product p=session.get(Product.class, productId);
		return p;
	}
	@Override
	public List<Product> getAllProductsByCategoryId(int cId) {
	    Query<Product> query = session.createQuery("from Product where categoryId = :cId", Product.class);
	    query.setParameter("cId", cId);
	    List<Product> products = query.list();
	    return products;
	}


	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteProduct(int productId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Product> getAllProducts() {
		Query<Product> query = session.createQuery("from Product");
		List<Product> products = query.list();
		return products;
	}

	@Override
	public List<Product> getProductByCategory(String category) {
		// TODO Auto-generated method stub
		return null;
	}
    
}
