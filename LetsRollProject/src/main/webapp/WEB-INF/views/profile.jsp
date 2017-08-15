<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<p>
<form action="editprofile" method="POST">
    Full Name: <input name="fullName" value="${user.fullName}"/> <br>
    Email: <input name="email" value="${user.email}"/> <br>
    Location: <input name="location" value="${user.location}"/> <br>
    Skills: <select multiple name="skills">
    <option value="Disabled">Disabled</option>
    <option value="Children">Children</option>
    <option value="People">People</option>
    <option value="Animal">Animal</option>
    <option value="Administrative">Adminstrative</option>
    <option value="Technical">Technical</option>
    <option value="Other">Mystery</option>
    <br>
    </select>
    <input type="submit" value="Submit Profile Changes"/>
</form>
<br>
</select>
</p>
<a href="/homepage">Home page</a>
</body>
</html>
