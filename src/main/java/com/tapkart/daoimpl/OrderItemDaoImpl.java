package com.tapkart.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tapkart.dao.OrderItemDao;
import com.tapkart.model.OrderItem;

public class OrderItemDaoImpl implements OrderItemDao {
    static final String INSERT_QUERY = "INSERT into `order_item` (`orderId`, `productId`, `quantity`, `price`) values (?,?,?,?)";
    static final String DELETE_QUERY = "DELETE from `order_item` WHERE `orderItemId` = ?";
    static final String SELECT_QUERY = "SELECT * from `order_item` WHERE `orderItemId` = ?";
    static final String UPDATE_QUERY = "UPDATE `order_item` SET `orderId` = ?, `productId` = ?, `quantity` = ?, `price` = ? WHERE `orderItemId` = ?";
    static final String SELECTALL_QUERY = "SELECT * from `order_item`";

    static Connection connection = null;

    public OrderItemDaoImpl() {
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
    public int addOrderItem(OrderItem orderItem) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(INSERT_QUERY)) {
            pst.setInt(1, orderItem.getOrderId());
            pst.setInt(2, orderItem.getProductId());
            pst.setInt(3, orderItem.getQuantity());
            pst.setDouble(4, orderItem.getPrice());

            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public int deleteOrderItem(int orderItemId) {
        int status = 0;
        try (PreparedStatement pst = connection.prepareStatement(DELETE_QUERY)) {
            pst.setInt(1, orderItemId);
            status = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        OrderItem orderItem = null;
        try (PreparedStatement pst = connection.prepareStatement(SELECT_QUERY)) {
            pst.setInt(1, orderItemId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                orderItem = new OrderItem(rs.getInt("orderItemId"), rs.getInt("orderId"), rs.getInt("productId"),
                        rs.getInt("quantity"), rs.getFloat("price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItem;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        try (PreparedStatement pst = connection.prepareStatement(UPDATE_QUERY)) {
            pst.setInt(1, orderItem.getOrderId());
            pst.setInt(2, orderItem.getProductId());
            pst.setInt(3, orderItem.getQuantity());
            pst.setDouble(4, orderItem.getPrice());
            pst.setInt(5, orderItem.getOrderItemId());

            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> orderItemList = new ArrayList<>();
        try (Statement st = connection.createStatement()) {
            ResultSet rs = st.executeQuery(SELECTALL_QUERY);
            while (rs.next()) {
                OrderItem orderItem = new OrderItem(rs.getInt("orderItemId"), rs.getInt("orderId"), rs.getInt("productId"),
                        rs.getInt("quantity"), rs.getFloat("price"));
                orderItemList.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItemList;
    }

	@Override
	public List<OrderItem> getOrderItemsByProductId(int productId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {
		// TODO Auto-generated method stub
		return null;
	}
}
