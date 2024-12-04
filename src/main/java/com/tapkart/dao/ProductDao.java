package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.Product;

public interface ProductDao {
    
    void addProduct(Product product);
    Product getProduct(int productId);
    void updateProduct(Product product);
    int deleteProduct(int productId);
    List<Product> getAllProducts();
    List<Product> getProductByCategory(String category);
	List<Product> getAllProductsByCategoryId(int categoryId);
}
