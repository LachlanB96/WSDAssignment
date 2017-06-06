<%@page import="javax.xml.bind.Marshaller"%>
<%@page import="javax.xml.bind.JAXBContext"%>
<%@page import="ass.wsd.UsersApp"%>
<%@page import="ass.wsd.*"%>
<%@page import="java.util.*"%>

<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Registration!</h1>
        <jsp:include page="menu.jsp" />

        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            int ID = (new Random()).nextInt(999999);
        %>
        <jsp:useBean id="registerApp" class="ass.wsd.UsersApp" scope="session">
            <jsp:setProperty name="registerApp" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <%
            Users users = registerApp.getUsers();
            if (users.getUser(email) == null) {
                User user = new User(name, email, password, dob, ID);
                session.setAttribute("user", user);
                users.addUser(user);
                registerApp.updateXML(users);
                response.sendRedirect("index.jsp");
            } else { %>
        <h2>Sorry, that email has already been registered.</h2>
        <% }%>
    </body>

</html>
