package com.ToyShop.dao;
import java.io.*;
import com.ToyShop.Model.AgeGroup;

public class AgeManager {
    private final String filePath = "C:\\Users\\vimu\\Desktop\\OOP Web App 2.0\\ToyStore\\src\\main\\resources\\ageGroups.txt";
    private AgeLinkedList ageList = new AgeLinkedList();

    public void loadFromFile() {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    ageList.addAgeGroup(parts[0], parts[1]);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void saveToFile() {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            AgeGroup current = ageList.getHead();
            while (current != null) {
                writer.write(current.getId() + "," + current.getLabel() + "\n");
                current = current.next;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public AgeLinkedList getAgeList() {
        return ageList;
    }
}
