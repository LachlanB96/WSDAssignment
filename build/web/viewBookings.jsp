<%-- 
    Document   : viewBooking
    Created on : 04/06/2017, 7:43:55 PM
    Author     : Peter Nguyen
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Bookings</title>
    </head>
    <body>

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>

    <ul>
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
    <fieldset>
        <table border="1">

            <c:import url="WEB-INF/bookings.xsl" var="xslt"/>
            <c:import url="WEB-INF/bookings.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "userID" scope = "page" value ="${user.getID()}" />
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
        </table>


        <% } else { %> 
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li class="dropdown">
                <a href="login.jsp" class="dropbtn">You are not logged in</a>
                <div class="dropdown-content">
                    <a href="login.jsp">Login</a>
                    <a href="register.jsp">Register</a>
                </div>
            </li>
        </ul>
        <h2>Please login to view your bookings</h2>
        <% }%>
    </fieldset>
</body>
</html>
