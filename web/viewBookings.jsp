<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>View Bookings</h1>
        <jsp:include page="menu.jsp" />
        <% if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");%>
        <fieldset>
            <h2>Your booking details:</h2>

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
