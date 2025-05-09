package com.toyshop.payment;

import com.toyshop.payment.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class DeletePaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        PaymentService service = new PaymentService();
        service.deletePayment(id);

        response.sendRedirect("payments.jsp");
    }
}
