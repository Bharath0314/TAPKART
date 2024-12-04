package com.tapkart.dao;

import java.util.List;

import com.tapkart.model.OrderHistory;

public interface OrderHistoryDao {
    
    int addOrderHistory(OrderHistory orderHistory);
    OrderHistory getOrderHistory(int historyId);
    void updateOrderHistory(OrderHistory orderHistory);
    int deleteOrderHistory(int historyId);
    List<OrderHistory> getAllOrderHistories();
    List<OrderHistory> getOrderHistoryByOrderId(int orderId);
}
