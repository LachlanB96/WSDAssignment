
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page">
        <form method="GET" action="makeBooking.jsp">
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
            <input type="submit" value="Confirm booking" class="btn btn-success btn-outline btn-confirm">
        </form>

    </jsp:useBean>
    </body>
</html>
