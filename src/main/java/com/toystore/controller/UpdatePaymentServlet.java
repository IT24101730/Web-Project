package com.toyshop.payment;

import com.toyshop.payment.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class UpdatePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String method = request.getParameter("method");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String date = request.getParameter("date");

        Payment updated = new Payment(id, "", method, amount, date); // userId is not changed
        PaymentService service = new PaymentService();
        service.updatePayment(updated);

        response.sendRedirect("payments.jsp");
    }
}
