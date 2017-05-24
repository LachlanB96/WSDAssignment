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
</html>
