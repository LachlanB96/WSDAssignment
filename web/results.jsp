<%@page import="java.time.temporal.TemporalAccessor"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="ass.wsd.dom.*"%>
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
    <center><h1>Flight Center</h1></center>
        <%
            boolean loggedIn = false;
            if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
                loggedIn = true;
        %> 
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
    <% } else {

    %> 
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
    <% }%> 

    <h2>Results</h2>
    <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page">
        <form method="GET" action="makeBooking.jsp">
            <%
                String[] searchFilters = new String[5];
                searchFilters[0] = ""; //FlightID
                searchFilters[1] = request.getParameter("origin"); //origin
                searchFilters[2] = request.getParameter("destination"); //destination
                searchFilters[3] = request.getParameter("flightType"); //flightType (eco or business)
                searchFilters[4] = request.getParameter("departureDate"); //departure date
                String htmlTable = results.print("results", application.getRealPath("WEB-INF/flights.xml"), searchFilters, loggedIn);
            %>
            <%= htmlTable%>
            <% if (loggedIn) { %>
            <input type="submit" value="Continue to Next Step" class="btn btn-success btn-outline btn-confirm">
            <% } else { %>
            <a href="login.jsp" class="btn btn-success btn-outline btn-warning">Login to Select Flight</a>
            <% }%>
        </form>

    </jsp:useBean>
    <script type="text/javascript">
        $('.row-select tr').click(function (event) {
            $(".row-select tr").removeClass("selected");
            $(this).toggleClass('selected');
            $(this).find('td input:radio').prop('checked', true);
        });
    </script>
</body>
</html>