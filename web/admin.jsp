<%-- 
    Document   : admin
    Created on : 25/04/2017, 10:15:30 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Center - Administrators</title>
    </head>

    <% if (session.getAttribute("user") == null) { %>

    <body>
        <center><h1>Flight Center</h1></center>
        <div class="banner">You are not logged in</div>
        <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>


        <% } else { %>

        <%   
            User user = (User) session.getAttribute("user");
            String userName = user.getName();
            String email = user.getEmail();
        %>

        <center><h1>Flight Center</h1></center>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= userName%> &lt;<%=email%>&gt; </div>
        <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="logout.jsp">Logout</a></div>



        <% }%>

        <form method="post">
            <fieldset>
                <h2>Administrator</h2>
            </fieldset>
        </form>
    </body>
</html>
