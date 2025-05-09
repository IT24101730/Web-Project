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
    <title>Add New Toy</title>
    <style>
        body { font-family: Arial; padding: 40px; background: #f4f4f4; }
        .form-container { max-width: 400px; margin: auto; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        input[type="text"], input[type="number"], input[type="file"] {
            width: 100%; padding: 10px; margin-top: 8px; margin-bottom: 16px; border: 1px solid #ccc; border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #008080; color: white; border: none; padding: 10px 16px; border-radius: 6px; cursor: pointer;
        }
        a { display: block; margin-top: 16px; text-align: center; color: #008080; text-decoration: none; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Add New Toy</h2>
    <form action="AddToyServlet" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>ID:</td>
                <td><input type="text" name="id" required /></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" required /></td>
            </tr>
            <tr>
                <td>Age Group:</td>
                <td><input type="number" name="ageGroup" required /></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="number" name="price" step="0.01" required /></td>
            </tr>
            <tr>
                <td>Category:</td>
                <td>
                    <select name="category" required>
                        <option value="Educational">Educational</option>
                        <option value="Plush">Plush</option>
                        <option value="Outdoor">Outdoor</option>
                        <option value="Electronic">Electronic</option>
                        <option value="Action Figure">Action Figure</option>
                        <option value="Puzzel">Puzzles</option>
                        <option value="Lego">Lego</option>
                        <option value="Books">Books</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="file" name="imageFile" accept="image/*" required /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add Toy" /></td>
            </tr>
        </table>
    </form>
    <a href="inventory.jsp">← Back to Inventory</a>
</div>
</body>
</html>
