<%-- 
    Document   : logout
    Created on : 30/04/2017, 12:22:54 AM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Center</title>
    </head>
    <body>
        <center><h1>Flight Center</h1></center>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in</div>
        <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>
        <form method="post">
            <fieldset>
                <%
                    session.invalidate();
                %>
                <p>You have successfully logged out. Click <a href="index.jsp">here</a> to return to the main page.</p>

            </fieldset>
        </form>
    </body>
</html>
