package com.toyshop.payment;

public class Payment {
    private String id;
    private String userId;
    private String method;
    private double amount;
    private String date;

    public Payment(String id, String userId, String method, double amount, String date) {
        this.id = id;
        this.userId = userId;
        this.method = method;
        this.amount = amount;
        this.date = date;
    }

    public String getId() { return id; }
    public String getUserId() { return userId; }
    public String getMethod() { return method; }
    public double getAmount() { return amount; }
    public String getDate() { return date; }

    public void setMethod(String method) { this.method = method; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setDate(String date) { this.date = date; }
}

