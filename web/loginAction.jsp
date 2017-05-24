<%-- 
    Document   : loginaction
    Created on : 30/04/2017, 12:13:08 AM
    Author     : Peter Nguyen
--%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center</title>


    </head>

    <body>
        <form method="post">

            <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
            <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="application">
                <jsp:setProperty name="logIn" property="filePath" value="<%=filePath%>"/>
            </jsp:useBean>
            <%
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                Users users = logIn.getUsers();
                User user = users.login(email, password);
            %>
            <%
                    if (user != null) { %> 
            <%
                session.setAttribute("user", user);
                String userName = user.getName();
                String privilege = user.getPrivilege();
            %>
            <center><h1>Flight Center</h1></center>
                <% if (privilege.equals("admin")) {%>
            <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as Administrator - <%= userName%> &lt;<%=email%>&gt; </div>
            <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="admin.jsp">Administrator</a> | <a href="logout.jsp">Logout</a></div>
            <% } else {%>
            <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%=userName%> &lt;<%=email%>&gt; </div>
            <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="booking.jsp">Bookings</a> | <a href="logout.jsp">Logout</a></div>
            <% } %>
            <fieldset>
                <p>Login successful. Click <a href="index.jsp">here</a> to return to the main page.</p>
            </fieldset>

            <% } else { %>
            <center><h1>Flight Center</h1></center>
            <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in</div>
            <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>
            <fieldset>
                <h2>Login not successful!</h2>
                <p>Email or Password is incorrect. Click <a href="login.jsp">here</a> to try again.</p>
            </fieldset>
            <% }
            %>


        </form>
    </body>
</html>
