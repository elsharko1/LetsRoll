<%--
  Created by IntelliJ IDEA.
  User: RIchard
  Date: 8/12/2017
  Time: 9:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Daoing</title>
</head>
<body>
<h1>Here's a Dao Test. </h1>

<!-- ${sessionScope.get("name")}<br> -->

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
    <c:forEach var="dao" items="${dao}">
        <tr>
            <td>${dao.eventID}</td>
            <td>${dao.title}</td>
            <td>${dao.creator}</td>
            <td>${dao.location}</td>
            <td>${dao.description}</td>
            <td>${dao.date}</td>
            <td>${dao.skillsneeded}</td>
        </tr>
    </c:forEach>
</table>
<a href="/homepage">Home page</a>
</body>
</html>
