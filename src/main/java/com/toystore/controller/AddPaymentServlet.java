package com.toyshop.payment;
import com.toyshop.payment.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.time.LocalDate;

public class AddPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String userId = request.getParameter("userId");
        String method = request.getParameter("method");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = LocalDate.now().toString();

        Payment payment = new Payment(id, userId, method, amount, date);
        PaymentService service = new PaymentService();
        service.createPayment(payment);

        response.sendRedirect("payments.jsp");
    }
}
