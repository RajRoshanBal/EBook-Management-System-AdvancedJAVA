package com.DAO;

import java.util.List;

import com.entity.Order;

public interface OrderDao {
	
	public boolean placedOrder(List<Order> or);
	
	public List<Order> getOrdersByUserId(int uid);
	
	public List<Order> getAllbooks();
}
