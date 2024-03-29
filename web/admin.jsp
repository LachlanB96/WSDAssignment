<%-- 
    Document   : admin
    Created on : 25/04/2017, 10:15:30 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Administrators</title>
    </head>

    <% if (session.getAttribute("user") == null) { %>

    <body>
    <center><h1>Flight Center</h1></center>
    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>

        <li class="dropdown">
            <a href="login.jsp" class="dropbtn">You are not logged in</a>
            <div class="dropdown-content">
                <a href="login.jsp">Login</a>
            </div>
        </li>
    </ul>
    <h2>Please login</h2>

    <% } else {
            User user = (User) session.getAttribute("user");%>

    <center><h1>Flight Center</h1></center>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
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
        <h2>Administrator</h2>
        <p><a href="adminViewBookings.jsp">View all bookings</a></p>
        <p><a href="adminViewDetails.jsp">View all booking details</a></p>
        <p><A href="adminEditBookings.jsp">Edit a booking</a></p>
        <p><a href="adminCancelBooking.jsp">Cancel a booking</a></p>
        <p><a href="adminCancelMem.jsp">Cancel a membership</a></p>
    </fieldset>        
    <% }%>
</body>
</html>
