<%--
  Created by IntelliJ IDEA.
  User: Ny Derry
  Date: 8/2/2017
  Time: 10:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


<body>
<p style="color:blue; font-size:36px;">Thank you, ${fullName}!</p>



</head>

<!--<form action="/adduser" method="post">
   Location: <input type="text" name="location" required> <br>
   Full Name: <input type="text" name="fullName" required> <br>

   <!--Contact Name: <input type="text" name="contName"> <br>
   Contact Title: <input type="text" name="contTitle"> <br>
   Address: <input type="text" name="address"> <br>
   City: <input type="text" name="city"> <br>
   Region: <input type="text" name="region"> <br>
   Postal Code: <input type="text" name="zip"> <br>
   Country: <input type="text" name="country"> <br>
   Phone: <input type="text" name="phone"> <br>
   Fax: <input type="text" name="fax"> <br> -->

<form action="/homepage">
    <input type="submit" value="Home" >

</form>


<!-- fname and lname are variables passed in from homecontroller's summary method.
-- These two variables are supposed to be the first name and last name inputted fromm the registration page. -->


</body>
</html>


