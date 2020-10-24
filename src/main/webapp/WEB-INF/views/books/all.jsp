<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book List</title>
</head>
<body>

<table border="1">
    <thead>
    <th>isbn</th>
    <th>title</th>
    <th>author</th>
    <th>publisher</th>
    <th>type</th>
    <th>actions</th>
    </thead>
    <tbody>
    <c:forEach items="${books}" var="book">
        <tr>
            <td><c:out value="${book.isbn}"/></td>
            <td><c:out value="${book.title}"/></td>
            <td><c:out value="${book.author}"/></td>
            <td><c:out value="${book.publisher}"/></td>
            <td><c:out value="${book.type}"/></td>
            <td>
                <form method="put" action="/books/${book.id}" class="inline">
                    <input type="hidden" name="extra_submit_param" value="extra_submit_value">
                    <button type="submit" name="submit_param" value="submit_value" class="link-button">
                        This is a link that sends a POST request
                    </button>
                </form>

            </td>
        </tr>
    </c:forEach>
    </tbody>
    <br>
</table>
<br>
<a href="${pageContext.request.contextPath}/books/add">Add a new book</a>
</body>
</html>

