package com.tapkart.model;

import java.time.LocalDateTime;

public class Order {
    private int orderId;
    private int userId;
    private LocalDateTime orderDate;
    private String status;
    private String shippingAddress;
    private double totalAmount;

    public Order(int orderId, int userId, LocalDateTime orderDate, String status, String shippingAddress, double totalAmount) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.status = status;
        this.shippingAddress = shippingAddress;
        this.totalAmount = totalAmount;
    }
    
    public Order(int orderId, int userId, String status) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.status = status;
	}

	public Order() {
        // Default constructor
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
}
