<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>details</title>
</head>
<body>
<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>actions</th>
    </thead>
    <tbody>
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.publisher}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.type}"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/books/delete/${book.id}">delete</a> /
                <a href="${pageContext.request.contextPath}/books/edit/${book.id}">edit</a>
            </td>
        </tr>
    </tbody>
    <br>
</table>
<br>
<a href="${pageContext.request.contextPath}/books">Return to book list</a>
</body>
</html>
