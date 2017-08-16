<%--
  Created by IntelliJ IDEA.
  User: RIchard
  Date: 8/14/2017
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<h1>Profile has been changed to the following:</h1>
${user.fullName}<br>
${user.email}<br>
${user.location}<br>
${user.skills}<br>
<a href="/homepage">Home page</a>
</body>
</html>
