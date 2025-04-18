package com.ToyShop.Controller;
import com.ToyShop.dao.UserDAO;
import com.ToyShop.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/manageAdmins")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> allUsers = UserDAO.getAllUsers();
        List<User> adminUsers = allUsers.stream()
                .filter(user -> "admin".equals(user.getRole()))
                .collect(Collectors.toList());

        request.setAttribute("admins", adminUsers);
        request.getRequestDispatcher("/admin/manage_admins.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (UserDAO.usernameExists(username)) {
                request.setAttribute("error", "Username already exists");
                doGet(request, response);
            } else {
                User newAdmin = new User(username, password, "admin");
                UserDAO.saveUser(newAdmin);
                response.sendRedirect("manageAdmins");
            }
        }
    }
}



