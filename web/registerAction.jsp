<%@page import="javax.xml.bind.Marshaller"%>
<%@page import="javax.xml.bind.JAXBContext"%>
<%@page import="ass.wsd.UsersApp"%>
<%@page import="ass.wsd.*"%>
<%@page import="java.util.*"%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles.css">
        <title>Registering</title>
    </head>
    <body>
    <center><h1>Flight Center</h1></center>
    <%     int ID;
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            ID = (new Random()).nextInt(999999);
        %>
        <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
        <jsp:useBean id="registerApp" class="ass.wsd.UsersApp" scope="session">
            <jsp:setProperty name="registerApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%Users users = registerApp.getUsers();%>
    
        <% if (users.getUser(email) == null) {
        User user = new User(name, email, password, dob, ID);
        session.setAttribute("customer", user);
        users.addUser(user);
        registerApp.updateXML(users);
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
    </ul>
    <h2>Welcome <%=name%>!</h2>
    <p>Thank you for registering</p>
    <p>Your name is: <%=name%>.</p>
    <p>Your email is: <%=email%>.</p>
    <p>Your user ID is <%=ID%>.</p>
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
    <h2>Sorry, that email has already been registered.</h2>
    <% } %>
</body>

</html>
