package com.DAO;

import java.util.List;

import com.entity.BooksDtls;
import com.entity.Cart;
import com.entity.Order;

public interface CartDao {
	
	public boolean addCartDao(Cart c);

	public  List<Cart> getBooKByUser(int userId);
	
	public boolean deleteBook(int bid,int uid);
	
	
	
}
