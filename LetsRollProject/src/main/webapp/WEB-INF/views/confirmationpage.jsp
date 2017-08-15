<%--
  Created by IntelliJ IDEA.
  User: JRMN8
  Date: 8/7/2017
  Time: 5:01 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirmation Page</title>
</head>
<body>
Thank you ${currentUser.fullName} for signing up for the following event:
<table border="1">
    <tr>
        <th>Event ID</th>
        <th>Title</th>
        <th>Location (Venue Name / Address)</th>
        <th>Accessibility</th>
        <th>Description</th>
        <th>Date (Start Time)</th>
        <th>Skills Needed</th>
        <th>Volunteer</th>
    </tr>
    <tr>
        <td>${event.eventID}</td>
        <td>${event.title}</td>
        <td>${event.location}</td>
        <td>
            <c:choose>
                <c:when test="${accessibility.blind=='1'}">
                    Visually Impaired<br/>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${accessibility.family=='1'}">
                    Families<br/>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${accessibility.servicedog=='1'}">
                    Service Dogs<br/>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${accessibility.wheelchair=='1'}">
                    Wheelchairs
                </c:when>
            </c:choose>
        </td>
        <td>${event.description}</td>
        <td>${event.date}</td>
        <td>${event.skillsneeded}</td>
        <%--        <td>${message}
                    <c:choose>
                        <c:when test="${attendee.isVolunteer=='1'}">
                            Yes
                            <br/>
                        </c:when>
                        <c:otherwise>
                            No
                            <br/>
                        </c:otherwise>
                    </c:choose>
                </td>--%>
        <td>
            <%--<c:choose>
                <c:when test="${message!='null'}">
                    ${message}
                    <br/>
                </c:when>
            </c:choose>--%>
            <%--
                            <c:otherwise>
            --%>
            <c:choose>
                <c:when test="${attendee.isVolunteer=='1'}">
                    Yes
                    <br/>
                </c:when>
                <c:otherwise>
                    No
                    <br/>
                </c:otherwise>
            </c:choose>
            <%--
                            </c:otherwise>
            --%>
            <%--
                        </c:choose>
            --%>
        </td>
    </tr>
    <br>
    <a href="/homepage">Home page</a>
</body>
</html>
