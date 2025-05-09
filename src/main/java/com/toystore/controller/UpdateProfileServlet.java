package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");

        List<User> users = currentUser.isAdmin() ? new UserManager().loadAdminsOnly() : new UserManager().loadUsersOnly();
        for (User u : users) {
            if (u.getUsername().equals(currentUser.getUsername())) {
                u.setEmail(newEmail);
                u.setPassword(newPassword);
                break;
            }
        }

        PrintWriter writer = new PrintWriter(currentUser.isAdmin() ? "C:\\Users\\vimu\\Desktop\\OOP Web App 2.0\\ToyStore\\src\\main\\resources\\admins.txt" : "C:\\Users\\vimu\\Desktop\\OOP Web App 2.0\\ToyStore\\src\\main\\resources\\users.txt");
        for (User u : users) {
            writer.println(u.getUsername() + "," + u.getPassword() + "," + u.getEmail());
        }
        writer.close();

        currentUser.setEmail(newEmail);
        currentUser.setPassword(newPassword);
        session.setAttribute("user", currentUser);

        response.sendRedirect(currentUser.isAdmin() ? "AdminDashboardServlet" : "UserDashboardServlet");

    }
}
