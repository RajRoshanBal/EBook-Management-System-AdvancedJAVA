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

		}

		return f;
	}

	public List<BooksDtls> getNewBook() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BooksDtls> getRecentBooks() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where  status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<BooksDtls> getOldBooks() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
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
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

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

		}

		return list;

	}

	// user delete books

	public boolean deleteOldbook(String email, String cat, int id) {
		boolean d = false;

		try {
			String sql = "delete from book_dtls where bookID=? and bookCategory=? and email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(2, cat);
			ps.setString(3, email);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				d = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return d;
	}

	@Override
	public List<BooksDtls> getAllRecentBook() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where  status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BooksDtls> getAllNewBook() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BooksDtls> getAllOldBook() {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = "select * from book_dtls  where bookCategory=? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	@Override
	public List<BooksDtls> getsBookbySearch(String ch) {
		List<BooksDtls> list = new ArrayList<BooksDtls>();
		BooksDtls b = null;
		try {
			String sql = 	"select * from book_dtls where bookname like ? or bookCategory like ? or author like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
