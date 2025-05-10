package com.toyshop.payment;
import java.io.*;
import java.util.*;

public class PaymentManager {
    private final String filePath = "C:\\Users\\vimu\\Desktop\\AgeAndInventory\\Age and Inventory\\Inventory\\src\\main\\resources\\payments.txt";

    public List<Payment> loadPayments() {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    payments.add(new Payment(parts[0], parts[1], parts[2], Double.parseDouble(parts[3]), parts[4]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }

    public void savePayments(List<Payment> payments) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Payment p : payments) {
                writer.write(p.getId() + "," + p.getUserId() + "," + p.getMethod() + "," + p.getAmount() + "," + p.getDate() + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}