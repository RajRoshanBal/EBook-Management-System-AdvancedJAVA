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

        // Retrieve the user object from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userobj");
        
        if (user == null) {
            // Redirect to login if user is not logged in
            resp.sendRedirect("login.jsp");
            return;
        }

        // Retrieve the book ID from the request parameter
        String bidStr = req.getParameter("bid");
        String uidstr=req.getParameter("uid");

        // Check for invalid or missing bid parameter
        if (bidStr == null || bidStr.isEmpty()) {
            session.setAttribute("failedMsg", "Invalid book ID.");
            resp.sendRedirect("checkout.jsp");
            return;
        }

        try {
            // Parse the book ID to integer
            int bid = Integer.parseInt(bidStr);
            int uid = Integer.parseInt(uidstr) ;

            CartDaoimpl dao = new CartDaoimpl(DBConnect.getConn());
            boolean f = dao.deleteBook(bid, uid);
            
            // Set success or failure message in session
            if (f) {
                session.setAttribute("sucMsg", "Book removed from cart.");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on the server.");
            }
            resp.sendRedirect("checkout.jsp");

        } catch (NumberFormatException e) {
            // Handle invalid number format for the book ID
            session.setAttribute("failedMsg", "Invalid book ID.");
            resp.sendRedirect("checkout.jsp");
        }
    }
}
