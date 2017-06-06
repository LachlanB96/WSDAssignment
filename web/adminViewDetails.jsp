<%-- 
    Document   : admin
    Created on : 25/04/2017, 10:15:30 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Bookings</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>

    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li class="dropdown">
            <a href="login.jsp" class="dropbtn">You are logged in as <%= user.getName()%> &lt;<%= user.getEmail()%>&gt; </a>
            <div class="dropdown-content">
                <a href="logout.jsp">Logout</a>
            </div>
        </li>
        <% if (user.getPrivilege().equals("admin")) { %>
        <li class="right"><a href="admin.jsp">Admin</a></li>  
            <% } %>
    </ul>
    <%

        Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
    %>
    <fieldset>
        <h2>View Booking Details</h2>
        <%
            if (request.getParameter("userID") == null) { %>
        <c:import url="WEB-INF/bookings.xsl" var="xslt"/>
        <c:import url="WEB-INF/bookings.xml"
                  var="inputDoc" />
        <x:transform xml="${inputDoc}" xslt="${xslt}"/>
        <form action="adminViewDetails.jsp" method="get">
            <table>
                <tr></tr>
                <tr></tr>
                <tr><td width="60%">What is the user ID of the booking you will like to view?</td></tr>
                <tr><td><input type="text" name="userID" required></td></tr>
                <tr><td><input type="submit" value="View"></td></tr>
            </table>
        </form>
        <%
        } else {
            String userID = request.getParameter("userID");
            session.setAttribute("adminUserIDSearch", userID);
        %>

        <table border="1">

            <c:import url="WEB-INF/bookings.xsl" var="xslt"/>
            <c:import url="WEB-INF/bookings.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "userID" scope = "page" value ="${adminUserIDSearch}" />
            <x:forEach var="tag" select="$output//bookings/booking">
                <x:choose>
                    <x:when select="$tag/id = $userID">
                        <tr>
                            <td><x:out select="$tag/id" /></td>
                            <td><x:out select="$tag/flightID" /></td>
                            <td><x:out select="$tag/bookingID" /></td>
                            <td><x:out select="$tag/origin" /></td>
                            <td><x:out select="$tag/destination" /></td>
                            <td><x:out select="$tag/flightType" /></td>
                            <td><x:out select="$tag/departureDate" /></td>
                            <td><x:out select="$tag/returnDate" /></td>
                            <td><x:out select="$tag/description" /></td>
                        </tr>
                    </x:when>
                </x:choose>
            </x:forEach>
            
            <% }
            %>
            <% }%>
    </fieldset>
</body>
</html>