<%@page import="model.Feedback"%>
<%@ page import ="dao.FeedbackDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import ="controller.UserController" %>
<%@page import="configuration.StaticReferences"%>
<%@page import="configuration.StaticPanels"%>

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


<%  FeedbackDAO dao = new FeedbackDAO(); %>

<!DOCTYPE html>  
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
    
<!-- Test -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- Title bar - Title of page -->
<title>Smart Speech Therapist</title>		
</head>
<body>


	<div data-role="page" id="page-1" data-theme="a">
<!-- Left panel -->	
<%=StaticPanels.homePanelAdmin %>

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
	

	<h4 id="heading-1" class="ui-bar ui-bar-a ui-corner-all" align="left">Hi <%=session.getAttribute(StaticReferences.ssnUsername)%></h4>
	
		<div data-role="content"  class="ui-body ui-body-a ui-corner-all" >
		<p>As a start, would you like to check out the following reports available? </p>

<a href=""  onclick="location.href='userreportsfeedback.jsp'" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ">Feedback Received</a>
<a href=""  onclick="location.href='userreportsupupdatehistory.jsp'" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ">Profile Update History</a>
<a href=""  onclick="location.href='userreportsloginhistory.jsp'" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ">Login History</a>
<a href=""  onclick="location.href='userreportsloginattempt.jsp'" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ">Login Attempts</a>
<a href=""  onclick="location.href='userreportspwrequest.jsp'" class="ui-btn ui-corner-all ui-alt-icon ui-shadow ">Password Request History</a>		
		
     
		</div>	
		</div>		
<!-- footer -->
		<div data-role="footer" data-theme="b">
			<h4>-</h4>
		</div>
	</div>		


<!-- Dialog box if needed -->
	<div data-role="page" data-dialog="true" id="dialog-1" data-theme="b">
		<div data-role="header">
			<h1>Dialog Title</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Dialog content</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
</body>
</html> 

<%
    }
%>