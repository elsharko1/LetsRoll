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
        <%--<th>Image</th>--%>
<%--
        <th>Image</th>
--%>
        <th>ID</th>
        <th>Title</th>
        <th>Venue Name / Address</th>
        <th>Description</th>
        <th>Going Count</th>
        <th>Start Time</th>
    </tr>
    <c:forEach var="type" items="${jsonPageData}">
        <tr>
            <%--<td><img src="${type.image}" width="128" height="128"></td>--%>
<%--
            <td>${type.image}</td>
--%>
            <td>${type.id}</td>
            <td>${type.title}</td>
            <td>${type.venue_name} / ${type.venue_address}</td>
            <td>${type.description}</td>
            <td>${type.going_count}</td>
            <td>${type.start_time}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
