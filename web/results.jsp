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
