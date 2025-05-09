package com.ToyShop.Controller;
// --- AddToyServlet.java (with image upload) ---
import com.ToyShop.dao.InventoryManager;


import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;

@MultipartConfig
public class AddToyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int ageGroup = Integer.parseInt(request.getParameter("ageGroup"));
        double price = Double.parseDouble(request.getParameter("price"));
        String category = request.getParameter("category");

        Part filePart = request.getPart("imageFile");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadDir = getServletContext().getRealPath("/images");
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) uploadFolder.mkdirs();

        String imagePath = "images/" + fileName;
        String fullUploadPath = uploadDir + File.separator + fileName;

        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, new File(fullUploadPath).toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        }

        InventoryManager manager = new InventoryManager();
        manager.loadFromFile();
        manager.getToyList().addToy(id, name, ageGroup, price, imagePath, category);
        manager.saveToFile();

        response.sendRedirect("inventory.jsp");
    }
}