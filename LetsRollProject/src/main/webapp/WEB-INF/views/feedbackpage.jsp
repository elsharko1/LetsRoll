<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 4:10 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback page</title>
</head>
<body>
<h3>Feedback for ${name}</h3>
<form action="feedbackconfirmation">
    <input type="text" value="${feedbackID}" name="feedbackID" hidden>
    <textarea rows="5" cols="50" name="feedback"}>${feedback}</textarea>
    <br>
    <input type="submit" value="Submit feedback">
</form>
<br>
<a href="/homepage">Home page</a>
</body>
</html>
