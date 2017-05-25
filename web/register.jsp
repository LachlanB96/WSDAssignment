<%-- 
    Document   : register
    Created on : 17/03/2017, 3:22:02 PM
    Author     : kieran
--%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Register</title>
    </head>
<<<<<<< HEAD
        <%
        if (session.getAttribute("user") == null) { %> 
    <center><h1>Flight Center</h1></center>
    <div class="banner"><p class="alignright">You are not logged in</p><div style="clear: both;"></div></div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>
    <% } else { %> 
    <%
=======
    <body>
        <center><h1>Flight Center</h1></center>
        
        <% if (session.getAttribute("user") != null) {
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
        User user = (User) session.getAttribute("user");
    %>
<<<<<<< HEAD
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


    <form action="registerAction.jsp" method="post">
        <fieldset>
            <h2>Register</h2>
            <table>
                <tr>
                    <td><label class="field" for="name">Full name</label></td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td><label class="field" for="email">Email</label></td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td><label class="field" for="password">Password</label></td>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <td><label class="field" for="dob">Date of Birth: </label></td>
                    <td><input type="date" name="dob"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
=======
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
    <h2>You are already registered</h2>
    
    <% } else if (session.getAttribute("user") == null) { %>
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
        <form action="registerAction.jsp" method="post">
            <fieldset>
                <h2>Register</h2>
                <table>
                    <tr>
                        <td><label class="field" for="name">Full name</label></td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="email">Email</label></td>
                        <td><input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="dob">Date of Birth: </label></td>
                        <td><input type="date" name="dob"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Submit">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    <% } %>
    </body>
>>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
</html>
