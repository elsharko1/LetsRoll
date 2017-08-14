<%--
  Created by IntelliJ IDEA.
  User: RIchard
  Date: 8/13/2017
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DaoTestFieldInput</title>
</head>
<body>
<form action="/daotest" method="post">
    Keyword: <input type="text" name="daofield"/><br>
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
    <input type="submit" value="submit"/>
</form>
</body>
</html>
