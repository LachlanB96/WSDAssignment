<%@page import="javax.xml.bind.Marshaller"%>
<%@page import="javax.xml.bind.JAXBContext"%>
<%@page import="ass.wsd.UsersApp"%>
<%@page import="ass.wsd.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registering</title>
        <%! int ID; %>
        <%
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

    </head>
    <body>
        <form method="post">
            <fieldset>
                <%
                    if (users.getUser(email) == null) {%> 
                <center><h1>Flight Center</h1></center>
                <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;">You are logged in as <%= name%> &lt;<%=email%>&gt; </div>
                <div style="text-align: right;"><a href="logout.jsp">Logout</a></div>
                <h2>Welcome <%=name%>!</h2>
                <p>You have now been registered. Click <a href="index.jsp">here</a> to go back.</p>
                <p>Your name is: <%=name%>.</p>
                <p>Your email is: <%=email%>.</p>
                <p>Your password is: <%=password%>.</p>
                <p>Your date of birth is <%=dob%>.</p>
                <p>Your user ID is <%=ID%>.</p>
                <%
                    User user = new User(name, email, password, dob, ID);
                    session.setAttribute("user", user);
                    users.addUser(user);
                    registerApp.updateXML(users, filePath);
                %>
                <% } else { %>
                <p>The email has already been registered.</p>
                <p>Click <a href="register.jsp">here</a> to go back.</p>
                <% }
                %>
            </fieldset>

        </form>
    </body>

</html>