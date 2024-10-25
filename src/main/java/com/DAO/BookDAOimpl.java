package com.DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.BooksDtls;

public class BookDAOimpl implements BookDAO {

	
	








	private Connection conn;
	
	public BookDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	public boolean addBooks(BooksDtls b) {
		
		boolean f=false;
		try {
			String sql= "insert into book_dtls(bookname,author, price ,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());           
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());
            int i=ps.executeUpdate();
            if(i==1) {
            	f=true;
            }
		} catch (Exception e) {
			
		}
		return f;
	}
	
	public List<BooksDtls> getALLBooks() {
		
		List<BooksDtls> list=new ArrayList<BooksDtls>();
		BooksDtls b=null;
		
		
		
		try {
			String sql="select * from book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);

			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			   
				b=new BooksDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	
		return list;
		
	}
	

	public BooksDtls getBookById(int id) {
		
		
		BooksDtls b=null;
		try {
		String sql="select * from book_dtls where bookID =? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs=ps.executeQuery();
		while(rs.next())

			
		b=new BooksDtls();	
		b.setBookId(rs.getInt(1));
		b.setBookName(rs.getString(2));
		b.setAuthor(rs.getString(3));
		b.setPrice(rs.getString(4));
		b.setBookCategory(rs.getString(5));
		b.setStatus(rs.getString(6));
		b.setPhotoName(rs.getString(7));
		b.setEmail(rs.getString(8));

		} catch (Exception e) {
		e.printStackTrace();
	}
   return b;
   
		
	}


	public boolean updateEditBooks(BookDtls b) {
		
		boolean f=false;
		
		try {
			String sql="update book_dtls set bookname =? , author =? ,price =? , status =? whwre bookId =? ";
			PreparedStatement ps=conn. prepareStatement(sql);
			
		ps.setString(1, b.getBookName());
		ps.setString(2, b.getAuthor());
		ps.setString(3, b.getPrice());
		ps.setString(4, b.getStatus());
		
		
		
		ps.setString(5, b.getBookName());
		
		int i=ps.executeUpdate();
		if(i==1) {
			
			f=true;
		}
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return f ;
	}
	
	public boolean deleteBooks(int id) {
		boolean f=false;
		try {
			String sql="delet from book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		return false;
	}

	


	@Override
	public List<BooksDtls> getAllBooks() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean updateEditBooks(BooksDtls b) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
