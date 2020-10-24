<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>New book</title>
</head>
<body>
<form:form method="post" modelAttribute="book" action="${pageContext.request.contextPath}/books">
    <p hidden><form:input path="id"/></p>
    <label for="title">Tytuł*</label>
    <form:input path="title" id="title"/>
    <form:errors path="title"/>
    <br>
    <label for="author">Autor*</label>
    <form:input path="author" id="author"/>
    <form:errors path="author"/>
    <br>
    <label for="publisher">Wydawca</label>
    <form:input path="publisher" id="publisher"/>
    <form:errors path="publisher"/>
    <br>
    <label for="isbn">ISBN</label>
    <form:input path="isbn" id="isbn"/>
    <form:errors path="isbn"/>
    <br>
    <label for="type">Gatunek</label>
    <form:input path="type" id="type"/>
    <form:errors path="type"/>
    <br>
    * - pole wymagane
    <br>
    <input type="submit" value="Zapisz">
</form:form>
<br>
<a href="${pageContext.request.contextPath}/books">Powrót</a>
</body>
</html>
