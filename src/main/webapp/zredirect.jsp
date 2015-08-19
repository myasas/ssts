<%@page import="configuration.StaticReferences"%>
<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>


<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>

<!-- This else if Not working -->
<%} else if(session.getAttribute(StaticReferences.ssnUsertype.toString()) == StaticReferences.uTypeAdmin){ %>	
You are an admin ! Wowww :D
<!-- This else if Not working -->
<%} else if(session.getAttribute("nextpage") == null){ %>	
No redirect page
<% }else { 
    response.sendRedirect(session.getAttribute("nextpage").toString());
    }
%>