package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoimpl;
import com.DAO.OrderDaoImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int uid = Integer.parseInt(req.getParameter("uid"));
            String uname = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pin");
            String pay = req.getParameter("pay");
            String fadd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

            HttpSession session = req.getSession();

            if ("Select".equals(pay)) {
                session.setAttribute("msg", "Select Payment Type");
                resp.sendRedirect("checkout.jsp");
                return;
            }

            CartDaoimpl cartDao = new CartDaoimpl(DBConnect.getConn());
            List<Cart> cartList = cartDao.getBooKByUser(uid);

            OrderDaoImpl orderDao = new OrderDaoImpl(DBConnect.getConn());
            int orderId = orderDao.getOrderid();
            ArrayList<Order> orderList = new ArrayList<>();

            for (Cart cart : cartList) {
                Order order = new Order();
                order.setOrder_id("BOOK_ORD_" + orderId);
                order.setUid(uid);
                order.setUsername(uname);
                order.setEmail(email);
                order.setPhno(phno);
                order.setBook_name(cart.getBookName());
                order.setAddress(fadd);
                order.setAuthor(cart.getAuthor());
                order.setPrice(String.valueOf(cart.getPrice()));
                order.setPayment_type(pay);
                orderList.add(order);
                orderId++;
            }

        
            boolean isOrderPlaced = orderDao.placedOrder(orderList);
            if (isOrderPlaced) {
            	resp.sendRedirect("conform.jsp");
            } else {
                session.setAttribute("fieldMsg", "Failed to place the order.");
                resp.sendRedirect("checkout.jsp");
            }

            

        } catch (Exception e) {
            e.printStackTrace(); 
            resp.sendRedirect("checkout.jsp");
        }
    }
}
