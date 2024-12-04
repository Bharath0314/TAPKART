package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.Category;

public interface CategoryDao {
    
    int addCategory(Category category);
    Category getCategory(int categoryId);
    void updateCategory(Category category);
    int deleteCategory(int categoryId);
    List<Category> getAllCategories();
}
