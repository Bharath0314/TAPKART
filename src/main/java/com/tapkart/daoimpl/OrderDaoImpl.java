package com.tapkart.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tapkart.dao.OrderDao;
import com.tapkart.model.Order;

public class OrderDaoImpl implements OrderDao {
    static final String INSERT_QUERY = "INSERT into `order` (`userId`, `status`) values (?,?)";
    static final String DELETE_QUERY = "DELETE from `order` WHERE `orderId` = ?";
    static final String SELECT_QUERY = "SELECT * from `order` WHERE `orderId` = ?";
    static final String UPDATE_QUERY = "UPDATE `order` SET `userId` = ?, `status` = ? WHERE `orderId` = ?";
    static final String SELECTALL_QUERY = "SELECT * from `order`";

    static Connection connection = null;

    public OrderDaoImpl() {
        String url = "jdbc:mysql://localhost:3306/tapkart";
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
    public int addOrder(Order order) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(INSERT_QUERY)) {
            pst.setInt(1, order.getUserId());
            pst.setString(2, order.getStatus());

            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteOrder(int orderId) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(DELETE_QUERY)) {
            pst.setInt(1, orderId);
            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public Order getOrder(int orderId) {
        Order order = null;
        try (PreparedStatement pst = connection.prepareStatement(SELECT_QUERY)) {
            pst.setInt(1, orderId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                order = new Order(rs.getInt("orderId"), rs.getInt("userId"), rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public void updateOrder(Order order) {
        try (PreparedStatement pst = connection.prepareStatement(UPDATE_QUERY)) {
            pst.setInt(1, order.getUserId());
            pst.setString(2, order.getStatus());
            pst.setInt(3, order.getOrderId());

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> orderList = new ArrayList<>();
        try (Statement st = connection.createStatement()) {
            ResultSet rs = st.executeQuery(SELECTALL_QUERY);
            while (rs.next()) {
                Order order = new Order(rs.getInt("orderId"), rs.getInt("userId"), rs.getString("status"));
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

	@Override
	public List<Order> getOrdersByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
