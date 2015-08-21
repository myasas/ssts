<%@page import="configuration.StaticReferences"%>


<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>

<%} else if(session.getAttribute("redirect") == null){ %>	
No redirect information. Please go back and retry.
<%=session.getAttribute("redirect")%>

<% }else { 
	String redirect = session.getAttribute("redirect").toString();
    %>    
    <html>
    <head>
      <title>Redirecting</title>
      <META http-equiv="refresh" content="0;URL=<%=redirect%>">
    </head>
    <body>
    </body>
  </html>
<%    
    }
%>