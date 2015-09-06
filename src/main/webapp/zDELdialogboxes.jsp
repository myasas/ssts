<%@page import="configuration.StaticReferences"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
<title>DialogBoxes</title>		
</head>
<body>

<!-- 	Dialogs -->
	<div data-role="page" data-dialog="true" id="dialog-logoutconfirmation" data-theme="b">
		<div data-role="header">
			<h1>Logout?</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Do you want to log out?</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">No</a>
			<a href="" onclick="location.href='logout.jsp'" class="ui-btn ui-corner-all">Yes</a>
		</div>
	</div>	
	
	<div data-role="page" data-dialog="true" id="dialog-confSaveSuccess" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Sorry, refreshing configuration success page causes loss of existing configuration settings. Kindly apply the settings again !</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		
	
	<div data-role="page" data-dialog="true" id="dialog-confSaveFail" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Failed to save configuration settings. Try again.</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		

	<div data-role="page" data-dialog="true" id="dialog-confReadFail" data-theme="b">
		<div data-role="header">
			<h1>Configuration Settings</h1>
		</div>
		<div data-role="content" data-theme="a">
			<h6>Problem in reading configurations.json. If this is the very first time SSTS is running, please configure the settings.</h6>
			<a href="#dialog-1" class="ui-btn ui-corner-all" data-rel="back">OK</a>
		</div>
	</div>		

</body>
</html>

<%
    }
%>
