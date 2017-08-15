<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:37 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Search results page</title>
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
    <c:forEach var="data" items="${searchresults}">
        <tr>
            <td>${data.eventID}</td>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
            <td>${data.skillsneeded}</td>
        </tr>
    </c:forEach>
</table>
<p>a link back to our home page</p>
<a href="/homepage">Home page</a><br>
</body>
</html>
