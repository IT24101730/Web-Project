package com.toystore.controller;


import com.toystore.model.Category;
import com.toystore.service.CategoryService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CategoryController", urlPatterns = {"/categories", "/categories/*"})
public class CategoryController extends HttpServlet {
    private CategoryService categoryService = new CategoryService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null || action.equals("/")) {
            showCategories(request, response);
        } else if (action.equals("/new")) {
            showNewForm(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String subcategories = request.getParameter("subcategories");

        Category category = new Category(name, subcategories.split(","));
        categoryService.saveCategory(category);

        response.sendRedirect(request.getContextPath() + "/categories");
    }

    private void showCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", categoryService.getAllCategories());
        request.getRequestDispatcher("/WEB-INF/views/categories.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/category-form.jsp").forward(request, response);
    }
}