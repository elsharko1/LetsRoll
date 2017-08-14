<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 7/21/2017
  Time: 11:04 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Let's Roll!</title>
</head>

<body style="background-color:powderblue;">

<%session.setAttribute("name", "Richard");%>

<h1>Welcome to Let's Roll</h1><br>
<p>Meet our TEAM, JRMN8!</p>

<ul style="list-style-type:square">
    <li>Jenny</li> <br>
    <li>Richard</li> <br>
    <li>Mark</li> <br>
    <li>Ny</li>
</ul>

<a href="http://eventful.com/signin?goto=http%3A%2F%2Fdetroit.eventful.com%2Fevents">Sign In</a><br>

(If the system could not pull an existing user from our Database after they signed in with Evenful's API)<br>
<a href="/registration">Sign Up</a> <br>
If they are an existing user, then we lead them to the homepage.
<br>
<a href="/homepage">Homepage</a>

</body>
</html>
