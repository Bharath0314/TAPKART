package com.tapkart.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tapkart.dao.OrderHistoryDao;
import com.tapkart.model.OrderHistory;

public class OrderHistoryDaoImpl implements OrderHistoryDao {
    static final String INSERT_QUERY = "INSERT into `order_history` (`orderId`, `status`) values (?,?)";
    static final String DELETE_QUERY = "DELETE from `order_history` WHERE `historyId` = ?";
    static final String SELECT_QUERY = "SELECT * from `order_history` WHERE `historyId` = ?";
    static final String UPDATE_QUERY = "UPDATE `order_history` SET `orderId` = ?, `status` = ? WHERE `historyId` = ?";
    static final String SELECTALL_QUERY = "SELECT * from `order_history`";

    static Connection connection = null;

    public OrderHistoryDaoImpl() {
        String url = "jdbc:mysql://localhost:3306/tapfoods";
        String username = "root";
        String password = "root";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int addOrderHistory(OrderHistory orderHistory) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(INSERT_QUERY)) {
            pst.setInt(1, orderHistory.getOrderId());
            pst.setString(2, orderHistory.getStatus());

            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteOrderHistory(int historyId) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(DELETE_QUERY)) {
            pst.setInt(1, historyId);
            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public OrderHistory getOrderHistory(int historyId) {
        OrderHistory orderHistory = null;
        try (PreparedStatement pst = connection.prepareStatement(SELECT_QUERY)) {
            pst.setInt(1, historyId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                orderHistory = new OrderHistory(rs.getInt("historyId"), rs.getInt("orderId"), rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistory;
    }

    @Override
    public void updateOrderHistory(OrderHistory orderHistory) {
        try (PreparedStatement pst = connection.prepareStatement(UPDATE_QUERY)) {
            pst.setInt(1, orderHistory.getOrderId());
            pst.setString(2, orderHistory.getStatus());
            pst.setInt(3, orderHistory.getHistoryId());

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderHistory> getAllOrderHistories() {
        List<OrderHistory> orderHistoryList = new ArrayList<>();
        try (Statement st = connection.createStatement()) {
            ResultSet rs = st.executeQuery(SELECTALL_QUERY);
            while (rs.next()) {
                OrderHistory orderHistory = new OrderHistory(rs.getInt("historyId"), rs.getInt("orderId"), rs.getString("status"));
                orderHistoryList.add(orderHistory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderHistoryList;
    }

	@Override
	public List<OrderHistory> getOrderHistoryByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}
}
