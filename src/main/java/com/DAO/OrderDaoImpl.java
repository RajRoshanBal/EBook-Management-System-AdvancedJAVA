package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BooksDtls;
import com.entity.Order;

public class OrderDaoImpl implements OrderDao {

	private Connection conn;

	public OrderDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public int getOrderid() {
		int i = 1;
		try {
			String sql = "SELECT * FROM `order`";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean placedOrder(List<Order> orderList) {
		boolean isOrderPlaced = false;
		String sql = "INSERT INTO `order` (order_id, uid, uname, phno, email, bname, author, address, paytype, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Order order : orderList) {
				ps.setString(1, order.getOrder_id());
				ps.setInt(2, order.getUid());
				ps.setString(3, order.getUsername());
				ps.setString(4, order.getPhno());
				ps.setString(5, order.getEmail());
				ps.setString(6, order.getBook_name());
				ps.setString(7, order.getAuthor());
				ps.setString(8, order.getAddress());
				ps.setString(9, order.getPayment_type());
				ps.setString(10, order.getPrice());

				ps.addBatch();
			}

			int[] results = ps.executeBatch();
			conn.commit();

			isOrderPlaced = results.length == orderList.size();

		} catch (Exception e) {
			e.printStackTrace();

			try {
				conn.rollback();
			} catch (Exception rollbackEx) {
				rollbackEx.printStackTrace();
			}

		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (Exception autoCommitEx) {
				autoCommitEx.printStackTrace();
			}
		}

		return isOrderPlaced;
	}

	@Override
	public List<Order> getOrdersByUserId(int uid) {
		List<Order> orderList = new ArrayList<>();

		try {
			String sql = "select * from `order` where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getString("order_id"));
				order.setUid(rs.getInt("uid"));
				order.setUsername(rs.getString("uname"));
				order.setPhno(rs.getString("phno"));
				order.setEmail(rs.getString("email"));
				order.setBook_name(rs.getString("bname"));
				order.setAuthor(rs.getString("author"));
				order.setAddress(rs.getString("address"));
				order.setPayment_type(rs.getString("paytype"));
				order.setPrice(rs.getString("price"));

				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderList;
	}

	@Override
	public List<Order> getAllbooks() {
		List<Order> orderList = new ArrayList<>();

		try {
			String sql = "select * from `order` ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getString("order_id"));
				order.setUid(rs.getInt("uid"));
				order.setUsername(rs.getString("uname"));
				order.setPhno(rs.getString("phno"));
				order.setEmail(rs.getString("email"));
				order.setBook_name(rs.getString("bname"));
				order.setAuthor(rs.getString("author"));
				order.setAddress(rs.getString("address"));
				order.setPayment_type(rs.getString("paytype"));
				order.setPrice(rs.getString("price"));

				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderList;
	}

}
