<%-- 
    Document   : developer
    Created on : 07/06/2017, 2:11:58 AM
    Author     : lachlan
--%>

<%@page import="ass.wsd.User"%>
<%@page import="ass.wsd.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="application">
            <jsp:setProperty name="logIn" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <%
            String email = "r@r.r";
            String password = "r";
            Users users = logIn.getUsers();
            User user = users.login(email, password);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        %>
        <h1>Hello World!</h1>
    </body>
</html>
