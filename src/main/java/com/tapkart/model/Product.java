package com.tapkart.model;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product")
public class Product {

	@Id
	@Column(name="productId")
    private int productId;
	@Column(name="name")
    private String name;
	@Column(name="description")
    private String description;
	@Column(name="price")
    private double price;
	@Column(name="stockQuantity")
    private int quantityInStock;
	@Column(name="imagePath")
	private String imagePath;
	@Column(name="categoryId")
	private int categoryId;

    // Default constructor
    public Product() {
    }

    // Parameterized constructor
    public Product(int productId, String name, String description, double price, int quantityInStock,
                   int categoryId, String imagePath) {
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantityInStock = quantityInStock;
        this.categoryId = categoryId;
        this.imagePath = imagePath;
    }

   

	public Product(int productId, String name, double price, int categoryId, String description) {
		super();
		this.productId = productId;
		this.name = name;
		this.price = price;
		this.categoryId = categoryId;
		this.description = description;
	}

	// Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    // Override toString method to print product details
    @Override
    public String toString() {
        return "Product [productId=" + productId + ", name=" + name + ", description=" + description +
               ", price=" + price + ", quantityInStock=" + quantityInStock + ", categoryId=" + categoryId +
               ", imagePath=" + imagePath + "]";
    }
}
