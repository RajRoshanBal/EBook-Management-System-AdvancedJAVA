package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoimpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/Remove_book")
public class RemoveBookCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int cid = Integer.parseInt(req.getParameter("cid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			CartDaoimpl dao = new CartDaoimpl(DBConnect.getConn());
			
			boolean isDeleted = dao.deleteBook(cid, uid);
			HttpSession session = req.getSession();

			if (isDeleted) {
				session.setAttribute("sucMsg", "Book removed from cart.");
				resp.sendRedirect("checkout.jsp");

			} else {
				session.setAttribute("failedMsg", "Something went wrong on the server.");
				resp.sendRedirect("checkout.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
