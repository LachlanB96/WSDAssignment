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
    <body>
        <center><h1>Flight Center</h1></center>
        
        <% if (session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
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
        <!--<li class="right"><a href="bookings.jsp">Bookings</a></li>-->
    </ul>
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
    <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as Administrator - <%= userName%> &lt;<%=email%>&gt; </div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="admin.jsp">Administrator</a> | <a href="logout.jsp">Logout</a></div>
    <% } else {%>
    <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= userName%> &lt;<%=email%>&gt; </div>
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
>>>>>>> 9190affa96e5b41aecf11f5667fd41cb54f727f7
</html>
