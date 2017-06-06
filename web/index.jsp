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
        <% if (session.getAttribute("user") == null) { %>

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
        <!--<li class="right"><a href="bookings.jsp">Bookings</a></li>-->
    </ul>
    <% } else {
        User user = (User) session.getAttribute("user");
    %>
    <ul>
        <li><a href="javascript:history.go(-1)">Back</a></li>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="bookings.jsp">Bookings</a></li>
        <li><a href="cusCancelMember.jsp">Account</a></li>
        <li><a href="viewListing.jsp">Listings</a></li>
        
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

    <form action="results.jsp" method="get" onsubmit="return validate();">
        <fieldset>
            <h2>Search for your flight!</h2>
            <table>
                <tr>
                    <td><label class="field" for="origin">Select your location that you will be leaving from: </label></td>
                    <td><select name="origin" id="origin" required>
                            <option value="Sydney" selected>Sydney</option>
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
                    <td><select name="destination" id="destination" required>
                            <option value="Sydney">Sydney</option>
                            <option value="Melbourne" selected>Melbourne</option>
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
                    <td><label class="field" for="flightType">Select your type of flight: </label></td>
                    <td><input type="radio" name="flightType" value="Business" checked="checked"> Business <br>
                        <input type="radio" name="flightType" value="Economy"> Economy</td>
                </tr>
                <tr>
                    <td><label class="field" for="departureDate">Departure date: </label></td>
                    <td><input type="date" name="departureDate" id="departureDate" value="2017-05-30" required pattern="[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}"></td>
                </tr>
                <tr>
                    <td><label class="field" for="returnDate">Return date: </label></td>
                    <td><input type="date" name="returnDate" value="2017-01-02" required pattern="[0-9]{4}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}"></td>
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

    <script type="text/javascript">
        function validate()
        {
            var departureDate = document.getElementById("departureDate");
            var origin = document.getElementById("origin");
            var destination = document.getElementById("destination");
            var valid = true;
            if (origin.value == destination.value){
                alert("Departure and Origin are the same place!");
                valid = false;
            }
            else if (departureDate.value.length <= 0){
                alert("Put in a Departure Date!");
                valid = false;
            }
            return valid;
        };

    </script>
</body>

</html>
