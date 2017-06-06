<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Listings</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
        <jsp:useBean id="getListing" class="ass.wsd.ListingsApp" scope="application">
            <jsp:setProperty name="getListing" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>

    <jsp:include page="menu.jsp" />
    <fieldset>
        <h2>Close Listing</h2>
        <p>Here is your current list:</p>
        <table border="1">
            <tr>
                <td width="50%">User ID</td>
                <td>Flight ID</td>
            </tr>
            <c:import url="WEB-INF/listings.xsl" var="xslt"/>
            <c:import url="WEB-INF/listings.xml" var="inputDoc" />
            <x:parse xml="${inputDoc}" var="output"/>
            <c:set var = "userID" scope = "page" value ="${user.getID()}" />
            <c:set value="false" var="atleastOneListing"/>
            <x:forEach var="tag" select="$output//listings/listing">
                <x:choose>
                    <x:when select="$tag/id = $userID">
                        <c:set value="true" var="atleastOneListing"/>

                        <tr>
                            <td><x:out select="$tag/id" /></td>
                            <td><x:out select="$tag/flight" /></td>
                        </tr>
                    </x:when>
                </x:choose>
            </x:forEach> 

        </table>
        <c:if test="${atleastOneListing eq false}">
            <p>No listing can be found. Click <a href="index.jsp">here</a> to search for a flight and start making a list of flights.</p>
        </c:if>

        <form method="GET" action="closeListing.jsp">
            <p>Would you like to close this list?</p>
            <input type="submit" value="Close">
            <input type="hidden" name="Close" value="yes">
        </form>
        <% if (request.getParameter("Close") != null) {
                int reqUserID = user.getID();
                Listings listing = getListing.getListings();
                ArrayList<Listing> closeListings = listing.getListings(reqUserID);
                for (int i = 0; i < closeListings.size(); i++) {
                    listing.removeListing(closeListings.get(i));
                    getListing.updateXML(listing, filePath);

                }
                response.sendRedirect("closeListing.jsp");
        %>


        <% } %>


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
        <h2>Please login to cancel your listings</h2>
        <% }%>
    </fieldset>
</body>
</html>