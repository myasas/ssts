<%@page import="configuration.StaticPanels"%>
<%@page import="configuration.StaticReferences"%>
<%@page import="data.DatabaseConnection"%>
<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute(StaticReferences.ssnUserlogin) == null) || (session.getAttribute(StaticReferences.ssnUserlogin) == "")) {
%>
You are not logged in<br/>
<a href="login.html">Please Login</a>
<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeMember)) {
%>
<%=StaticReferences.msgAccessAdminOnly%><br/>


<%} else if(session.getAttribute(StaticReferences.ssnUsertype).toString().equalsIgnoreCase(StaticReferences.uTypeAdmin)) {
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
<%=StaticPanels.homePanelAdmin	 %>

<!-- Top bar -->	
	<div data-role="header" data-theme="b">
<nav class="top-bar" data-topbar="">
<ul class="title-area">
<li class="name">
<a href="#panel-userhome" id="button-1" class="ui-btn ui-icon-bars ui-btn-icon-notext ui-corner-all">MainMenu</a>
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

<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Lesson Management</h4>		
	<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>Please select the lesson type and add/edit lessons.</p>
	
	<div data-role="collapsible-set" id="collapsible-set-lessons" data-collapsed-icon="bars">
		<div data-role="collapsible">
			<h4>Activities</h4>
			<div data-role="collapsible-set" id="collapsible-set-1" data-collapsed-icon="bullets">
				<div data-role="collapsible">
					<h4>Add Acitivity</h4>
		<form method="post" action="managelessons.jsp">
			
			<div class="ui-field-contain">
				<textarea name="textarea-actsession" data-clear-btn="true" placeholder="New Activity" cols="40" rows="8" required></textarea>

			</div>
			<button id="button-1" class="ui-btn ui-corner-all ui-btn-a" type="submit">Save Activity</button>
		</form>
				</div>
				<div data-role="collapsible">
					<h4>Edit Activity</h4>
					<p>Collapsible content.</p>
				</div>
				<div data-role="collapsible">
					<h4>Existing Activities</h4>
					<p>Collapsible content.</p>					
				</div>
			</div>
		</div>
		<div data-role="collapsible">
			<h4>Practice Sessions</h4>
			<div data-role="collapsible-set" id="collapsible-set-2" data-collapsed-icon="bullets">
				<div data-role="collapsible">
					<h4>Add Session</h4>
					<p>Collapsible content.</p>
				</div>
				<div data-role="collapsible">
					<h4>Edit Session</h4>
					<p>Collapsible content.</p>
				</div>
				<div data-role="collapsible">
					<h4>Existing Sessions</h4>
					<p>Collapsible content.</p>
				</div>
			</div>
		</div>
		<div data-role="collapsible">
			<h4>Auto Generated Lessons</h4>
			<div data-role="collapsible-set" id="collapsible-set-3" data-collapsed-icon="bullets">
				<div data-role="collapsible">
					<h4>Edit Lesson</h4>
					<p>Collapsible content.</p>
				</div>
				<div data-role="collapsible">
					<h4>Existing Lessons</h4>
					<p>Collapsible content.</p>
				</div>
			</div>
		</div>
	</div>

	</div>	
	</div>	
		
<%
// session.setAttribute("redirect", "feedback.jsp"); 
//     session.setAttribute("spout", spOut); 
//    session.setAttribute("spin", spIn);    
// response.setHeader("refresh", "1");
// response.sendRedirect("redirect.jsp");  

String actSession = request.getParameter("textarea-actsession");
String addedBy = session.getAttribute(StaticReferences.ssnUserid).toString();
// If null inputs are received
if (actSession == null) {%>

Either of the input/s are missing.

<%
// If inputs are filled
} else { 
    //Insert Feedback record to Feedback Table
	try{
	String SQL = ("INSERT INTO ssts.activity (act_session, added_by, added_on) VALUES('"+actSession+"', "+addedBy+", date(CURRENT_TIMESTAMP))");
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