package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update-user")
public class UpdateUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			us.setId(id);
			
			
			HttpSession session = req.getSession();

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.updateUser(us);
			if (f) {
				session.setAttribute("successMsgus", "Update Successfull..");
				resp.sendRedirect("edit-profile.jsp");
			} else {
				session.setAttribute("FailedMsgus", "Something Wrong On Server..");
				resp.sendRedirect("edit-profile.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
