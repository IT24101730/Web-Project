package com.ToyShop.Controller;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserManager manager = new UserManager();
        List<User> users = manager.loadUsersOnly();
        List<User> admins = manager.loadAdminsOnly();

        request.setAttribute("users", users);
        request.setAttribute("admins", admins);

        // Make sure this path matches your real JSP location
        request.getRequestDispatcher("adminDashboard.jsp")
                .forward(request, response);
    }
}