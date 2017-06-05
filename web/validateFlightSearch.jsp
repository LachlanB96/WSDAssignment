<%-- 
    Document   : validateFlightSearch
    Created on : 05/06/2017, 6:23:10 PM
    Author     : lachlan
--%>

<%@ page import="java.util.*" %>

<jsp:useBean id="formHandler" class="ass.wsd.FormHandler" scope="request">
    <jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<%
    if (formHandler.validate()) {
        response.sendRedirect("results.jsp");
   }  else {
        response.sendRedirect("newIndex.jsp");
   }
%>