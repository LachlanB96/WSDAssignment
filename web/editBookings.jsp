<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Edit Booking!</h1>
        <jsp:include page="menu.jsp" />
        <jsp:useBean id="getBooking" class="ass.wsd.BookingsApp" scope="application">
            <jsp:setProperty name="getBooking" property="filePath" value="<%=application.getRealPath("WEB-INF/bookings.xml")%>"/>
        </jsp:useBean>
        <fieldset>
            <h2>Edit Booking</h2>
            <%
                User user = (User) session.getAttribute("user");
                //fetch user ID of the current session
                int userID = user.getID();
                Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
                //out.println(booking);
                Booking userBooking = booking.getUserID(userID); //Use userID to search if the user has a booking and return that booking so it can be edited.
                //out.println(userBooking);

                //Do if statement if user id of booking can be found, then they can edit. If not, say make a booking first.
                if (userBooking != null) {

                    //session.setAttribute("booking", booking);
                    //Booking editBooking = (Booking) session.getAttribute("booking");
                    int bookingID = userBooking.getBookingID();
                    //out.println(bookingID);

                    String origin = userBooking.getOrigin();
                    String destination = userBooking.getDestination();
                    String flightType = userBooking.getFlightType();
                    String departureDate = userBooking.getDepartureDate();
                    String returnDate = userBooking.getReturnDate();
                    //When user changes their booking, they will need to perform search with new parameters. When they go on makeBooking.jsp to make a booking after search, the current booking will be removed on that page and the new changes will be made with the new booking.
                    if (request.getParameter("editButton") != null) {
                        booking.removeBooking(userBooking);
                        getBooking.updateXML(booking);
                        response.sendRedirect("results.jsp");

                    }
            %>

            <form action="editBookings.jsp" method="GET">
                <table>
                    <tr><td width="60%">Booking ID: <%=bookingID%></td></tr>
                    <tr><td>Your current booking details:</td><td>What changes to your booking will you like to make?</td></tr>
                    <tr><td>Your location that you will be leaving from: </td>
                        <td><select name="origin">
                                <option value="<%=origin%>" selected><%=origin%></option>
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
                    <tr><td>Your destination: </td>
                        <td><select name="destination">
                                <option value="<%=destination%>" selected><%=destination%></option>
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
                    <tr><td>Your type of flight: </td>
                        <% if (flightType.equals("Business")) { %>
                        <td><input type="radio" name="flightType" value="Business" checked="checked"> Business <br>
                            <input type="radio" name="flightType" value="Economy" > Economy</td>
                            <% } else { %>
                        <td><input type="radio" name="flightType" value="Business" > Business <br>
                            <input type="radio" name="flightType" value="Economy" checked="checked"> Economy</td>
                            <% }%>

                    </tr>
                    <tr><td>Departure Date: </td><td><input type="date" name="departureDate" value="<%=departureDate%>" required></td></tr>
                    <tr><td>Return Date: <%=returnDate%></td><td><input type="date" name="returnDate" required></td></tr>
                    <tr><td></td><td><input type="submit" value="Save Changes"></td><input type="hidden" name="editButton" value="yes"></tr>
                </table>
            </form>

            <%} else { %>
            <p>No booking can be found. Click <a href="index.jsp">here</a> to search for a flight and make a booking.</p>
            <% }%>
        </fieldset>
    </body>
</html>
