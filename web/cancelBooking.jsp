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
        <% String filePath = application.getRealPath("WEB-INF/bookings.xml");%>
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

        <% String filePath1 = application.getRealPath("WEB-INF/flights.xml");%>
        <jsp:useBean id="getFlights" class="ass.wsd.FlightsApp" scope="application">
            <jsp:setProperty name="getFlights" property="filePath" value="<%=filePath1%>"/>
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
        <h2>Cancel Booking</h2>
        <%

            //fetch user ID of the current session
            int userID = user.getID();
            Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
            //out.println(booking);
            Booking userBooking = booking.getUserID(userID); //Use userID to search if the user has a booking and return that booking so it can be edited.
            //out.println(userBooking);

            if (userBooking != null) {
                int bookingID = userBooking.getBookingID();
                String origin = userBooking.getOrigin();
                String destination = userBooking.getDestination();
                String flightType = userBooking.getFlightType();
                String departureDate = userBooking.getDepartureDate();
                String returnDate = userBooking.getReturnDate();

                int flightID = userBooking.getFlightID();

                if (request.getParameter("Cancel") != null) {
                    
                    booking.removeBooking(userBooking);
                    getBooking.updateXML(booking, filePath);
                    Flights flight = getFlights.getFlights(); //get flights list
                    Flight updateFlight = flight.getFlightID(flightID); //get flight using the flightID
                    int numOfSeats = updateFlight.getNumofSeats();
                    int newnumofSeats = numOfSeats + 1;
                    updateFlight.setNumofSeats(newnumofSeats);
                    getFlights.updateXML(flight, filePath1);
                    response.sendRedirect("cancelBooking.jsp");
                }
        %>
        <form action="cancelBooking.jsp" method="post">
            <table>
                <tr><td width="60%">Booking ID: <%=bookingID%></td></tr>
                <tr><td>Your location that you will be leaving from: <%=origin%></td></tr>
                <tr><td>Your destination: <%=destination%></td></tr>
                <tr><td>Your type of flight: <%=flightType%></td></tr>
                <tr><td>Departure Date: <%=departureDate%></td></tr>
                <tr><td>Return Date: <%=returnDate%></td></tr>           
                <tr><td>Would you like to cancel this booking?</td><td><input type="submit" value="Cancel"></td><input type="hidden" name="Cancel" value="yes"></tr>
            </table>

        </form>
        <%} else {%>
        <p>No booking can be found. Click <a href="index.jsp">here</a> to search for a flight and make a booking.</p>
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
        <h2>Please login to cancel your bookings</h2>
        <% }%>
    </fieldset>
</body>
</html>
