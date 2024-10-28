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

@WebServlet("/add-address")
public class AddAddress extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pin=req.getParameter("pin");
			int id=Integer.parseInt(req.getParameter("id"));
			
			User us=new User();
			us.setAddress(address);
			us.setCity(city);
			us.setLandmark(landmark);
			us.setState(state);
			us.setPincode(pin);
			us.setId(id);
			HttpSession session=req.getSession();
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.addAddress(us);
			if(f) {
				session.setAttribute("susmsg", "address added successfully");
				resp.sendRedirect("address.jsp");
			}else {
				session.setAttribute("failmsg", "Server Error");
				resp.sendRedirect("address.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	
	
}
