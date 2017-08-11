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
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" media="screen"
              href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
</head>
<body>
<form method="post" action = "/eventcreated">
    Title: <input type="text" name="title">
    <br>
    Creator: <input type="text" name="creator">
    <br>
    <div id="datetimepicker" class="input-append date">
        <input type="text" name="date">Date: </input>
        <span class="add-on">
        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
      </span>
    </div>
    <script type="text/javascript"
            src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
    </script>
    <script type="text/javascript"
            src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/js/bootstrap.min.js">
    </script>
    <script type="text/javascript"
            src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.min.js">
    </script>
    <script type="text/javascript"
            src="http://tarruda.github.com/bootstrap-datetimepicker/assets/js/bootstrap-datetimepicker.pt-BR.js">
    </script>
    <script type="text/javascript">
        $('#datetimepicker').datetimepicker({ pickSeconds: false, pick12HourFormat: true, format: "MM/dd/yyyy HH:mm PP" }).val();
    </script>
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
