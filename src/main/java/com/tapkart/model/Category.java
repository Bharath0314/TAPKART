package com.tapkart.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	@Id
	@Column(name="categoryId")
    private int categoryId;
	@Column(name="name")
    private String categoryName;
	@Column(name="description")
    private String categoryDescription;
	@Column(name="imagePath")
    private String imagePath;

    public Category(int categoryId, String categoryName, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryDescription = categoryDescription;
    }
    public Category() {
		// TODO Auto-generated constructor stub
	}
	public Category(int categoryId, String categoryName, String categoryDescription, String imagePath) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.imagePath = imagePath;
	}
	
	public Category(String categoryName, String categoryDescription, String imagePath) {
		super();
		this.categoryName = categoryName;
		this.categoryDescription = categoryDescription;
		this.imagePath = imagePath;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
     
}
