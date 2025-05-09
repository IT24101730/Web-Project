package com.toyshop.payment;
import com.toyshop.payment.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
public class ViewPaymentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PaymentService service = new PaymentService();
        List<Payment> payments = service.getAllPayments();

        request.setAttribute("payments", payments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("payments.jsp");
        dispatcher.forward(request, response);
    }
}
