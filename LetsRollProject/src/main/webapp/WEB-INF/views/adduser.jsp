<%--
  Created by IntelliJ IDEA.
  User: RIchard
  Date: 8/10/2017
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add a user to our DB with heberunate</title>
</head>
<body>
<form action="/addinguser" method="post">
    Eventful user name: <input type="text" name="eventfulUserName" required> <br>
    Email: <input type="text" name="email" required> <br>
    Location: <input type="text" name="location" required> <br>
    Skills: <input type="text" name="skills"> <br>
    Full Name: <input type="text" name="fullName"> <br>
    <input type="submit" value="Add User">
</form>
</body>
</html>
