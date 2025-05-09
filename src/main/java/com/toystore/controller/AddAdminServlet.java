package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        UserManager manager = new UserManager();
        if (manager.usernameExists(username)) {
            response.sendRedirect("adminDashboard.jsp?error=exists");
            return;
        }

        User admin = new User(username, password, email, true);
        manager.registerUser(admin);
        response.sendRedirect("AdminDashboardServlet");
    }
}
