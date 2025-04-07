package com.toystore.service;


import com.toystore.model.Category;
import com.toystore.utils.FileUtils;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {
    private static final String DATA_FILE = "/data/categories.txt";

    public List<Category> getAllCategories() {
        List<Category> categories = FileUtils.readCategoriesFromFile(
                getClass().getResourceAsStream(DATA_FILE));
        if (categories == null) {
            return initializeDefaultCategories();
        }
        return categories;
    }

    public void saveCategory(Category category) {
        List<Category> categories = getAllCategories();
        categories.add(category);
        FileUtils.writeCategoriesToFile(
                getClass().getResource(DATA_FILE).getPath(), categories);
    }

    private List<Category> initializeDefaultCategories() {
        List<Category> defaultCategories = new ArrayList<>();
        defaultCategories.add(new Category("Plush Toys", new String[]{"Teddy Bears", "Bunnies"}));
        defaultCategories.add(new Category("Educational Toys", new String[]{"STEM Kits", "Puzzles"}));
        defaultCategories.add(new Category("Vehicles", new String[]{"Cars", "Trains"}));
        defaultCategories.add(new Category("Outdoor Toys", new String[]{"Bicycles", "Jump Ropes"}));
        defaultCategories.add(new Category("Board Games", new String[]{"Jigsaw Puzzles", "Board Games"}));
        defaultCategories.add(new Category("Toddler Toys", new String[]{"Rattles", "Teething Toys"}));
        return defaultCategories;
    }
}
