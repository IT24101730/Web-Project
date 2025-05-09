package com.ToyShop.Controller;
import com.ToyShop.Model.*;
import com.ToyShop.dao.*;
import com.ToyShop.Controller.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class UpdateToyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int ageGroup = Integer.parseInt(request.getParameter("ageGroup"));
        double price = Double.parseDouble(request.getParameter("price"));
        String imagePath = request.getParameter("imagePath");

        InventoryManager manager = new InventoryManager();
        manager.loadFromFile();

        Toy current = manager.getToyList().getHead();
        while (current != null) {
            if (current.id.equals(id)) {
                current.name = name;
                current.ageGroup = ageGroup;
                current.price = price;
                current.imagePath = imagePath;
                break;
            }
            current = current.next;
        }

        manager.saveToFile();
        response.sendRedirect("inventory.jsp");
    }
}