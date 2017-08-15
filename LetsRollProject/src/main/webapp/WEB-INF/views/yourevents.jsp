<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mark
  Date: 8/8/2017
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your events page</title>
</head>
<body>
<p>this will show your events you are the coordinator for</p><br>
<h1>Attending</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
    </tr>
    <c:forEach var="data" items="${attendee}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
        </tr>
    </c:forEach>
</table>
<h1>Volunteer</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
    </tr>
    <c:forEach var="data" items="${volunteer}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
        </tr>
    </c:forEach>
</table>
<h1>Created</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Creator</th>
        <th>Location (Venue Name / Address)</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
    </tr>
    <c:forEach var="data" items="${created}">
        <tr>
            <td>${data.title}</td>
            <td>${data.creator}</td>
            <td>${data.location}</td>
            <td>${data.description}</td>
            <td>${data.date}</td>
        </tr>
    </c:forEach>
</table>
<a href="/homepage">Home page</a>
</body>
</html>
