package com.toystore.model;

import java.io.Serializable;

public class Category implements Serializable {
    private String name;
    private String[] subcategories;

    public Category() {}

    public Category(String name, String[] subcategories) {
        this.name = name;
        this.subcategories = subcategories;
    }

    public String getName() {
        return name; }
    public void setName(String name) {
        this.name = name; }
    public String[] getSubcategories() {
        return subcategories; }
    public void setSubcategories(String[] subcategories) {
        this.subcategories = subcategories; }
}