package com.ToyShop.Model;
public class ToyLinkedList {
    private Toy head;

    public void addToy(String id, String name, int ageGroup, double price, String imagePath , String Category) {
        Toy newToy = new Toy(id, name, ageGroup, price, imagePath, Category);
        if (head == null) {
            head = newToy;
        } else {
            Toy current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newToy;
        }
    }

    public void sortByAgeGroup() {
        for (Toy i = head; i != null; i = i.next) {
            Toy min = i;
            for (Toy j = i.next; j != null; j = j.next) {
                if (j.ageGroup < min.ageGroup) {
                    min = j;
                }
            }
            if (min != i) {
                String tempId = i.id, tempName = i.name, tempImage = i.imagePath , tempCategory = i.category;
                int tempAge = i.ageGroup;
                double tempPrice = i.price;

                i.id = min.id;
                i.name = min.name;
                i.ageGroup = min.ageGroup;
                i.price = min.price;
                i.imagePath = min.imagePath;
                i.category = min.category;

                min.id = tempId;
                min.name = tempName;
                min.ageGroup = tempAge;
                min.price = tempPrice;
                min.imagePath = tempImage;
                min.category = tempCategory;
            }
        }
    }

    public Toy getHead() {
        return head;
    }
}
