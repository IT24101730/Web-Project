package com.toystore.utils;


import com.toystore.model.Category;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtils {
    public static List<Category> readCategoriesFromFile(InputStream inputStream) {
        List<Category> categories = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length >= 2) {
                    String name = parts[0];
                    String[] subcategories = parts[1].split(",");
                    categories.add(new Category(name, subcategories));
                }
            }
        } catch (IOException e) {
            return null;
        }
        return categories;
    }

    public static void writeCategoriesToFile(String filePath, List<Category> categories) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Category category : categories) {
                String line = category.getName() + "|" +
                        String.join(",", category.getSubcategories());
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}