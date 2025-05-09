package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;

import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class DeleteAccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        List<User> users = currentUser.isAdmin() ? new UserManager().loadAdminsOnly() : new UserManager().loadUsersOnly();
        users.removeIf(u -> u.getUsername().equals(currentUser.getUsername()));

        PrintWriter writer = new PrintWriter(currentUser.isAdmin() ? "C:\\Users\\vimu\\Desktop\\NewAdmin\\AdminUser\\src\\main\\resources\\admins.txt" : "C:\\Users\\vimu\\Desktop\\NewAdmin\\AdminUser\\src\\main\\resources\\users.txt");
        for (User u : users) {
            writer.println(u.getUsername() + "," + u.getPassword() + "," + u.getEmail());
        }
        writer.close();

        session.invalidate();
        response.sendRedirect("login.jsp");
    }
}
