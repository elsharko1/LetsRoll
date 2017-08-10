<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:32 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
</head>
<body>
<p>
    this is our home page<br>
    Search bar<br>
    Search results page<br>
    location from eventful<br>
    create and event button<br>
    link to profile page<br>
    link to your events page<br>
</p>
<a href="/profile">Make profile</a><br>
<a href="/createevent">create event</a><br>

<form action="/searchresults" method="get">
    <input type="text" name = "keywords" required>
    <input type="submit" value="Search By Keywords">
</form>
<%--<a href="/searchresults">search results</a><br>--%>
<a href="/feedbackpage">feedback</a><br>
<a href="/yourevents">See your events</a><br>
</body>
</html>
