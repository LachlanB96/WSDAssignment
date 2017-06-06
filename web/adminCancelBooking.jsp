<%-- 
    Document   : admin
    Created on : 25/04/2017, 10:15:30 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
    <%

        //fetch user ID of the current session
        Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
        //out.println(booking);
        //Booking userBooking = booking.getUserID(request.getParameter("userID"");
        //Use userID to search if the user has a booking and return that booking.
        //out.println(userBooking);
        if (request.getParameter("adminCancel") != null) {
            int requestedUserID = Integer.parseInt(request.getParameter("userID"));
            Booking userBooking = booking.getUserID(requestedUserID);
            booking.removeBooking(userBooking);
            getBooking.updateXML(booking, filePath);
            //Now update numOfSeats in flights to reflect changes
            int flightID = userBooking.getFlightID();
            Flights flight = getFlights.getFlights(); //get flights list
            Flight updateFlight = flight.getFlightID(flightID); //get flight using the flightID
            int numOfSeats = updateFlight.getNumofSeats();
            int newnumofSeats = numOfSeats + 1;
            updateFlight.setNumofSeats(newnumofSeats);
            getFlights.updateXML(flight, filePath1);
            response.sendRedirect("adminCancelBooking.jsp");
        }
    %>
    <fieldset>
        <h2>Cancel Booking</h2>
        <c:import url="WEB-INF/bookings.xsl" var="xslt"/>
        <c:import url="WEB-INF/bookings.xml"
                  var="inputDoc" />
        <x:transform xml="${inputDoc}" xslt="${xslt}"/>
        <form action="adminCancelBooking.jsp" method="get">
            <table>
                <tr></tr>
                <tr></tr>
                <tr><td width="60%">What is the user ID of the booking you will like to cancel?</td></tr>
                <tr><td><input type="text" name="userID"></td></tr>
                <tr><td><input type="submit" value="Cancel" required>  
                        <input type="hidden" name="adminCancel" value="yes"></td></tr>
            </table>
        </form>

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