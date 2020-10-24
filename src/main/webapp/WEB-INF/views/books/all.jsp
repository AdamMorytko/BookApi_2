<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book List</title>
</head>
<body>
<form action="/books/search">
    <label for="bookTitle">Enter a book title</label><br>
    <input id="bookTitle" type="text" name="bookTitle"><br>
    <input type="submit" value="search">
</form>
<c:if test="${notFound}">Not found.</c:if><br>
<c:if test="${search}">
    <a href="${pageContext.request.contextPath}/books">Return to book list</a>
</c:if><br>
<br>
<a href="${pageContext.request.contextPath}/books/add">Add a new book</a>
<br>
<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>actions</th>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td>
                <a href="${pageContext.request.contextPath}/books/${book.id}">details</a> /
                <a href="${pageContext.request.contextPath}/books/delete/${book.id}">delete</a> /
                <a href="${pageContext.request.contextPath}/books/edit/${book.id}">edit</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <br>
</table>
</body>
</html>

