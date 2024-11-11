package com.user.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOimpl;
import com.DAO.CartDaoimpl;
import com.DB.DBConnect;
import com.entity.BooksDtls;
import com.entity.Cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));

            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
            BooksDtls b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserid(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            
            // Calculate and set total price (assuming quantity of 1)
            double totalPrice = c.getPrice(); // Modify as needed for quantity
            c.setTotalPrice(totalPrice);

            CartDaoimpl dao2 = new CartDaoimpl(DBConnect.getConn());
            boolean f = dao2.addCartDao(c);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("sucMsg", "Book Added to cart");
                resp.sendRedirect("all_new_book.jsp");
            } else {
                session.setAttribute("faieldMsg", "Book Not Added to cart");
                resp.sendRedirect("all_new_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
