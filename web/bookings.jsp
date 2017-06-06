<%-- 
    Document   : booking
    Created on : 25/04/2017, 10:14:20 PM
    Author     : Peter Nguyen
--%>

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
            User user = (User) session.getAttribute("user"); %>
    
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
    <h2>Booking</h2>
    <p><a href="makeBooking.jsp">Make a booking</a></p>
    <p><a href="viewBookings.jsp">View a booking</a></p>
    <p><a href="editBookings.jsp">Edit a booking</a></p>
    <p><a href="cancelBooking.jsp">Cancel a booking</a></p>
    <h2>Listing</h2>
    <p><a href="viewListing.jsp">View listing</a></p>
    <p><a href="closeListing.jsp">Close listing</a></p>
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
    <% } %>
    </fieldset>
    </body>
</html>
