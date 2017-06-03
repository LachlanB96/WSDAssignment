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
            if (session.getAttribute("user") != null) {
                User user = (User) session.getAttribute("user");
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
    <% }%> 

    <h2>Results</h2>
    <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page">
        <form method="GET" action="make_booking.php">
            <%
                String htmlTable = results.print(application.getRealPath("WEB-INF/flights.xml"), request.getParameter("destination"));
            %>
            <%= htmlTable%>
            <input type="submit" value="Continue to Next Step" class="btn btn-success btn-outline btn-confirm">
        </form>
        
    </jsp:useBean>
</body>
</html>