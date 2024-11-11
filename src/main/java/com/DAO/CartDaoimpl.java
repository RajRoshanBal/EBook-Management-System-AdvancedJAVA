package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BooksDtls;
import com.entity.Cart;
import com.entity.Order;

public class CartDaoimpl implements CartDao {
	private Connection conn;

	public CartDaoimpl(Connection conn) {
		this.conn = conn;
	}

	public CartDaoimpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean addCartDao(Cart c) {
		boolean f = false;
		try {
			String sql = "INSERT INTO cart(bid, uid, bookName, author, price, total_price) VALUES(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUserid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice()); // Ensure price is a String in Cart class; else use ps.setDouble if numeric.
			ps.setDouble(6, c.getTotalPrice()); // Same as above.

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getBooKByUser(int userId) {
		List<Cart> list = new ArrayList<>();
		Cart c = null;
		double totalPrice = 0;
		try {
			String sql = "select*from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(1));
				c.setUserid(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteBook(int cid, int uid) {
		boolean f = false;

		try {
			String sql = "delete from cart where cid=? and uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.setInt(2, uid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;

			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return f;
	}

	
}
