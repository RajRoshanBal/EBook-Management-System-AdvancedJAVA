package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;
	
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	
	//register
	@Override
	public boolean userRegister(User us) {
		boolean f=false;
		
		
		try {
			String sql="insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	

	//login
	@Override
	public User login(String email, String password) {
		User us=null;
		
		
		try {
			String sql="select *from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return us;
	}
	
	

	//update user
	@Override
	public boolean updateUser(User us) {
		boolean f=false;
		try {
			
			String sql="update user set name=?,email=?,phno=?,password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			ps.setInt(5, us.getId());
			 int i=ps.executeUpdate();
			 if(i==1) {
				 f=true;
			 }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}



	//check user exisance
	@Override
	public boolean checkUserExists(String email, String phno) {
		 boolean exists = false;
		    try {
		        String sql = "SELECT * FROM user WHERE email = ? OR phno = ?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, email);
		        ps.setString(2, phno);

		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		           
		            exists = true;
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 

		    return exists;
	}


	//add address
	@Override
	public boolean addAddress(User us) {
		boolean f=false;
		try {
			String sql="Update user set address=?,landmark=?,city=?,state=?,pincode=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getAddress());
			ps.setString(2,us.getLandmark());
			ps.setString(3,us.getCity());
			ps.setString(4,us.getState());
			ps.setString(5,us.getPincode());
			ps.setInt(6, us.getId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
}
