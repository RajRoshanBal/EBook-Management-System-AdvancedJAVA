package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			String cat="Old";
			BookDAOimpl b=new BookDAOimpl(DBConnect.getConn());
			boolean f=b.deleteOldbook(email, cat, id);
			
			
			HttpSession session=req.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Delete Successfully..");
				resp.sendRedirect("user-books.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Book is Not Deleted");
				resp.sendRedirect("user-books.jsp");
			}
			
			} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	

}
