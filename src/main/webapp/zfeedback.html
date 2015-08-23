<%@page import="configuration.StaticReferences"%>
<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else {

%>    

<html>
<head>
<!-- Test -->
<link rel="stylesheet" type="text/css" href="/css/result-light.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/css/foundation.min.css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.1/js/foundation.min.js"></script><meta class="foundation-data-attribute-namespace"><meta class="foundation-mq-xxlarge"><meta class="foundation-mq-xlarge"><meta class="foundation-mq-large"><meta class="foundation-mq-medium"><meta class="foundation-mq-small"><style></style>
<style type="text/css">
@media only screen and (max-width: 40em) {
.title-area {
}
.name {
}
.name img {
        height:35px;
        margin-top:5px;
        margin-left:5px;
}
}
.name img {
margin-left:20px;

}
</style>

<script type="text/javascript">//<![CDATA[
$(window).load(function(){
$(document).foundation();
});//]]> 
</script>
<meta class="foundation-mq-topbar">
<!-- Test -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-2.0.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="ISO-8859-1">


<!-- Title bar - Title of page -->
<title>Smart Speech Therapist</title>		
</head>
<body>


<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
	<div data-role="panel" id="panel-1" data-theme="b">
		<ul data-role="listview" id="listview-1">
			<li><a href="" onclick="location.href='success.jsp'">Home</a></li>
			<li><a href="#">Configurations</a></li>
			<li><a href="#page-2">Help</a></li>		
			<li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>					
		</ul>
</div>

<!-- Top bar -->	
	<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
<ul class="title-area">
<li class="name">
<a href="#panel-1" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
    <a href="#"><img src="img/ssts_logo_150px.png" ></a>
</li>
 <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
<li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
</ul>

<section class="top-bar-section">
<!-- Right Nav Section -->
<ul class="right">
  <li class="active"><a href="#"><%=session.getAttribute(StaticReferences.ssnUserlogindisplay)%></a></li>
  <li class="has-dropdown not-click">
    <a href="#">Account</a>
    <ul class="dropdown"><li class="title back js-generated"><h5><a href="javascript:void(0)">Back</a></h5></li>
      <li><a href="" onclick="location.href='logout.jsp'">Log Out</a></li>
    </ul>
  </li>
</ul>
</section></nav>
	</div>	
	
	
<!-- White Paragraph  -->					
	<div data-role="content">		

<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Feedback</h4>		
	<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please tell me what do you think. Any kind of feed back is highly appreciated.</p>
	

		<form method="post" action="feedback.jsp">
<div class="ui-field-contain">
	<select name="select-fbtype" data-iconpos="right">
		<option  value="idea" >Idea</option>
		<option value="problem">Problem</option>
		<option value="question">Question</option>
	</select>
</div>				
			<div class="ui-field-contain">
				<textarea name="textarea-fb" data-clear-btn="true" placeholder="Your Feedback" cols="40" rows="8" required></textarea>
				<div class="ui-field-contain">

					<input name="text-fbcat" data-clear-btn="true" value="" placeholder="Category: Eg. UI / Speech / Login" type="text" required/>
				</div>
			</div>
			<button id="button-1" class="ui-btn ui-corner-all ui-btn-a" type="submit">Submit feedback</button>
		</form>

	</div>	
	</div>	
		
<%
// session.setAttribute("redirect", "feedback.jsp"); 
//     session.setAttribute("spout", spOut); 
//    session.setAttribute("spin", spIn);    
// response.setHeader("refresh", "1");
// response.sendRedirect("redirect.jsp");  

String fbType = request.getParameter("select-fbtype");
String fbText = request.getParameter("textarea-fb");
String fbCatrgory = request.getParameter("text-fbcat");
String userID = session.getAttribute(StaticReferences.ssnUserid).toString();

// If null inputs are received
if ((fbType == null || fbText == null || fbCatrgory == null)) {%>

Either of the input/s are missing.

<%
// If inputs are filled
} else { 
    //Insert Feedback record to Feedback Table
	try{
	String SQL = ("INSERT INTO ssts.feedback (user_id, fb_type, fb_category, message) VALUES("+userID+", '"+fbType+"', '"+fbCatrgory+"', '"+fbText+"')");
	DatabaseConnection.getInstance().insertValues(SQL);
	}catch(Exception e){
	out.println("There was a problem in updating log records in the Database. Please try again later. Problem: "+e);
	}     

%>	

Thank you very much for your valuable feed back.

<%
}
%>				
		
		
		
<!-- footer -->
	<div data-role="footer" data-theme="b">
		<h4>-</h4>
	</div>
</div>		

<!-- Dialog box if needed -->
<div data-role="page" data-dialog="true" id="dialog-feedbacksuccess" data-theme="b">
	<div data-role="header">
		<h1>Feedback received</h1>
	</div>
	<div data-role="content" data-theme="a">
		<h6>Thank you very much for your valuable feed back. I will be working on it soon.<b>-Yasas De Silva</b></h6>
		<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
	</div>
</div>		

</body>
</html> 
	
<%
    }
%>