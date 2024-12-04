package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.OrderItem;

public interface OrderItemDao {
    
    int addOrderItem(OrderItem orderItem);
    OrderItem getOrderItem(int orderItemId);
    void updateOrderItem(OrderItem orderItem);
    int deleteOrderItem(int orderItemId);
    List<OrderItem> getAllOrderItems();
    List<OrderItem> getOrderItemsByOrderId(int orderId);
    List<OrderItem> getOrderItemsByProductId(int productId);
}
