<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete confirmation</title>
    <style>
        .inline {
            display: inline;
        }

        .link-button {
            background: none;
            border: none;
            color: blue;
            text-decoration: underline;
            cursor: pointer;
            font-size: 1em;
            font-family: serif;
        }
    </style>
</head>
<body>
Are you sure to delete this book?
<br>
<form method="post" action="/books/delete/${id}" class="inline">
    <input type="hidden" name="id" value="${id}">
    <button type="submit" class="link-button">Confirm and delete</button>
</form>
<br>
<br>
<a href="/books"> Cancel and return</a>
</body>
</html>
