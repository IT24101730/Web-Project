<%@ page import="com.toyshop.payment.Payment" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/6/2025
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payments</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f7f7f7; padding: 2rem; }
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; background: white; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background-color: #eaeaea; }
        form { margin-top: 2rem; background: white; padding: 1rem; border: 1px solid #ccc; }
        input, select { padding: 8px; width: 100%; margin: 0.5rem 0; }
        button { padding: 0.6rem 1.2rem; background: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background: #218838; }
        .delete-link { color: red; text-decoration: none; }
    </style>
</head>
<body>
<h2>Payments List</h2>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Method</th>
        <th>Amount</th>
        <th>Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Payment> payments = (List<com.toyshop.payment.Payment>) request.getAttribute("payments");
        if (payments != null) {
            for (com.toyshop.payment.Payment p : payments) {
    %>
    <tr>
        <td><%= p.getId() %></td>
        <td><%= p.getUserId() %></td>
        <td><%= p.getMethod() %></td>
        <td><%= p.getAmount() %></td>
        <td><%= p.getDate() %></td>
        <td>
            <form action="UpdatePaymentServlet" method="post" style="display:inline-block;">
                <input type="hidden" name="id" value="<%= p.getId() %>">
                <input type="text" name="method" value="<%= p.getMethod() %>" required>
                <input type="number" name="amount" value="<%= p.getAmount() %>" step="0.01" required>
                <input type="date" name="date" value="<%= p.getDate() %>" required>
                <button type="submit">Update</button>
            </form>
            <a class="delete-link" href="DeletePaymentServlet?id=<%= p.getId() %>">Delete</a>
        </td>
    </tr>
    <% }} %>
    </tbody>
</table>

<h2>Add New Payment</h2>
<form action="AddPaymentServlet" method="post">
    <input type="text" name="id" placeholder="Payment ID" required>
    <input type="text" name="userId" placeholder="User ID" required>
    <select name="method" required>
        <option value="Credit Card">Credit Card</option>
        <option value="PayPal">PayPal</option>
        <option value="Cash">Cash</option>
    </select>
    <input type="number" name="amount" placeholder="Amount" step="0.01" required>
    <button type="submit">Add Payment</button>
</form>
</body>
</html>

