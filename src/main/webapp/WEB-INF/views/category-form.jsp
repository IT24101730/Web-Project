<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Category</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Add New Category</h1>
<form action="${pageContext.request.contextPath}/categories" method="post">
    <div>
        <label for="name">Category Name:</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div>
        <label for="subcategories">Subcategories (comma separated):</label>
        <input type="text" id="subcategories" name="subcategories" required>
    </div>
    <button type="submit">Save</button>
    <a href="${pageContext.request.contextPath}/categories">Cancel</a>
</form>
</body>
</html>