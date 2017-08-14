<%@page import="com.jrmn8.GoogleOAUTH" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>
<body>
<div class="oauthDemo">
	<%
		final GoogleOAUTH helper = new GoogleOAUTH();

		if (request.getParameter("code") == null || request.getParameter("state") == null) {
			out.println("<a href='" + helper.buildLoginUrl() + "'>log in with google</a>");
			session.setAttribute("state", helper.getStateToken());
		} else if (request.getParameter("code") != null && request.getParameter("state") != null && request.getParameter("state").equals(session.getAttribute("state"))) {
			session.removeAttribute("state");

				/* Executes after google redirects to the callback url.*/
			JSONObject userInfo = helper.getUserInfoJson(request.getParameter("code"));
				/*out.println(helper.getUserInfoJson(request.getParameter("code")));*/
			out.println(userInfo.get("name") + "<br>");
			out.println(userInfo.get("id") + "<br>");
			out.println(userInfo.get("verified_email") + "<br>");
			out.println(userInfo.get("given_name") + "<br>");
			out.println(userInfo.get("locale") + "<br>");
			out.println(userInfo.get("family_name") + "<br>");
			out.println(userInfo.get("email") + "<br>");
			out.println(userInfo.get("picture") + "<br>");
			out.println("<a href='" + helper.buildLogoutUrl() + "'>log out with google</a>");
		}
	%>
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
<%--<a href="/searchresults">search results</a><br>--%>
<a href="/feedbackpage">feedback</a><br>
<a href="/yourevents">See your events</a><br>

<!-- this is to register a new user -->

<a href="/adduser">Register</a>
<br>
<form action="/test" method="get">
	<input type="text" name="userName" required/>
	<input type="submit" value="Search">
</form>

</body>
</html>
