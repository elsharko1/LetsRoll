<%@ page import="com.jrmn8.GoogleOAUTH" %><%--
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

<div class="oauthDemo">
    <%
        GoogleOAUTH.buildGoogleOAUTH();
        if (request.getParameter("code") == null || request.getParameter("state") == null) {
            out.println("<a href='" + GoogleOAUTH.buildLoginUrl() + "'>log in with google</a>");
            session.setAttribute("state", GoogleOAUTH.getStateToken());
        } else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
            session.removeAttribute("state");
        }
    %>
</div>

<%session.setAttribute("name", "Richard");%>

<h1>Welcome to Let's Roll</h1><br>
<p>Meet our TEAM, JRMN8!</p>

<br>
<h1>${status}</h1>
<br>
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
