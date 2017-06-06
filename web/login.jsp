<%-- 
    Document   : Login
    Created on : 25/04/2017, 9:56:30 PM
    Author     : Peter Nguyen
--%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="metaHead.jsp" />
    <body>
        <h1>Log In!</h1>
        <jsp:include page="menu.jsp" />
        <jsp:useBean id="logIn" class="ass.wsd.UsersApp" scope="session">
            <jsp:setProperty name="logIn" property="filePath" value="<%=application.getRealPath("WEB-INF/users.xml")%>"/>
        </jsp:useBean>
        <fieldset>
            <% if (request.getParameter("submitted") != null) {
                    Users users = logIn.getUsers();
                    User user = users.login(request.getParameter("email"), request.getParameter("password"));

                    if (user != null) {
                        session.setAttribute("user", user);
                        response.sendRedirect("index.jsp");
                    }
            %>
            <h2>No user found, please try again</h2>
            <% }%>
            <form action="login.jsp" method="post">
                <h2>Login</h2>
                <table>
                    <tr>
                        <td><label class="field" for="Email">Email</label></td>
                        <td><input type="email" name="email"></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input type="submit" value="Login">  
                            <input type="hidden" name="submitted" value="yes">
                        </td>
                    </tr>
                </table>
            </form>
        </fieldset>
    </body>
</html>
