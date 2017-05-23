<%-- 
    Document   : booking
    Created on : 25/04/2017, 10:14:20 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Center - Bookings</title>
    </head>
    <% if (session.getAttribute("user") == null) { %>

    <body>
        <center><h1>Flight Center</h1></center>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in</div>
        <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>


        <% } else { %>

        <%
            User user = (User) session.getAttribute("user");
            String userName = user.getName();
            String email = user.getEmail();
        %>
        <center><h1>Flight Center</h1></center>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= userName%> &lt;<%=email%>&gt; </div>
        <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="booking.jsp">Bookings</a>|<a href="logout.jsp">Logout</a></div>
        <% }%>

        <form method="post">
            <fieldset>
                <h2>Booking</h2>
                <ul>
                    <li>Make a booking</li>
                    <li>View bookings</li>
                    <li>Edit bookings</li>
                    <li>Cancel a booking</li>
                </ul>

            </fieldset>
        </form>
    </body>
</html>