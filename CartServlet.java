package com.ToyShop.Controller;

import com.ToyShop.Model.*;
import com.ToyShop.dao.*;
import com.ToyShop.Controller.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> cartMap = (Map<String, Integer>) session.getAttribute("cartMap");
        if (cartMap == null) cartMap = new HashMap<>();

        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if ("add".equals(action)) {
            cartMap.put(id, cartMap.getOrDefault(id, 0) + 1);
        } else if ("remove".equals(action)) {
            cartMap.remove(id);
        }

        session.setAttribute("cartMap", cartMap);
        response.sendRedirect("cart.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> cartMap = (Map<String, Integer>) session.getAttribute("cartMap");
        if (cartMap == null) cartMap = new HashMap<>();

        for (String id : cartMap.keySet()) {
            String param = request.getParameter("quantity_" + id);
            if (param != null) {
                int qty = Integer.parseInt(param);
                if (qty <= 0) {
                    cartMap.remove(id);
                } else {
                    cartMap.put(id, qty);
                }
            }
        }

        session.setAttribute("cartMap", cartMap);
        response.sendRedirect("cart.jsp");
    }
}