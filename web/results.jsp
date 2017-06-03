<%-- 
    Document   : results
    Created on : 25/04/2017, 10:14:07 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="ass.wsd.dom.*"%>
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
    <jsp:useBean id="results" class="ass.wsd.dom.UsersPrinter" scope="page">
    
    <%
        String htmlTable = results.setFilePath(application.getRealPath("WEB-INF/users.xml"));
        out.println(htmlTable);
    %>
    <%= htmlTable%>
        </jsp:useBean>
</body>
</html>
