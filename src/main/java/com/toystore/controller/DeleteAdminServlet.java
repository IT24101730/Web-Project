package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class DeleteAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        List<User> admins = new UserManager().loadAdminsOnly();
        admins.removeIf(u -> u.getUsername().equals(username));

        PrintWriter writer = new PrintWriter("C:\\Users\\vimu\\Desktop\\NewAdmin\\AdminUser\\src\\main\\resources\\admins.txt");
        for (User u : admins) {
            writer.println(u.getUsername() + "," + u.getPassword() + "," + u.getEmail());
        }
        writer.close();

        response.sendRedirect("AdminDashboardServlet");
    }
}
