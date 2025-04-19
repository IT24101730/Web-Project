package com.ToyShop.Controller;
import com.ToyShop.dao.UserDAO;
import com.ToyShop.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserDAO.validateLogin(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("user_dashboard.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}





