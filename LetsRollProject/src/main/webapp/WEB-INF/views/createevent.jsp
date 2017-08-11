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
    Date: ("MM/DD/YYYY"): <input type="text" name="date">
    <br>
    <%--<select name="repeat">--%>
        <%--<option value="doesnotrepeat "> -- does not repeat -- </option>--%>
        <%--<option value="daily">Repeats Daily</option>--%>
        <%--<option value="weekly">Repeats Weekly</option>--%>
        <%--<option value="monthly">Repeats Monthly</option>--%>
    <%--</select>--%>
    <%--<br>--%>
    Where: <input type="text" name="where">
    <br>
    Description: <br>
    <textarea rows = "5" cols = "50" name = "description">
    </textarea>
    <br>
    Skills Needed: <br>
    <textarea rows = "5" cols = "50" name = "skillsneeded">
    </textarea>
    <br>
    WheelChair Accessible:
    <select name="wheelchair">
        <option value="1">Yes</option>
        <option value="0">No</option>
        <%--<option value= "comedy">Comedy Events</option>--%>
        <%--<option value= "education">Education</option>--%>
        <%--<option value= "famFrendly">Kids & Family</option>--%>
    </select>
    <br>
    Family Friendly:
    <select name="family">
        <option value="1">Yes</option>
        <option value="0">No</option>
    </select>
    <br>
    Service Dog Friendly:
    <select name="servicedog">
        <option value="1">Yes</option>
        <option value="0">No</option>
    </select>
    <br>
    Blind Friendly:
    <select name="blind">
        <option value="1">Yes</option>
        <option value="0">No</option>
    </select>
    <br>
    <%--<input type="checkbox" name="accessW" value="1">Wheel Chair<br>--%>
    <%--<input type="checkbox" name="accessF" value="1">Family Friendly<br>--%>
    <%--<input type="checkbox" name="accessS" value="1">Service Dog Friendly<br>--%>
    <%--<input type="checkbox" name="accessB" value="1">Blind Friendly<br>--%>
    <input type="submit" value="Register">
</form>


<br>
<a href="/homepage">Home page</a>
</body>
</html>
