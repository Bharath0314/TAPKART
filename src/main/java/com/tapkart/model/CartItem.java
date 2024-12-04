package com.tapkart.model;

public class CartItem {

	private int productId;
	private int categoryId;
	private String name;
	private int quantity;
	private double price;
	private String imagePath;

	public CartItem() {

	}

	public CartItem(int productId, int categoryId, String name, int quantity, double price) {
		super();
		this.productId = productId;
		this.categoryId = categoryId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}
	
	public CartItem(int productId, int categoryId, String name, int quantity, double price, String imagePath) {
		super();
		this.productId = productId;
		this.categoryId = categoryId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.imagePath = imagePath;
	}

	public CartItem(int categoryId, String name, int quantity, double price) {
		super();
		this.categoryId = categoryId;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	

}