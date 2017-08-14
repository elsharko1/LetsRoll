<%--
<%@page import="com.jrmn8.GoogleOAUTH" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div class="oauthDemo">
<<<<<<< HEAD
	<%
		final GoogleOAUTH helper = new GoogleOAUTH();

		if (request.getParameter("code") == null || request.getParameter("state") == null) {
			out.println("<a href='" + helper.buildLoginUrl() + "'>log in with google</a>");
			session.setAttribute("state", helper.getStateToken());
		} else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
			session.removeAttribute("state");
		}
	%>
=======
    <%
        final GoogleOAUTH helper = new GoogleOAUTH();

        if (request.getParameter("code") == null || request.getParameter("state") == null) {
            out.println("<a href='" + helper.buildLoginUrl() + "'>log in with google</a>");
            session.setAttribute("state", helper.getStateToken());
        } else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
            session.removeAttribute("state");
            out.println("<a href='" + helper.buildLogoutUrl() + "'>log out with google</a>");
        }
    %>
>>>>>>> 544e175382ae3c610b99831bcf65b3adf1338dba
</div>
<br/>

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
    <input type="text" name="keywords" required>
    <input type="submit" value="Search By Keywords">
</form>
&lt;%&ndash;<a href="/searchresults">search results</a><br>&ndash;%&gt;
<a href="/feedbackpage">feedback</a><br>
<a href="/yourevents">See your events</a><br>

<!-- this is to register a new user -->

<a href="/adduser">Register</a>
<br>
<form action="/test" method="get" hidden>
    <input type="text" name="userName" value/>
    <input type="html" value="Search">
</form>
${sessionScope.get('id')}
${sessionScope.get('name')}

<br>
</body>
</html>
--%>
