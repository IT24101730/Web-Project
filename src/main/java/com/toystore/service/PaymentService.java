package com.toyshop.payment;

import java.util.*;

public class PaymentService {
    private final PaymentManager manager = new PaymentManager();

    public void createPayment(Payment payment) {
        List<Payment> payments = manager.loadPayments();
        payments.add(payment);
        manager.savePayments(payments);
    }

    public Payment getPayment(String id) {
        List<Payment> payments = manager.loadPayments();
        for (Payment p : payments) {
            if (p.getId().equals(id)) return p;
        }
        return null;
    }

    public void updatePayment(Payment updated) {
        List<Payment> payments = manager.loadPayments();
        for (Payment p : payments) {
            if (p.getId().equals(updated.getId())) {
                p.setMethod(updated.getMethod());
                p.setAmount(updated.getAmount());
                p.setDate(updated.getDate());
                break;
            }
        }
        manager.savePayments(payments);
    }

    public void deletePayment(String id) {
        List<Payment> payments = manager.loadPayments();
        payments.removeIf(p -> p.getId().equals(id));
        manager.savePayments(payments);
    }

    public List<Payment> getAllPayments() {
        return manager.loadPayments();
    }
}
