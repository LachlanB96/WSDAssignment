<%@page import ="ass.wsd.*"  contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myFunctions.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="styles.css" />
        <title>Flight Center - Results</title>
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
        <h2>Make Booking</h2>
        <%

            //fetch user ID of the current session
            int userID = user.getID();
            Bookings booking = getBooking.getBookings(); //Use the javabean to fetch the bookings using BookingsApp.java and fetching it from bookings.xml
            //out.println(booking);
            Booking userBooking = booking.getUserID(userID); //Use userID to search if the user has a booking and return that booking so it can be edited.
            //out.println(userBooking);
            

            if (userBooking != null) {
                booking.removeBooking(userBooking);
                getBooking.updateXML(booking, filePath);
                response.sendRedirect("makeBooking.jsp");

                if (request.getParameter("confirm") != null) {
                    //Booking newBooking = new Booking(userID, flightID, bookingID, origin, destination, flightType, departureDate, returnDate, description);
                    //booking.addBooking(newBooking);
                    booking.addBooking(userBooking);
                    getBooking.updateXML(booking, filePath);
                    response.sendRedirect("bookings.jsp");
                }                         
        %>
        <%} else {%>
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
                    <input type="submit" value="Confirm booking" class="btn btn-success btn-outline btn-confirm"><input type="hidden" name="confirm" value="yes">
                </fieldset>
            </form>
        </jsp:useBean>
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
        <h2>Please login to make your booking.</h2>
        <% }%>
    </fieldset>
</body>
</html>
