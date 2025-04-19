package com.toyshop.auth;
// --- User.java ---
public class User {
    public String username;
    public String password;
    public String email;
    public boolean isAdmin;

    public User(String username, String password, String email, boolean isAdmin) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.isAdmin = isAdmin;
    }
}
