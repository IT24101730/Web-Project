package com.ToyShop.Model;
public class Toy {
    public String id;
    public String name;
    public int ageGroup;
    public double price;
    public String imagePath;
    public String category;
    public Toy next;

    public Toy(String id, String name, int ageGroup, double price, String imagePath, String category) {
        this.id = id;
        this.name = name;
        this.ageGroup = ageGroup;
        this.price = price;
        this.imagePath = imagePath;
        this.category = category;
        this.next = null;
    }
}
