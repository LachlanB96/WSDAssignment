<%@ page isErrorPage="false" %>

<%@ page import="java.io.*" %>
<%
    String inputA = request.getParameter("a");
    String inputB = request.getParameter("b");
    System.out.println(inputA);
    System.out.println(inputB);
    session.setAttribute("a", inputA);
    session.setAttribute("b", inputB);
    System.out.println(inputA);
    System.out.println(session.getAttribute("a"));
%>

<%
    if((inputA != null) && (inputB.length() < 5)) { 
       response.sendRedirect("_FormValidationTest.jsp");
    } else {
        response.sendRedirect("_FormResultsTest.jsp");
    }
%>