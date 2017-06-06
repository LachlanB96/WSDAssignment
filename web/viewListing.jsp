<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
        <jsp:useBean id="getListings" class="ass.wsd.ListingsApp" scope="application">
            <jsp:setProperty name="getListings" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

    <h1>View Listings</h1>
        <jsp:include page="menu.jsp" />
    <fieldset>
        <h2>Your Listing Details:</h2>

        <table border="1">
            <tr>
                <td width="50%">User ID</td>
                <td>Flight ID</td>
            </tr>
            <c:import url="WEB-INF/listings.xsl" var="xslt"/>
            <c:import url="WEB-INF/listings.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "userID" scope = "page" value ="${user.getID()}" />
            <x:forEach var="tag" select="$output//listings/listing">
                <x:choose>
                    <x:when select="$tag/id = $userID">
                        <tr>
                            <td><x:out select="$tag/id" /></td>
                            <td><x:out select="$tag/flight" /></td>
                        </tr>
                    </x:when>
                </x:choose>
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
                session.setAttribute("useFlightID", request.getParameter("selFlightID")); %>
        <table border="1">
            <c:import url="WEB-INF/flights.xsl" var="xslt"/>
            <c:import url="WEB-INF/flights.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "flightID" scope = "page" value = "${useFlightID}" />
            <c:set value="false" var="atleastOneFlight"/>
            <x:forEach var="tag" select="$output//flights/flight">
                <x:choose>
                    <x:when select="$tag/flightID = $flightID">
                        <c:set value="true" var="atleastOneFlight"/>
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
            <c:if test="${atleastOneFlight eq false}">
                <p>Flight can not be found. Please try again.</p>
            </c:if>
        </table>
        <% }
 
        if(session.getAttribute("user") == null) { %> 
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
