<%-- 
    Document   : booking
    Created on : 25/04/2017, 10:14:20 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Bookings!</h1>
        <jsp:include page="menu.jsp" />

        <% if (session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user"); %>
    
    <fieldset>
    <h2>Booking</h2>
    <p><a href="makeBooking.jsp">Make a booking</a></p>
    <p><a href="viewBookings.jsp">View a booking</a></p>
    <p><a href="editBookings.jsp">Edit a booking</a></p>
    <p><a href="cancelBooking.jsp">Cancel a booking</a></p>
    <% } else { %> 
    <h2>Please login to view your bookings</h2>
    <% } %>
    </fieldset>
    </body>
</html>
