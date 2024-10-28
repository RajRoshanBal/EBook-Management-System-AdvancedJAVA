package com.DAO;

import java.util.List;

import com.entity.BooksDtls;

public interface BookDAO {

	public boolean addBooks(BooksDtls b);

	public List<BooksDtls> getAllBooks();

	public BooksDtls getBookById(int id);

	public boolean updateEditBooks(BooksDtls b);

	public boolean deleteBooks(int id);

	public List<BooksDtls> getBookbyOld(String email, String cat);

	public boolean deleteOldbook(String email, String cat, int id);

}
