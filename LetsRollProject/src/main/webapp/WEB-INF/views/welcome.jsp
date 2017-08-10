<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 7/21/2017
  Time: 11:04 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Spring Demo</title>
</head>
<body>
<p>
    Need logo
    <br>
    about us section
    <br>
    Our company name
    <br>
    Our team logo
    <br>
    Our App name and logo
</p>
${message}
<br>
<a href="/login">Login</a>
<br>
<!-- this is to register a new user -->

<a href="/adduser">Register</a>
<br>
<form action="/test" method="get">
    <input type="text" name="userName" required/>
    <input type="submit" value="Search">
</form>
</body>
</html>
