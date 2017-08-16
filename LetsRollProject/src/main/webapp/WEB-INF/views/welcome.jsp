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

<body style="background-color:powderblue;">${status}

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
<h1></h1>
<br>
<ul style="list-style-type:square">
    <li>Jenny</li> <br>
    <li>Richard</li> <br>
    <li>Mark</li> <br>
    <li>Ny</li>
</ul>

</body>
</html>
