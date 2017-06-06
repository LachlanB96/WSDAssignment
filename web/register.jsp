<%-- 
    Document   : register
    Created on : 17/03/2017, 3:22:02 PM
    Author     : kieran
--%>
<%@page import ="ass.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="metaHead.jsp" />
    <body>
        <h1>Registration!</h1>
        <jsp:include page="menu.jsp" />
        <form action="registerAction.jsp" method="post">
            <fieldset>
                <h2>Register</h2>
                <table>
                    <tr>
                        <td><label class="field" for="name">Full name</label></td>
                        <td><input type="text" name="name" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="email">Email</label></td>
                        <td><input type="email" name="email" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="password">Password</label></td>
                        <td><input type="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td><label class="field" for="dob">Date of Birth: </label></td>
                        <td><input type="date" name="dob" placeholder="01-01-2001" required pattern="[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[0-9]{4}"></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input type="submit" value="Submit">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </body>
</html>
