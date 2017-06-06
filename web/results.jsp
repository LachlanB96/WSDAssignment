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
        <% String filePath = application.getRealPath("WEB-INF/listings.xml");%>
        <jsp:useBean id="getListing" class="ass.wsd.ListingsApp" scope="application">
            <jsp:setProperty name="getListing" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%
            boolean loggedIn = false;
            if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
                loggedIn = true;
                int userID = user.getID();
        %> 
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
    <% } else {

    %> 
    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
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
                System.out.println("DEBUG");
                String[] searchFilters = new String[5];
                searchFilters[0] = ""; //FlightID
                searchFilters[1] = request.getParameter("origin"); //origin
                searchFilters[2] = request.getParameter("destination"); //destination
                searchFilters[3] = request.getParameter("flightType"); //flightType (eco or business)
                searchFilters[4] = request.getParameter("departureDate"); //departure date
                String htmlTable = results.print("results", application.getRealPath("WEB-INF/flights.xml"), searchFilters, loggedIn);
                out.println(htmlTable);
                System.out.println(results.listFlightIDs.get(0));
                if (loggedIn) { %>
            <input type="submit" value="Continue to Next Step" class="btn btn-success btn-outline btn-confirm">
            <%
                //results.listFlightIDs.stream().forEach(elem -> System.out.println("element " + elem));
                System.out.println("DEBUG");
                User user = (User) session.getAttribute("user");
                System.out.println(user);
                int ID = user.getID();
                System.out.println(ID);
                Listings listing = getListing.getListings();
                Listing updateListing = listing.getListing(ID);
                //int flightID = Integer.parseInt(request.getParameter("flightID"));

                for (int i = 0; i < results.listFlightIDs.size(); i++) {
                    //DO SOMETHING HERE (ADD FLGIUHT IDS TO LISTING) 92 and 94
                    if (updateListing == null) {
                        Listing newListing = new Listing(ID, results.listFlightIDs.get(i));
                        listing.addListing(newListing);
                        getListing.updateXML(listing, filePath);
                    } else {
                        updateListing.setFlightID(results.listFlightIDs.get(i));
                        getListing.updateXML(listing, filePath);
                    }
                }


            %>
            <% } else if (loggedIn && htmlTable.contains("There are no flights that fit the criteria.")) { %>
            <a href="index.jsp" class="btn btn-success btn-outline btn-warning">Click here to return to the main menu</a>
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