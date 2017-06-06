<%@page import ="ass.wsd.*"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
     <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Make Booking!</h1>
        <jsp:include page="menu.jsp" />
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=application.getRealPath("WEB-INF/bookings.xml")%>"/>
        </jsp:useBean>
        <jsp:useBean id="getFlights" class="ass.wsd.FlightsApp" scope="application">
            <jsp:setProperty name="getFlights" property="filePath" value="<%=application.getRealPath("WEB-INF/flights.xml")%>"/>
        </jsp:useBean>

        <% if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");%>


    <fieldset>
        <h2>Make Booking</h2>
        <%

            //fetch user ID of the current session
            int userID = user.getID();
            Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
            //out.println(booking);
            Booking userBooking = booking.getUserID(userID); //Use userID to search if the user has a booking and return that booking so it can be edited.
            //out.println(userBooking);

            
            if (request.getParameter("confirm") != null) {
                int bookingID;
                bookingID = (new Random()).nextInt(999);
                int flightID = Integer.parseInt(request.getParameter("flightID")); 
                Flights flight = getFlights.getFlights();
                Flight newFlight = flight.getFlightID(flightID);
                String origin = newFlight.getOrigin();
                String destination = newFlight.getDestination();
                String flightType = newFlight.getFlightType();
                String departureDate = newFlight.getDepartureDate();
                String returnDate = newFlight.getReturnDate();
                String description = newFlight.getDescription();
                
                int numOfSeats = newFlight.getNumofSeats();
                int newnumofSeats = numOfSeats - 1;
                newFlight.setNumofSeats(newnumofSeats);
                
                Booking newBooking = new Booking(userID, flightID, bookingID, origin, destination, flightType, departureDate, returnDate, description);
                booking.addBooking(newBooking);
                            
                getBooking.updateXML(booking);
                getFlights.updateXML(flight);
                response.sendRedirect("viewBookings.jsp");

        } else { %>
        <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page">
            <form method="GET" action="makeBooking.jsp">
                <fieldset>
                    <%
                        String[] searchFilters = new String[5];
                        searchFilters[0] = request.getParameter("flight"); //FlightID
                        searchFilters[1] = ""; //origin
                        searchFilters[2] = ""; //destination
                        searchFilters[3] = ""; //flightType (eco or business)
                        searchFilters[4] = ""; //departure date
                        String htmlTable = results.print("booking", application.getRealPath("WEB-INF/flights.xml"), searchFilters, true);
                    %>
                    <%= htmlTable%>
                    <input type="submit" value="Confirm booking"><input type="hidden" name="confirm" value="yes"><input type="hidden" name="flightID" value="<%=request.getParameter("flight")%>">
                </fieldset>
            </form>
        </jsp:useBean>
        <% }
        } else { %> 
        <h2>Please login to make your booking.</h2>
        <% }%>
    </fieldset>
</body>
</html>
