package com.DAO;

import com.entity.User;

public interface UserDAO {

		public boolean userRegister(User us);
		
		public User login(String email,String password);
		
		public boolean updateUser(User us);
		
		public boolean checkUserExists(String email, String phno);
		
		public boolean addAddress(User us);
}
