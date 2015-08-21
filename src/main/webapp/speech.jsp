<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.InputVoiceController"%>

 
    
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">
    


<title>Smart Speech Therapist</title>		
</head>
<body>

	<div data-role="page" id="page-1" data-theme="c">
		<div data-role="header" data-theme="a">

			<h1 id="heading-1" class="ui-bar ui-bar-a ui-corner-all">Smart Speech Therapist</h1>
			
		</div>
		
		<form >		
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
			<p>Please click the microphone icon when you are ready. Then read the paragraph below.</p>
			
			<p>Please read this out loud :</p>
			<textarea rows="4" cols="50" name="paratoread" readonly>"My mom and I are very best friends. We even goto shopping together."</textarea>
			<br>
			<p>Speech Output :</p>
<div class="si-wrapper">
	<textarea name=speechoutput rows="4" cols="50" class="si-input" placeholder="Please read the text" ></textarea>
	<a href="" class="si-btn ui-btn ui-icon-grid ui-btn-icon-left ui-corner-all ui-btn-b"><span class="si-mic"></span> <span class="si-holder"></span></a>
</div>		
		<input type="Submit" value="Finished !" onclick="location.href='redirect.jsp'" />
		<a href="#page-2">Help</a>		
</div>
		
		</form>
<script src="js/speech-input.js"></script>			
		
<%
String spIn = request.getParameter("paratoread");
String spOut = request.getParameter("speechoutput");

if (spOut == null) {
// myText is null when the page is first requested, 
// so do nothing
} else { 
if (spOut.length() == 0) {
// There was a querystring like ?myText=
// but no text, so myText is not null, but 
// a zero length string instead.
%>
<b>spOut is empty</b>
<% } else { 
   session.setAttribute("redirect", "speech.jsp#page-2"); 
   session.setAttribute("spout", spOut); 
   session.setAttribute("spin", spIn);    
   response.setHeader("refresh", "1");
   response.sendRedirect("redirect.jsp");   
%>
<b>spOut is <%= spOut %></b>
<%
}
}
%>	
		
		<div data-role="footer" data-theme="a">
			<h4>-</h4>
		</div>
	</div>		
		
		
<br>


<div data-role="page" id="page-2">
	<div data-role="header">
		<h1>Page 2</h1>
	</div>
	<div data-role="content">

		<p>spIn is <%= session.getAttribute("spin") %></p>		
		<p>spOut is <%= session.getAttribute("spout") %></p>
						

								
	</div>
	<div data-role="footer">
		<h4>Page Footer</h4>
	</div>
</div>



		





</body>
</html> 