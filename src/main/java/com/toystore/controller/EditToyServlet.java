package com.ToyShop.Controller;
import com.ToyShop.Model.*;
import com.ToyShop.dao.*;
import com.ToyShop.Controller.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class EditToyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        InventoryManager manager = new InventoryManager();
        manager.loadFromFile();

        Toy current = manager.getToyList().getHead();
        while (current != null) {
            if (current.id.equals(id)) {
                request.setAttribute("toy", current);
                break;
            }
            current = current.next;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("editToy.jsp");
        dispatcher.forward(request, response);
    }
}