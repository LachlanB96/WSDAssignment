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
    <center><h1>Flight Center</h1></center>

    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="session">
        <jsp:setProperty name="logIn" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <% if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
    %>
    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
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
        <li><a href="javascript:history.go(-1)">Back</a></li>
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
                    <td><input type="email" name="email" required></td>
                </tr>
                <tr>
                    <td><label class="field" for="password">Password</label></td>
                    <td><input type="password" name="password" required></td>
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
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li class="dropdown">
            <a href="login.jsp" class="dropbtn">You are not logged in</a>
            <div class="dropdown-content">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </li>
    </ul>

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
    <% } %>

    </body>

</html>
