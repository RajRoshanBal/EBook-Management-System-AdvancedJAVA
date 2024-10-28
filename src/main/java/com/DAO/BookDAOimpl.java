package com.DAO;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BooksDtls;

public class BookDAOimpl implements BookDAO {

	private Connection conn;
	
	public BookDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	// admin add book
		public boolean addBooks(BooksDtls b) {

			boolean f = false;
			try {
				String sql = "insert into book_dtls(bookname,author, price ,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, b.getBookName());
				ps.setString(2, b.getAuthor());
				ps.setString(3, b.getPrice());
				ps.setString(4, b.getBookCategory());
				ps.setString(5, b.getStatus());
				ps.setString(6, b.getPhotoName());
				ps.setString(7, b.getEmail());
				int i = ps.executeUpdate();
				if (i == 1) {
					f = true;
				}
			} catch (SQLException e) {

			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return f;
		}

		// admin all book
		public List<BooksDtls> getAllBooks() {
			List<BooksDtls> list = new ArrayList<BooksDtls>();
			BooksDtls b = null;

			try {
				String sql = "select * from book_dtls  ";
				PreparedStatement ps = conn.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					b = new BooksDtls();
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

			} catch (SQLException e) {

				e.printStackTrace();

			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

			return list;
		}

		// admin get book
		public BooksDtls getBookById(int id) {

			BooksDtls b = null;
			try {
				String sql = "select * from book_dtls where bookID =? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					b = new BooksDtls();
					b.setBookId(rs.getInt(1));
					b.setBookName(rs.getString(2));
					b.setAuthor(rs.getString(3));
					b.setPrice(rs.getString(4));
					b.setBookCategory(rs.getString(5));
					b.setStatus(rs.getString(6));
					b.setPhotoName(rs.getString(7));
					b.setEmail(rs.getString(8));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			return b;

		}

		// admin update book
		public boolean updateEditBooks(BooksDtls b) {
			boolean f = false;

			try {
				String sql = "update book_dtls set bookname =? , author =? ,price =? , status =? where bookId =? ";
				PreparedStatement ps = conn.prepareStatement(sql);

				ps.setString(1, b.getBookName());
				ps.setString(2, b.getAuthor());
				ps.setString(3, b.getPrice());
				ps.setString(4, b.getStatus());
				ps.setInt(5, b.getBookID());

				int i = ps.executeUpdate();
				if (i == 1) {

					f = true;
				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

			return f;
		}

		// admin delete book
		public boolean deleteBooks(int id) {
			boolean f = false;
			try {
				String sql = "delete from book_dtls where bookId=?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				int i = ps.executeUpdate();
				if (i == 1) {
					f = true;
				}

			} catch (SQLException e) {
				e.printStackTrace();

			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

			return f;
		}

		// user all book
		public List<BooksDtls> getBookbyOld(String email, String cat) {
			List<BooksDtls> list = new ArrayList<BooksDtls>();
			BooksDtls b = null;

			try {
				String sql = "select * from book_dtls where bookCategory=? and email=? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, cat);
				ps.setString(2, email);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {

					b = new BooksDtls();
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

			} catch (SQLException e) {

				e.printStackTrace();

			} finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}

			return list;

		}
		
		//user delete books
		
		public boolean deleteOldbook(String email, String cat,int id) {
			boolean d=false;
			
			try {
				String sql="delete from book_dtls where bookID=? and bookCategory=? and email=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(2, cat);
				ps.setString(3, email);
				ps.setInt(1, id);
				int i=ps.executeUpdate();
				if(i==1) {
					d=true;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
			
			return d;
		}



	
	
}
