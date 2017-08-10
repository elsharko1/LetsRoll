<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 3:36 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>create event page</title>
</head>
<body>
<form method="post" action = "/eventcreated">
    Title: <input type="text" name="title">
    <br>
    Creator: <input type="text" name="creator">
    <br>
    <%--Month (mm): <input type="text" name="month">--%>
    <%--Day (dd): <input type="text" name="day">--%>
    <%--Year (yyyy): <input type="text" name="year">--%>
    <%--<br>--%>
    <%--<select name="repeat">--%>
        <%--<option value="doesnotrepeat "> -- does not repeat -- </option>--%>
        <%--<option value="daily">Repeats Daily</option>--%>
        <%--<option value="weekly">Repeats Weekly</option>--%>
        <%--<option value="monthly">Repeats Monthly</option>--%>
    <%--</select>--%>
    <%--<br>--%>
    Where: <input type="text" name="where">
    <br>
    Description: <textarea rows = "5" cols = "50" name = "description">
            Enter description here...
         </textarea>
    <br>
    Skills Needed: <textarea rows = "5" cols = "50" name = "skillsneeded">
            Enter description here...
         </textarea>
    <br>
    <%--<select name="choice">--%>
        <%--<option value= "concerts">Concerts and Tour Dates</option>--%>
        <%--<option value= "conferences">Conferences and Trade Shows</option>--%>
        <%--<option value= "comedy">Comedy Events</option>--%>
        <%--<option value= "education">Education</option>--%>
        <%--<option value= "famFrendly">Kids & Family</option>--%>
    <%--</select>--%>
    <%--<br>--%>
    <input type="submit" value="Register">
</form>


<br>
<a href="/homepage">Home page</a>
</body>
</html>
