<%-- 
    Document   : viewBooking
    Created on : 04/06/2017, 7:43:55 PM
    Author     : Peter Nguyen
--%>

<%@page import="java.util.stream.Collectors"%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Account</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="session">
        </jsp:useBean>

        <% String filePath1 = application.getRealPath("WEB-INF/flights.xml");%>
        <jsp:useBean id="getFlights" class="ass.wsd.FlightsApp" scope="application">
            <jsp:setProperty name="getFlights" property="filePath" value="<%=filePath1%>"/>
        </jsp:useBean>

        <% String filePath2 = application.getRealPath("WEB-INF/bookings.xml");%>
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=filePath2%>"/>
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
    <% if (request.getParameter("cancelMem") != null) {
            //System.out.print("TEST");
            //System.out.print(logIn.getUsers());
            Users deleteUser = logIn.getUsers();
            deleteUser.removeUser(user);
            logIn.updateXML(deleteUser);
            //Cancel booking if user has it.
            Bookings booking = getBooking.getBookings();
            int userID = user.getID();
            Booking userBooking = booking.getUserID(userID);
            
            if (userBooking != null) {
                booking.removeBooking(userBooking);
                getBooking.updateXML(booking, filePath2);
                //Now update numOfSeats
                int flightID = userBooking.getFlightID();
                Flights flight = getFlights.getFlights(); //get flights list
                Flight updateFlight = flight.getFlightID(flightID); //get flight using the flightID
                int numOfSeats = updateFlight.getNumofSeats();
                int newnumofSeats = numOfSeats + 1;
                updateFlight.setNumofSeats(newnumofSeats);
                getFlights.updateXML(flight, filePath1);

            }
    %> <jsp:setProperty name="logIn" property="filePath" value="<%=filePath%>"/> <%
            response.sendRedirect("logout.jsp");
        }%>
    <fieldset>
        <h2>Cancel Membership</h2>
        <form action="cusCancelMember.jsp" method="post">
            <table>
                <tr><td>Would you like to cancel your membership with Flight Center?</td></tr>
                <tr><td><input type="submit" value="Yes">  
                        <input type="hidden" name="cancelMem" value="yes"></td></tr>
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
        <h2>Please login.</h2>
        <% }%>
    </fieldset>

</body>
</html>
