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
<<<<<<< HEAD
        <title>Logging Out</title>
=======
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center</title>
>>>>>>> 9190affa96e5b41aecf11f5667fd41cb54f727f7
    </head>
    
                <%
                    session.invalidate();
                    response.sendRedirect("index.html");
                %>

</html>
