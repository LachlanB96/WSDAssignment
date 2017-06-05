<%-- 
    Document   : index
    Created on : 23/04/2017, 12:42:29 PM
    Author     : Kieran O'Brien
--%>

<%@page import ="ass.wsd.*"  contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Home</title>
    </head>
    <body>
    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") == null) { %>

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
        <!--<li class="right"><a href="bookings.jsp">Bookings</a></li>-->
    </ul>
    <% } else {
        User user = (User) session.getAttribute("user");
    %>
    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li><a href="cusCancelMember.jsp">Account</a></li>
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

    <% }%>

    <fieldset>
        <h2>Error!</h2>
        <p>Click <a href="index.jsp">here</a> to return to the main page.</p>
    </fieldset>

</body>

</html>
