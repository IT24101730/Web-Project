<%--
  Created by IntelliJ IDEA.
  User: vimu
  Date: 5/4/2025
  Time: 11:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Age Group</title>
    <style>
        body { font-family: Arial; padding: 40px; background: #f4f4f4; }
        .form-container { max-width: 400px; margin: auto; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        input[type="text"] { width: 100%; padding: 10px; margin-top: 8px; margin-bottom: 16px; border: 1px solid #ccc; border-radius: 6px; }
        input[type="submit"] { background-color: #008080; color: white; border: none; padding: 10px 16px; border-radius: 6px; cursor: pointer; }
        a { display: block; margin-top: 16px; text-align: center; color: #008080; text-decoration: none; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add Age Group</h2>
    <form action="AddAgeServlet" method="post">
        <label>Age Group ID:</label>
        <input type="text" name="id" required />

        <label>Label (e.g. 1-3 years):</label>
        <input type="text" name="label" required />

        <input type="submit" value="Add Age Group" />
    </form>
    <a href="ageList.jsp">← Back to Age List</a>
</div>
</body>
</html>
