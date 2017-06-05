<%-- 
    Document   : newIndex
    Created on : 05/06/2017, 5:12:45 PM
    Author     : lachlan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>



<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="formHandler" class="ass.wsd.FormHandler" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
<jsp:setProperty name="formHandler" param="origin" property="origin"/>
</jsp:useBean>
<% 
   if (formHandler.validate()) {
%>
<jsp:forward page="results.jsp" />
<%
   }  else {
%>
<jsp:forward page="newIndex.jsp" />
<%
   }
%>



<t:templatePage>
    <jsp:attribute name="title">
        <title>Home</title>
    </jsp:attribute>
    <jsp:attribute name="header">
        <h1>Flight Center</h1>
    </jsp:attribute>
    <jsp:body>
        <h2>Search for your flight!</h2>
        <form action="results.jsp" method="get" onsubmit="return validate();">
            <div class="form-group row">
                <label for="origin" class="col-sm-2 col-form-label">Departing from: </label>
                <div class="col-sm-10">
                    <select name="origin" id="origin">
                        <option value="Sydney" selected>Sydney</option>
                        <option value="Melbourne">Melbourne</option>
                        <option value="Brisbane">Brisbane</option>
                        <option value="Canberra">Canberra</option>
                        <option value="Adelaide">Adelaide</option>
                        <option value="Darwin">Darwin</option>
                        <option value="Perth">Perth</option>
                        <option value="Hobart">Hobart</option>
                    </select>

        
        <h2>Search for your flight!</h2>
        
        <form action="validateFlightSearch.jsp" method="get">
            <div class="form-group row">
                <label for="origin" class="col-sm-2 col-form-label">Departing from: </label>
                <div class="col-sm-10">
                    <input type="text" name="origin" value='${formHandler.getOrigin()}'>

                </div>
            </div>
            <div class="form-group row">
                <label for="destination" class="col-sm-2 col-form-label">Departing from: </label>
                <div class="col-sm-10">

                    <select name="destination" id="destination">
                        <option value="Sydney">Sydney</option>
                        <option value="Melbourne" selected>Melbourne</option>
                        <option value="Brisbane">Brisbane</option>
                        <option value="Canberra">Canberra</option>
                        <option value="Adelaide">Adelaide</option>
                        <option value="Darwin">Darwin</option>
                        <option value="Perth">Perth</option>
                        <option value="Hobart">Hobart</option>
                    </select>

                    <input type="text" name="destination" value='${formHandler.getDestination()}'>

                </div>
            </div>
            <fieldset class="form-group row">
                <legend class="col-form-legend col-sm-2">Flight Type: </legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="flightType" value="Business" checked>
                            Business
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="flightType" value="Economy">
                            Economy
                        </label>
                    </div>
                </div>
            </fieldset>
            <div class="form-group row">
                <label for="departureDate" class="col-sm-2 col-form-label">Departure date: </label>
                <div class="col-sm-10">
                    <input type="date" name="departureDate" id="departureDate" value="2017-05-30">
                </div>
            </div>
            <div class="form-group row">
                <label for="returnDate" class="col-sm-2 col-form-label">Return Date: </label>
                <div class="col-sm-10">
                    <input type="date" name="returnDate" id="returnDate" value="2017-06-01">
                </div>
            </div>
            <div class="form-group row">
                <div class="offset-sm-2 col-sm-10">
                    <button type="submit" class="btn btn-primary btn-block btn-outline">Search</button>
                </div>
            </div>
        </form>
        <script type="text/javascript">
            function validate(){
                var departureDate = document.getElementById("departureDate");
                var origin = document.getElementById("origin");
                var destination = document.getElementById("destination");
                var valid = true;
                if (origin.value == destination.value) {
                    alert("Departure and Origin are the same place!");
                    valid = false;
                } else if (departureDate.value.length <= 0) {
                    alert("Put in a Departure Date!");
                    valid = false;
                }
                return valid;
            };
        </script>
    </jsp:body>

</t:templatePage>