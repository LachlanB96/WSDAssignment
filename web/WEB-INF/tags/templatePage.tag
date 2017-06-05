<%-- 
    Document   : templatePage
    Created on : 05/06/2017, 5:11:34 PM
    Author     : lachlan
--%>

<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="title" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/myFunctions.js"></script>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/style.css" />
        <jsp:invoke fragment="title"/>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <jsp:invoke fragment="header"/>
                <jsp:include page="menu.jsp" />
                <jsp:doBody/>
            </div>   
            <div id="pagefooter">
                <p id="copyright">Group 17 - Web Services Development Autumn 2017</p>
            </div>
        </div>
    </body>
</html>