package com.ToyShop.Service;
import com.ToyShop.Model.User;
import com.ToyShop.dao.UserManager;
import java.util.List;

public class UserService {
    private final UserManager manager = new UserManager();

    public boolean registerUser(User user) {
        if (manager.usernameExists(user.getUsername())) {
            return false;
        }
        manager.registerUser(user);
        return true;
    }

    public User authenticate(String username, String password) {
        return manager.getUser(username, password);
    }

    public List<User> getAllUsers() {
        return manager.loadAllUsers();
    }

    public List<User> getUsersOnly() {
        return manager.loadUsersOnly();
    }

    public List<User> getAdminsOnly() {
        return manager.loadAdminsOnly();
    }

    public void deleteUser(String username, boolean isAdmin) {
        List<User> users = isAdmin ? manager.loadAdminsOnly() : manager.loadUsersOnly();
        users.removeIf(u -> u.getUsername().equals(username));
        manager.saveUsers(users, isAdmin);
    }

    public void updateUser(User currentUser, String newEmail, String newPassword) {
        List<User> users = currentUser.isAdmin() ? manager.loadAdminsOnly() : manager.loadUsersOnly();
        for (User u : users) {
            if (u.getUsername().equals(currentUser.getUsername())) {
                u.setEmail(newEmail);
                u.setPassword(newPassword);
                break;
            }
        }
        manager.saveUsers(users, currentUser.isAdmin());
    }
}
