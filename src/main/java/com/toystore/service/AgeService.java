package com.ToyShop.Service;
import com.ToyShop.Model.*;
import com.ToyShop.dao.*;
public class AgeService {
    private AgeManager manager = new AgeManager();

    public void addAge(String id, String label) {
        manager.loadFromFile();
        manager.getAgeList().addAgeGroup(id, label);
        manager.saveToFile();
    }

    public void updateAge(String id, String label) {
        manager.loadFromFile();
        AgeGroup current = manager.getAgeList().getHead();
        while (current != null) {
            if (current.getId().equals(id)) {
                current.setLabel(label);
                break;
            }
            current = current.next;
        }
        manager.saveToFile();
    }

    public void deleteAge(String id) {
        manager.loadFromFile();
        AgeGroup current = manager.getAgeList().getHead();
        AgeGroup prev = null;

        while (current != null) {
            if (current.getId().equals(id)) {
                if (prev == null) {
                    manager.getAgeList().getHead().setId(current.next != null ? current.next.getId() : null);
                    manager.getAgeList().getHead().setLabel(current.next != null ? current.next.getLabel() : null);
                    manager.getAgeList().getHead().next = current.next != null ? current.next.next : null;
                } else {
                    prev.next = current.next;
                }
                break;
            }
            prev = current;
            current = current.next;
        }

        manager.saveToFile();
    }

    public AgeGroup getAgeById(String id) {
        manager.loadFromFile();
        AgeGroup current = manager.getAgeList().getHead();
        while (current != null) {
            if (current.getId().equals(id)) {
                return current;
            }
            current = current.next;
        }
        return null;
    }
}