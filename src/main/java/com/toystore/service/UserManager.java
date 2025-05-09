package com.ToyShop.dao;
// --- UserManager.java ---
import com.ToyShop.Model.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
    private final String userFile = "C:\\Users\\vimu\\Desktop\\OOP Web App 2.0\\ToyStore\\src\\main\\resources\\users.txt";
    private final String adminFile = "C:\\Users\\vimu\\Desktop\\OOP Web App 2.0\\ToyStore\\src\\main\\resources\\admins.txt";

    public List<User> loadAllUsers() {
        List<User> users = new ArrayList<>();
        users.addAll(loadFromFile(userFile, false));
        users.addAll(loadFromFile(adminFile, true));
        return users;
    }

    public List<User> loadUsersOnly() {
        return loadFromFile(userFile, false);
    }

    public List<User> loadAdminsOnly() {
        return loadFromFile(adminFile, true);
    }

    private List<User> loadFromFile(String filePath, boolean isAdmin) {
        List<User> list = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 3) {
                    list.add(new User(parts[0], parts[1], parts[2], isAdmin));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void registerUser(User user) {
        String path = user.isAdmin() ? adminFile : userFile;
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {
            writer.write(user.getUsername() + "," + user.getPassword() + "," + user.getEmail() + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean usernameExists(String username) {
        return loadAllUsers().stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(username));
    }

    public User getUser(String username, String password) {
        return loadAllUsers().stream()
                .filter(u -> u.getUsername().equals(username) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }

    public void saveUsers(List<User> users, boolean isAdmin) {
        String path = isAdmin ? adminFile : userFile;
        try (PrintWriter writer = new PrintWriter(path)) {
            for (User u : users) {
                writer.println(u.getUsername() + "," + u.getPassword() + "," + u.getEmail());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
