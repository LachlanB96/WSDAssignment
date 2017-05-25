<%-- 
    Document   : index
    Created on : 23/04/2017, 12:42:29 PM
    Author     : Kieran O'Brien
--%>

<%@page import ="ass.wsd.*"  contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Flight Center - Home</title>
    </head>
    <body>
    <center><h1>Flight Center</h1></center>
    -=======
        <% if (session.getAttribute("user") == null) { %>

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
    <% } else {
        User user = (User) session.getAttribute("user");
-<<<<<<< HEAD
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
-=======
->>>>>>> 529d0d4e5b52713b437d4d2ed5b6a8ce7864cee4
    %>
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

    <% }%>

    <form action="results.jsp" method="get">
        <fieldset>
            <h2>Search for your flight!</h2>
            <table>
                <tr>
                    <td><label class="field" for="origin">Select your location that you will be leaving from: </label></td>
                    <td><select name="origin">
                            <option value="Sydney">Sydney</option>
                            <option value="Melbourne">Melbourne</option>
                            <option value="Brisbane">Brisbane</option>
                            <option value="Canberra">Canberra</option>
                            <option value="Adelaide">Adelaide</option>
                            <option value="Darwin">Darwin</option>
                            <option value="Perth">Perth</option>
                            <option value="Hobart">Hobart</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label class="field" for="destination">Select your destination: </label></td>
                    <td><select name="destination">
                            <option value="Sydney">Sydney</option>
                            <option value="Melbourne">Melbourne</option>
                            <option value="Brisbane">Brisbane</option>
                            <option value="Canberra">Canberra</option>
                            <option value="Adelaide">Adelaide</option>
                            <option value="Darwin">Darwin</option>
                            <option value="Perth">Perth</option>
                            <option value="Hobart">Hobart</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label class="field" for="flight">Select your type of flight: </label></td>
                    <td><input type="radio" name="flight" value="Business" > Business <br>
                        <input type="radio" name="flight" value="Economy" > Economy</td>
                </tr>
                <tr>
                    <td><label class="field" for="depatureDate">Departure date: </label></td>
                    <td><input type="date" name="departureDate"></td>
                </tr>
                <tr>
                    <td><label class="field" for="returnDate">Return date: </label></td>
                    <td><input type="date" name="returnDate"></td>
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
