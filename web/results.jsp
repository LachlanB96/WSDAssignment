<<<<<<< HEAD
<%-- 
    Document   : results
    Created on : 25/04/2017, 10:14:07 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Results</title>
    </head>
        <%
        if (session.getAttribute("user") == null) { %> 
    <center><h1>Flight Center</h1></center>
    <div class="banner"><p class="alignright">You are not logged in</p><div style="clear: both;"></div></div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>
    <% } else { %> 
    <%
        User user = (User) session.getAttribute("user");
        String userName = user.getName();
        String email = user.getEmail();
        String privilege = user.getPrivilege();
        System.out.println(privilege);
    %>
    <center><h1>Flight Center</h1></center>
        <% if (privilege.equals("admin")) {%> 
    <div class="banner"><p class="alignright">You are logged in as Administrator - <%= userName%> &lt;<%=email%>&gt;</p><div style="clear: both;"></div></div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="admin.jsp">Administrator</a> | <a href="logout.jsp">Logout</a></div>
    <% } else {%>
    <div class="banner"><p class="alignright">You are logged in as <%= userName%> &lt;<%=email%>&gt; </p><div style="clear: both;"></div></div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="booking.jsp">Bookings</a> | <a href="logout.jsp">Logout</a></div>
    <% }
    %>
    <% }
    %>  
    <form method="post">
        <fieldset>
            <h2>Results</h2>

        </fieldset>
    </form>
</body>
</html>
=======
<%-- 
    Document   : results
    Created on : 25/04/2017, 10:14:07 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Results</title>
    </head>
    <body>
        <center><h1>Flight Center</h1></center>
        <%
            if (session.getAttribute("user") != null) {
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
    </body>
</html>
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
