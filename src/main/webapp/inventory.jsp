<%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/4/2025
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ToyShop.Model.*" %>
<%@ page import="com.ToyShop.dao.*" %>
<%@ page import="com.ToyShop.Controller.*" %>
<%@ page import="com.ToyShop.dao.*, com.ToyShop.Model.*, java.util.*" %>
<%
  InventoryManager manager = new InventoryManager();
  manager.loadFromFile();
  ToyLinkedList toys = manager.getToyList();
  toys.sortByAgeGroup();
%>

<html>
<head>
  <title>Toy Shop Inventory</title>
  <style>
    .toy-container {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      padding: 20px;
      justify-content: center;
    }
    .toy-card {
      width: 220px;
      border: 1px solid #ddd;
      border-radius: 12px;
      padding: 16px;
      text-align: center;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      background: #f9f9f9;
    }
    .toy-card img {
      max-width: 100%;
      border-radius: 8px;
      margin-bottom: 10px;
    }
    .toy-name {
      font-weight: bold;
      margin-bottom: 6px;
    }
    .toy-age {
      font-size: 14px;
      color: #555;
      margin-bottom: 6px;
    }
    .toy-price {
      color: #008080;
      font-size: 16px;
      font-weight: bold;
    }
    .actions {
      margin-top: 10px;
    }
  </style>
</head>
<body>

<h1 style="text-align:center;">Toy Shop Inventory</h1>
<a href="addToy.jsp">Add New Toy</a>
<div class="toy-container">
  <%
    Toy current = toys.getHead();
    while (current != null) {
  %>
  <div class="toy-card">
    <img src="<%= current.imagePath %>" alt="Toy image">
    <div class="toy-name"><%= current.name %></div>
    <div class="toy-age">Age Group: <%= current.ageGroup %>+</div>
    <div class="toy-category">Category: <strong><%= current.category %></strong></div>
    <div class="toy-price">$<%= String.format("%.2f", current.price) %></div>

    <div class="actions">
      <a href="EditToyServlet?id=<%= current.id %>">Edit</a> |
      <a href="DeleteToyServlet?id=<%= current.id %>" onclick="return confirm('Are you sure?');">Delete</a>
    </div>
  </div>
  <%
      current = current.next;
    }
  %>
</div>

<a href="ageList.jsp">View Age List</a>
<a href="home.jsp">Home</a>
<a href="category.jsp">Category</a>

</body>
</html>
