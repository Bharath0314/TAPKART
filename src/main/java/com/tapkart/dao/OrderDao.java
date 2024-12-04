package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.Order;

public interface OrderDao {
    
    int addOrder(Order order);
    Order getOrder(int orderId);
    void updateOrder(Order order);
    int deleteOrder(int orderId);
    List<Order> getAllOrders();
    List<Order> getOrdersByUserId(int userId);
}
