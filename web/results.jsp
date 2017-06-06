<%@page import="java.util.ArrayList"%>
<%@page import="java.time.temporal.TemporalAccessor"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="ass.wsd.dom.*"%>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>View Results</h1>
        <jsp:include page="menu.jsp" />
        <jsp:useBean id="getListing" class="ass.wsd.ListingsApp" scope="application">
            <jsp:setProperty name="getListing" property="filePath" value="<%=application.getRealPath("WEB-INF/listings.xml")%>"/>
        </jsp:useBean>
        <h2>Results</h2>
        <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page" />
        <form method="GET" action="makeBooking.jsp">
            <%
                boolean loggedIn = false;
                if (session.getAttribute("user") != null) {
                    loggedIn = true;
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
            %>
            <input type="submit" value="Continue to Next Step">
            <%
                if (loggedIn && request.getParameter("flightID") != null) {
                    User user = (User) session.getAttribute("user");
                    int ID = user.getID();
                    Listings listing = getListing.getListings();

                    ArrayList<Listing> updateListing = listing.getListings(ID);
                    System.out.println(updateListing);
                    int flightID = Integer.parseInt(request.getParameter("flightID"));

                    //                for (int i = 0; i < results.listFlightIDs.size(); i++) {
                    //                    //DO SOMETHING HERE (ADD FLGIUHT IDS TO LISTING) 92 and 94
                    //                    if (updateListing == null) {
                    //                        Listing newListing = new Listing(ID, results.listFlightIDs.get(i));
                    //                        listing.addListing(newListing);
                    //                        getListing.updateXML(listing, filePath);
                    //                    } else {
                    //                        for (int j = 0; j < updateListing.size(); j++) {
                    //                            updateListing.get(j).setFlightID(results.listFlightIDs.get(i));
                    //                            listing.setList(updateListing);
                    //                            getListing.updateXML(listing, filePath);
                    //                        }
                    //                    }
                    //                }
                } else if (loggedIn && htmlTable.contains("There are no flights that fit the criteria.")) { %>
            <a href="index.jsp" class="btn btn-success btn-outline btn-warning">Click here to return to the main menu</a>
            <% } else if (!loggedIn) { %>
            <a href="login.jsp" class="btn btn-success btn-outline btn-warning">Login to Select Flight</a>
            <% }%>
        </form>
        <% }%>
        <script type="text/javascript">
            $('.row-select tr').click(function (event) {
                $(".row-select tr").removeClass("selected");
                $(this).toggleClass('selected');
                $(this).find('td input:radio').prop('checked', true);
            });
        </script>
    </body>
</html>