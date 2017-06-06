<%@ page pageEncoding="UTF-8" %>
<%@page import="ass.wsd.User"%>


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
    <li><a href="Listing.jsp">Listings</a></li>

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