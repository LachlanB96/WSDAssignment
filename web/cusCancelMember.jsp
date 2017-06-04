<%-- 
    Document   : viewBooking
    Created on : 04/06/2017, 7:43:55 PM
    Author     : Peter Nguyen
--%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Account</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="cancel" class="ass.wsd.UsersApp" scope="application">
            <jsp:setProperty name="cancel" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>

    <center><h1>Flight Center</h1></center>
        <% if (session.getAttribute("user") != null) {
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
    <% if (request.getParameter("cancelMem") != null) {
        Users deleteUser = cancel.getUsers();
        deleteUser.removeUser(user);
        cancel.updateXML(deleteUser);
        response.sendRedirect("logout.jsp");
        }%>
    <fieldset>
        <h2>Cancel Membership</h2>
        <form action="cusCancelMember.jsp" method="post">
            <table>
                <tr><td>Would you like to cancel your membership with Flight Center?</td></tr>
                <tr><td><input type="submit" value="Yes">  
                        <input type="hidden" name="cancelMem" value="yes"></td></tr>
            </table>
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
        <h2>Please login.</h2>
        <% }%>
    </fieldset>
</body>
</html>