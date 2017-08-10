<%--
  Created by IntelliJ IDEA.
  User: jenny
  Date: 8/3/2017
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSON Data</title>
</head>
<body>
<h1>This is the JSON Data</h1>
<%--<img src="${imageData}" width="128" height="128"><br>--%>
<%--${type.key} : ${type.value} <br>--%>
<table border="1">
    <tr>
        <th>Event ID</th>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
        <th>Skills Needed</th>
    </tr>
    <c:forEach var="type" items="${jsonPageData}">
        <tr>
            <td>${type.eventId}</td>
            <td>${type.title}</td>
            <td>${type.creator}</td>
            <td>${type.location}</td>
            <td>${type.description}</td>
            <td>${date}</td>
            <td>${type.skillsneeded}</td>
        </tr>
    </c:forEach>
</table>
<a href="/homepage">Home page</a>
</body>
</html>
