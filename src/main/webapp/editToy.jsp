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
<%
    Toy toy = (Toy) request.getAttribute("toy");
%>
<html>
<head>
    <title>Edit Toy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
            background-color: #f4f4f4;
        }
        .form-container {
            max-width: 400px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #008080;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        a {
            display: block;
            margin-top: 16px;
            text-align: center;
            color: #008080;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Edit Toy</h2>
    <form action="UpdateToyServlet" method="post">
        <input type="hidden" name="id" value="<%= toy.id %>" />

        <label>Name:</label>
        <input type="text" name="name" value="<%= toy.name %>" required />

        <label>Age Group:</label>
        <input type="number" name="ageGroup" value="<%= toy.ageGroup %>" required />

        <label>Price:</label>
        <input type="text" name="price" value="<%= toy.price %>" required />

        <label>Image Path:</label>
        <input type="text" name="imagePath" value="<%= toy.imagePath %>" required />

        <input type="submit" value="Update Toy" />
    </form>

    <a href="inventory.jsp">← Back to Inventory</a>
</div>

</body>
</html>
