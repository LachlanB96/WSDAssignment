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

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>

    <ul>
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
    <fieldset>
        <h2>Edit Booking</h2>
        <%
            //String ID = request.getParameter("id");
            int userID = user.getID();
            //int userID = Integer.parseInt(request.getParameter("id"));
            //String bookingID = request.getParameter("bookingID");
            //String origin = request.getParameter("origin");
            //String destination = request.getParameter("destination");
            //String flightType = request.getParameter("flightType");
            //String departureDate = request.getParameter("departureDate");
            //String returnDate = request.getParameter("returnDate");
            Bookings booking = getBooking.getBookings();
            Booking userBooking = booking.getUserID(userID);

            //Do if statement if booking id can be found, then they can edit. If not, say make a booking first.
        %>
        <%            if (userBooking != null) { %>
        <%
            //session.setAttribute("booking", booking);
            //Booking editBooking = (Booking) session.getAttribute("booking");
            int bookingID = userBooking.getBookingID();
            String origin = userBooking.getOrigin();
            String destination = userBooking.getDestination();
            String flightType = userBooking.getFlightType();
            String departureDate = userBooking.getDepartureDate();
            String returnDate = userBooking.getReturnDate();
            userBooking.setOrigin(origin);
            userBooking.setDestination(destination);
            userBooking.setFlightType(flightType);
            userBooking.setDepartureDate(departureDate);
            userBooking.setReturnDate(returnDate);
            getBooking.updateXML(booking, filePath);
        %>
        <p>Booking ID = <%=bookingID%></p>
        <form action="editBookings.jsp" method="post">
            <table>
                <tr><td>Select your location that you will be leaving from: </td>
                    <td><select name="origin" value="<%=origin%>">
                            <option value="Sydney">Sydney</option>
                            <option value="Melbourne">Melbourne</option>
                            <option value="Brisbane">Brisbane</option>
                            <option value="Canberra">Canberra</option>
                            <option value="Adelaide">Adelaide</option>
                            <option value="Darwin">Darwin</option>
                            <option value="Perth">Perth</option>
                            <option value="Hobart">Hobart</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Select your destination: </td>
                    <td><select name="origin" value="<%=destination%>">
                            <option value="Sydney">Sydney</option>
                            <option value="Melbourne">Melbourne</option>
                            <option value="Brisbane">Brisbane</option>
                            <option value="Canberra">Canberra</option>
                            <option value="Adelaide">Adelaide</option>
                            <option value="Darwin">Darwin</option>
                            <option value="Perth">Perth</option>
                            <option value="Hobart">Hobart</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Select your type of flight: </td>
                    <td><input type="radio" name="flight" value="Business" > Business <br>
                        <input type="radio" name="flight" value="Economy" > Economy</td>
                </tr>
                <tr><td>Departure Date: </td><td><input type="date" value="<%=departureDate%>" name="departureDate"></td></tr>
                <tr><td>Return Date: </td><td><input type="date" value="<%=returnDate%>" name="returnDate"></td></tr>
                <tr><td></td><td><input type="submit" value="Save"></td></tr>
            </table>
        </form>

        <%} else {%>
        <p>No booking can be found. Click here to search for a flight and make a booking.</p>
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
        <h2>Please login to view your bookings</h2>
        <% }%>
    </fieldset>
</body>
</html>
