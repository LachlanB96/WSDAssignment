<%-- 
    Document   : adminEditBookings
    Created on : 04/06/2017, 10:09:12 PM
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
        <h2>Administrator - Edit Booking</h2>
        <h2>Cancel Booking</h2>
        <c:import url="WEB-INF/bookings.xsl" var="xslt"/>
        <c:import url="WEB-INF/bookings.xml"
                  var="inputDoc" />
        <x:transform xml="${inputDoc}" xslt="${xslt}"/>
        <form action="adminCancelBooking.jsp" method="get">
            <table>
                <tr></tr>
                <tr></tr>
                <tr><td width="60%">What is the user ID of the booking you will like to edit?</td></tr>
                <tr><td><input type="text" name="userID"></td></tr>
                <tr><td><input type="submit" value="Edit">  
                        <input type="hidden" name="adminEdit" value="yes"></td></tr>
            </table>
        </form>
        <%
            
            int userID = user.getID();
            
            Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
            //out.println(booking);
            Booking userBooking = booking.getUserID(userID); //Use userID to search if the user has a booking and return that booking so it can be edited.
            //out.println(userBooking);

            //Do if statement if user id of booking can be found, then they can edit. If not, say make a booking first.
            if (userBooking != null) {             
                int bookingID = userBooking.getBookingID();                
                String origin = userBooking.getOrigin();
                String destination = userBooking.getDestination();
                String flightType = userBooking.getFlightType();
                String departureDate = userBooking.getDepartureDate();
                String returnDate = userBooking.getReturnDate();
                                
                if (request.getParameter("submitted") != null) {
                    String newOrigin = request.getParameter("origin");
                    String newDestination = request.getParameter("destination");
                    String newflightType = request.getParameter("flightType");
                    String newDepartureDate = request.getParameter("departureDate");
                    String newReturnDate = request.getParameter("returnDate");
                    userBooking.setOrigin(newOrigin);
                    userBooking.setDestination(newDestination);
                    userBooking.setFlightType(newflightType);
                    userBooking.setDepartureDate(newDepartureDate);
                    userBooking.setReturnDate(newReturnDate);
                    getBooking.updateXML(booking, filePath);
                    response.sendRedirect("editBookings.jsp");
                }
        %>

        <form action="editBookings.jsp" method="post">
            <table>
                <tr><td width="60%">Booking ID: <%=bookingID%></td></tr>
                <tr><td>Your current booking details:</td><td>What changes to your booking will you like to make?</td></tr>
                <tr><td>Your location that you will be leaving from: <%=origin%></td>
                    <td><select name="origin">
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
                <tr><td>Your destination: <%=destination%></td>
                    <td><select name="destination">
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
                <tr><td>Your type of flight: <%=flightType%></td>
                    <td><input type="radio" name="flightType" value="Business" > Business <br>
                        <input type="radio" name="flightType" value="Economy" > Economy</td>
                </tr>
                <tr><td>Departure Date: <%=departureDate%></td><td><input type="date" name="departureDate"></td></tr>
                <tr><td>Return Date: <%=returnDate%></td><td><input type="date" name="returnDate"></td></tr>
                <tr><td></td><td><input type="submit" value="Save Changes"></td><input type="hidden" name="submitted" value="yes"></tr>
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
