<%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/4/2025
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.ToyShop.Model.*" %>
<%@ page import="com.ToyShop.dao.*" %>
<%@ page import="com.ToyShop.Controller.*" %>

<%
  AgeManager manager = new AgeManager();
  manager.loadFromFile();
  AgeLinkedList ageList = manager.getAgeList();
%>
<html>
<head>
  <title>Age Group Management</title>
  <style>
    body { font-family: Arial; padding: 40px; background: #f4f4f4; }
    .container { max-width: 800px; margin: auto; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 12px; border: 1px solid #ccc; text-align: left; }
    th { background-color: #008080; color: white; }
    a { color: #008080; text-decoration: none; margin: 0 5px; }
  </style>
</head>
<body>
<div class="container">
  <h2>Age Groups</h2>
  <a href="addAge.jsp">+ Add New Age Group</a>
  <table>
    <tr><th>ID</th><th>Label</th><th>Actions</th></tr>
    <%
      AgeGroup current = ageList.getHead();
      while (current != null) {
    %>
    <tr>
      <td><%= current.getId() %></td>
      <td><%= current.getLabel() %></td>
      <td>
        <a href="EditAgeServlet?id=<%= current.getId() %>">Edit</a> |
        <a href="DeleteAgeServlet?id=<%= current.getId() %>" onclick="return confirm('Delete this age group?');">Delete</a>
      </td>
    </tr>
    <%
        current = current.next;
      }
    %>
  </table>
  <br>
  <a href="inventory.jsp">← Back to Inventory</a>
</div>
</body>
</html>
