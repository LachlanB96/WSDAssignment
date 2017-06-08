<%-- 
    Document   : viewBooking
    Created on : 04/06/2017, 7:43:55 PM
    Author     : Peter Nguyen
--%>

<%@page import="java.util.stream.Collectors"%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Cancel Membership!</h1>
        <jsp:include page="menu.jsp" />
        <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="application">
            <jsp:setProperty name="logIn" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <jsp:useBean id="getFlights" class="ass.wsd.FlightsApp" scope="application">
            <jsp:setProperty name="getFlights" property="filePath" value="<%=application.getRealPath("WEB-INF/flights.xml")%>"/>
        </jsp:useBean>
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=application.getRealPath("WEB-INF/bookings.xml")%>"/>
        </jsp:useBean>

        <% if (request.getParameter("cancelMem") != null) {
                User user = (User) session.getAttribute("user");
                Users deleteUser = logIn.getUsers();
                deleteUser.removeUser(user);
                logIn.updateXML(deleteUser);
//                //Cancel booking if user has it.
//                Bookings bookings = getBooking.getBookings();
//                int userID = user.getID();
//                Booking userBooking = bookings.getUserID(userID);
//                if (userBooking != null) {
//                    bookings.removeBooking(userBooking);
//                    getBooking.updateXML(bookings);
//                    //Now update numOfSeats
//                    int flightID = userBooking.getFlightID();
//                    Flights flight = getFlights.getFlights(); //get flights list
//                    Flight updateFlight = flight.getFlightID(flightID); //get flight using the flightID
//                    int numOfSeats = updateFlight.getNumofSeats();
//                    int newnumofSeats = numOfSeats + 1;
//                    updateFlight.setNumofSeats(newnumofSeats);
//                    getFlights.updateXML(flight);
//
//                }
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
        </fieldset>
    </body>
</html>
