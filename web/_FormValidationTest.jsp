<HTML>
<HEAD><TITLE>Implicit Object Project</TITLE></HEAD>

<BODY>

<FORM METHOD="GET" ACTION="_FormValidationStream.jsp">

<H2> Streaming file demo </H2>

<TABLE>
<TR>
 <TD> Enter name: </TD>
 <TD> <INPUT TYPE="text" SIZE=60 NAME="a" value='<%if(session.getAttribute("a") != null) session.getAttribute("a");%>'> </TD>
</TR>
<TR>
 <TD> Enter word greater than 5 len: </TD>
 <TD> <INPUT TYPE="text" SIZE=30 NAME="b">
     <% if (session.getAttribute("b") != null){
         %>
         <p style="color: red">More than 5 chars please</p>
    <% } %>
 </TD>
</TR>
</TABLE>

<P>

<INPUT TYPE=submit VALUE="Fetch">
<INPUT TYPE=reset VALUE="Reset">

</FORM>

</BODY>