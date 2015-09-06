<%@page import="configuration.StaticReferences"%>


<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>

<%} else if(session.getAttribute("redirect") == null){ %>
<h3>Oops! Hi <%=session.getAttribute(StaticReferences.ssnUsername)%>,</h3> 
<p>How is your day? Hope you enjoy using SSTS !</p>
<p>You are seeing this message because I was a bit busy. <strong>Can you please refresh me ? :D </strong></p>
<br>
<ins><strong>How to refresh Me?</strong></ins>
<p><strong>Press button F5 or Click the Refresh icon in the web browser !</strong></p>
<p><em>(Tech Note : No redirect information received. Please refresh the page till you see the expected result.)</em></p>

<p>Thank you!</p>
<p>SSTS.</p>



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