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
        <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
        <jsp:useBean id="getListings" class="ass.wsd.ListingsApp" scope="application">
            <jsp:setProperty name="getListings" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>

    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li><a href="cusCancelMember.jsp">Account</a></li>
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
        <h2>Your Listing Details:</h2>

        <table border="1">
            <tr>
                <td width="50%">User ID</td>
                <td>Listings - Flight ID</td>
            </tr>
            <% System.out.println(user.getID()); %>
            <c:import url="WEB-INF/listings.xsl" var="xslt"/>
            <c:import url="WEB-INF/listings.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <x:forEach var="tag" select="$output//listings/listing">


                <tr>
                    <td><x:out select="$tag" /></td>
                    <td><x:out select="$tag/*" /></td>
                </tr>

            </x:forEach>
        </table>

        <form action="viewListing.jsp" method="get">
            <table>
                <tr></tr>
                <tr></tr>
                <tr><td width="60%">What is the flight ID of the listing you will like to view?</td></tr>
                <tr><td><input type="text" name="selFlightID" required></td></tr>
                <tr><td><input type="submit" value="View" required>  
                        <input type="hidden" name="viewList" value="yes"></td></tr>
            </table>
        </form>

        <%
            if (request.getParameter("viewList") != null) {
                String useflightID = request.getParameter("selFlightID");
        %>
        <table border="1">
            <c:import url="WEB-INF/flights.xsl" var="xslt"/>
            <c:import url="WEB-INF/flights.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "selflightID" scope = "page" value ="${useflightID}" />
            <x:forEach var="tag" select="$output//flights/flight">
                <x:choose>
                    <x:when select="$tag/id = $selflightID">
                        <tr>
                            <td><x:out select="$tag/origin" /></td>
                            <td><x:out select="$tag/destination" /></td>
                            <td><x:out select="$tag/flightType" /></td>
                            <td><x:out select="$tag/price" /></td>
                            <td><x:out select="$tag/numofSeats" /></td>
                            <td><x:out select="$tag/departureDate" /></td>
                            <td><x:out select="$tag/returnDate" /></td>
                            <td><x:out select="$tag/description" /></td>
                            <td><x:out select="$tag/flightID" /></td>
                        </tr>
                    </x:when>
                </x:choose>
            </x:forEach> 
        </table>
        <% } else { %>
        <p>Flight can not be found. Please try again.</p>
        <% }
        } else { %> 
        <ul>
            <li><a href="javascript:history.go(-1)">Back</a></li>
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
