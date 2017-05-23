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
        <title>Flight Center - Home</title>
    </head>
    <body>
        <%
            if (session.getAttribute("user") == null) { %> 

    <center><h1>Flight Center</h1></center>
    <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are not logged in</div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></div>

    <% } else { %> 
    <%
        User user = (User) session.getAttribute("user");
        String userName = user.getName();
        String email = user.getEmail();
        String privilege = user.getPrivilege();

    %>
    <center><h1>Flight Center</h1></center>
        <% if (privilege == "admin") {%>        
    <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as Administrator - <%= userName%> &lt;<%=email%>&gt; </div>
    <div style="text-align: right;"><a href="admin.jsp">Administrator</a> | <a href="logout.jsp">Logout</a></div>
    <p>Click <a href="index.jsp">here</a> to proceed to the main page.</p>
    <% } else {%>
    <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= userName%> &lt;<%=email%>&gt; </div>
    <div style="text-align: right;"><a href="javascript:history.go(-1)">Back</a> | <a href="index.jsp">Main</a> | <a href="booking.jsp">Bookings</a> | <a href="logout.jsp">Logout</a></div>
    <% }
    %>
    <% }
    %> 


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
