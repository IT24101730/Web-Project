<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Toy Store - Categories</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Category Management</h1>
<a href="${pageContext.request.contextPath}/categories/new">Add New Category</a>

<table>
    <tr>
        <th>Category</th>
        <th>Subcategories</th>
    </tr>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>${category.name}</td>
            <td>
                <c:forEach items="${category.subcategories}" var="sub" varStatus="loop">
                    ${sub}<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>