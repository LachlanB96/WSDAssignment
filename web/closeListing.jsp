<%-- 
    Document   : closeListing
    Created on : 06/06/2017, 9:41:29 PM
    Author     : Peter Nguyen
--%>
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

    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li><a href="cusCancelMember.jsp">Account</a></li>
        <li><a href="Listing.jsp">Listings</a></li>
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
            
        <form method="POST" action="closeListing.jsp">
            <table>
                <tr><td>Would you like to close this list?</td><td><input type="submit" value="Close"></td><input type="hidden" name="Close" value="yes"></td></tr>
            </table>
        </form>
        <% if (request.getParameter("Close") != null) {
            int reqUserID = user.getID();
            Listings listing = getListing.getListings();
            Listing closeListing = listing.getListing(reqUserID);
            if (closeListing != null) {
                listing.removeListing(closeListing);
                getListing.updateXML(listing, filePath);
                response.sendRedirect("closeListing.jsp");
            }
        %>


        <%} else {%>
        <p>No listing can be found. Click <a href="index.jsp">here</a> to search for a flight and start making a list of flights.</p>
        <% }
        %>


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