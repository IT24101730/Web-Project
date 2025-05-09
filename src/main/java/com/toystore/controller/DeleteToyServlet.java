package com.ToyShop.Controller;
import com.ToyShop.Model.*;
import com.ToyShop.dao.*;
import com.ToyShop.Controller.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class DeleteToyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        InventoryManager manager = new InventoryManager();
        manager.loadFromFile();

        Toy current = manager.getToyList().getHead();
        Toy prev = null;

        while (current != null) {
            if (current.id.equals(id)) {
                if (prev == null) {
                    manager.getToyList().getHead().id = current.next != null ? current.next.id : null;
                    manager.getToyList().getHead().name = current.next != null ? current.next.name : null;
                    manager.getToyList().getHead().ageGroup = current.next != null ? current.next.ageGroup : 0;
                    manager.getToyList().getHead().price = current.next != null ? current.next.price : 0;
                    manager.getToyList().getHead().imagePath = current.next != null ? current.next.imagePath : null;
                    manager.getToyList().getHead().next = current.next != null ? current.next.next : null;
                } else {
                    prev.next = current.next;
                }
                break;
            }
            prev = current;
            current = current.next;
        }

        manager.saveToFile();
        response.sendRedirect("inventory.jsp");
    }
}

