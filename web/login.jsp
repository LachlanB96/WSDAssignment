<%-- 
    Document   : Login
    Created on : 25/04/2017, 9:56:30 PM
    Author     : Peter Nguyen
--%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Login</title>
    </head>
    <body>
<<<<<<< HEAD
        <%
        if (session.getAttribute("user") == null) { %> 
=======
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
    <center><h1>Flight Center</h1></center>

    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="application">
        <jsp:setProperty name="logIn" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <% if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
<<<<<<< HEAD
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
=======
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
    %>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li class="dropdown">
            <a href="#" class="dropbtn">You are logged in as <%= user.getName()%> &lt;<%= user.getEmail()%>&gt; </a>
            <div class="dropdown-content">
                <a href="logout.jsp">Logout</a>
            </div>
        </li>
        <% if (user.getPrivilege().equals("admin")) { %>
        <li class="right"><a href="admin.jsp">Admin</a></li>  
            <% } %>
    </ul>
    <h2>Hello <%= user.getName()%>, What would you like to do?</h2>
    
    <% } else if (request.getParameter("submitted") != null) { 
        Users users = logIn.getUsers();
        User user = users.login(request.getParameter("email"), request.getParameter("password"));

        if (user != null) {
                session.setAttribute("user", user);
                response.sendRedirect("index.html");
        }
        %>
        <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li class="dropdown">
            <a href="#" class="dropbtn">You are not logged in</a>
            <div class="dropdown-content">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </li>
    </ul>
    <h2>No user found, please try again</h2>
    <form action="login.jsp" method="post">
        <fieldset>
            <h2>Login</h2>
            <table>
                <tr>
                    <td><label class="field" for="Email">Email</label></td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td><label class="field" for="password">Password</label></td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Login">  
                        <input type="hidden" name="submitted" value="yes">
                    </td>
                </tr>
            </table>

        </fieldset>
    </form>

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

<<<<<<< HEAD
    <form action="loginAction.jsp" method="post">
=======
    <form action="login.jsp" method="post">
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
        <fieldset>
            <h2>Login</h2>
            <table>
                <tr>
                    <td><label class="field" for="Email">Email</label></td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td><label class="field" for="password">Password</label></td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Login">  
<<<<<<< HEAD
=======
                        <input type="hidden" name="submitted" value="yes">
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
                    </td>
                </tr>
            </table>

        </fieldset>
    </form>
<<<<<<< HEAD
=======
    <% } %>
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4

</body>

</html>
