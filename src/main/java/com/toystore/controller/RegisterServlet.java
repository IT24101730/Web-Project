package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import javax.servlet.http.*;
import java.io.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        UserManager manager = new UserManager();
        if (manager.usernameExists(username)) {
            response.sendRedirect("register.jsp?error=exists");
            return;
        }

        User user = new User(username, password, email, false);
        manager.registerUser(user);
        response.sendRedirect("login.jsp?register=success");
    }
}
