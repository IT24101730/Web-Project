package com.ToyShop.Controller;
import com.ToyShop.Model.Payment;
import com.ToyShop.Model.User;
import com.ToyShop.dao.PaymentManager;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
@WebServlet("/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || user.isAdmin()) {
            response.sendRedirect("login.jsp");
            return;
        }

        PaymentManager paymentManager = new PaymentManager();
        paymentManager.loadFromFile();

        List<Payment> userPayments = new ArrayList<>();
        Payment current = paymentManager.getPaymentList().getHead();
        while (current != null) {
            if (current.getUsername().equalsIgnoreCase(user.getUsername())) {
                userPayments.add(current);
            }
            current = current.next;
        }

        request.setAttribute("orders", userPayments);
    }
}
